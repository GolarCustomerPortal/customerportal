package com.customerportal.bean;

public class JobSchedule {

	private String jobName;
	private String dependentJobName;
	private String jobPath;
	private String endFilePath;
	private String schedule;
	private boolean recurrence;
	private String sourceFilePath;
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getDependentJobName() {
		return dependentJobName;
	}
	public void setDependentJobName(String dependentJobName) {
		this.dependentJobName = dependentJobName;
	}
	public String getJobPath() {
		return jobPath;
	}
	public void setJobPath(String jobPath) {
		this.jobPath = jobPath;
	}
	public String getEndFilePath() {
		return endFilePath;
	}
	public void setEndFilePath(String endFilePath) {
		this.endFilePath = endFilePath;
	}
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	public boolean isRecurrence() {
		return recurrence;
	}
	public void setRecurrence(boolean recurrence) {
		this.recurrence = recurrence;
	}
	
	public void setSourceFilePath(String sourceFilePath) {
		this.sourceFilePath = sourceFilePath;
	}
	public String getSourceFilePath() {
		return sourceFilePath;
	}

}
