package com.customerportal.rest;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.customerportal.bean.JobSchedule;
import com.customerportal.bean.JobScheduleHistory;
import com.customerportal.util.DBUtil;

public class ScheduleService extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static List<JobSchedule> scheduleList;

	@Override
	public void init() throws ServletException {
		super.init();
		fetchParentJobs();
	}

	private void fetchParentJobs() {
		scheduleList = DBUtil.getInstance().getParentSchedulejobs();
		for (JobSchedule jobSchedule : scheduleList) {
			int milliSeconds = getMilliSeconds(jobSchedule.getSchedule());
			startThread(jobSchedule, milliSeconds);
		}
	}

	private void startThread(final JobSchedule jobSchedule, final int milliSeconds) {
		Timer t = new Timer();
		t.scheduleAtFixedRate(new TimerTask() {
			@Override
			public void run() {
				checkAndExecuteJob(jobSchedule);

			}

		}, 1, milliSeconds);
	}

	private void checkAndExecuteJob(final JobSchedule jobSchedule) {
		boolean prefilePresent = checkForSourceFilePresent(jobSchedule.getSourceFilePath());
		boolean parentSuccess = false;
		if (prefilePresent) {
			parentSuccess = startTheExecution(jobSchedule);
		}
		if (parentSuccess) {
			handleChildJobs(jobSchedule);
		}
	}

	private void handleChildJobs(final JobSchedule parentJob) {
		List<JobSchedule> scheduleList = DBUtil.getInstance().getChildSchedulejobs(parentJob.getJobName());
		for (JobSchedule jobSchedule : scheduleList) {
			int milliSeconds = getMilliSeconds(jobSchedule.getSchedule());
			try {
				Thread.sleep(milliSeconds);
			} catch (InterruptedException e) {
			}
			checkAndExecuteJob(jobSchedule);
		}

	}

	protected boolean startTheExecution(JobSchedule jobSchedule) {
		Process process;
		try {
			process = Runtime.getRuntime().exec(jobSchedule.getJobPath());
			final int exitVal = process.waitFor();
			if (exitVal == 0) {
				writeOutputFile(jobSchedule.getEndFilePath());
				JobScheduleHistory history = new JobScheduleHistory();
				history.setJobName(jobSchedule.getJobName());
				history.setResult(true);
				history.setJobExeuctionTime(new Date());
				DBUtil.getInstance().writeSchduleHistory(history);
				return true;
			}
		} catch (Exception e) {
		}
			writeOutputFile(jobSchedule.getEndFilePath());
			JobScheduleHistory history = new JobScheduleHistory();
			history.setJobName(jobSchedule.getJobName());
			history.setJobExeuctionTime(new Date());
			history.setResult(false);
			DBUtil.getInstance().writeSchduleHistory(history);
		return false;
	}

	private void writeOutputFile(String endFilePath) {

		if (endFilePath == null)
			return;
		try {
			File file = new File(endFilePath);
			if (!file.exists())
				file.createNewFile();
		} catch (IOException e) {

		}

	}

	protected boolean checkForSourceFilePresent(String sourceFilePath) {
		File file = new File(sourceFilePath);
		if (file.exists())
			return true;
		return false;
	}

	protected int getMilliSeconds(String schedule) {
		if (schedule == null || schedule.equalsIgnoreCase("") || schedule.equalsIgnoreCase("0"))
			return 0;
		String[] minArray = schedule.split(":");
		int milliseconds = 0;
		milliseconds = Integer.parseInt(minArray[0]) * 60 * 60;
		milliseconds += Integer.parseInt(minArray[1]) * 60;
		return milliseconds * 1000;

	}
}
