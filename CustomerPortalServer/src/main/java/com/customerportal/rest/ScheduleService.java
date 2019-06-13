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
import com.customerportal.util.CustomerPortalUtil;
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
		scheduleList = DBUtil.getInstance().getParentSchedulejobs();
		startForFirstTime();
		fetchParentJobs();
	}

	private void startForFirstTime() {
		new Thread(){
			@Override
			public void run() {
				System.out.println("jobs started for one time on server startup.......");
				for (JobSchedule jobSchedule : scheduleList) {
					checkAndExecuteJob(jobSchedule);
				}
			}
		}.start();
		
	}

	private void fetchParentJobs() {
		for (JobSchedule jobSchedule : scheduleList) {
			int milliSeconds = CustomerPortalUtil.getMilliSeconds(jobSchedule.getSchedule());
			startThread(jobSchedule, milliSeconds);
		}
	}

	private void startThread(final JobSchedule jobSchedule, final int milliSeconds) {

		int startMilli = CustomerPortalUtil.getMilliSeconds(jobSchedule.getStartTime());
		Date date = CustomerPortalUtil.atStartOfDay(new Date());
		int currMilli = (int) (date.getTime() - System.currentTimeMillis());
		int acutlMilli = startMilli == 0 ? 1 : startMilli + currMilli;
		if (acutlMilli < 0) {
			date = CustomerPortalUtil.atEndOfDay(new Date());
			currMilli = (int) (date.getTime() - System.currentTimeMillis());
			acutlMilli = startMilli == 0 ? 1 : startMilli + currMilli + 1;
		}
		System.out.println("The Job \"" + jobSchedule.getJobName() + "\" will start at "
				+ new Date(System.currentTimeMillis() + acutlMilli) + "and the interval is (seconds)"
				+ (milliSeconds / 1000));
		Timer t = new Timer();
		t.scheduleAtFixedRate(new TimerTask() {
			@Override
			public void run() {
				System.out.println("The Job \"" + jobSchedule.getJobName() + "\" started at " + new Date());
				checkAndExecuteJob(jobSchedule);

			}

		}, acutlMilli, milliSeconds);
	}

	private void checkAndExecuteJob(final JobSchedule jobSchedule) {
		boolean prefilePresent = false;
		System.out.println(
				"The Job \"" + jobSchedule.getJobName() + "\" the source path is  " + jobSchedule.getSourceFilePath());
		if (jobSchedule.getSourceFilePath() == null || jobSchedule.getSourceFilePath().equalsIgnoreCase(""))
			prefilePresent = true;
		else
			prefilePresent = checkForSourceFilePresent(jobSchedule.getSourceFilePath());
		System.out.println("The Job \"" + jobSchedule.getJobName() + "\" source file exists " + prefilePresent);
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
			int milliSeconds = CustomerPortalUtil.getMilliSeconds(jobSchedule.getSchedule());
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
			System.out.println("The job \" " + jobSchedule.getJobPath() + "\" " + " started at " + new Date());
			process = Runtime.getRuntime().exec(jobSchedule.getJobPath());

			final int exitVal = process.waitFor();
			System.out.println(
					"The job \" " + jobSchedule.getJobPath() + "\" " + " process id is ---" + process.exitValue());
			System.out.println("The job \" " + jobSchedule.getJobPath() + "\" " + " ended at " + new Date());
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

}
