package com.customerportal.bean;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

public class JobScheduleHistory {
	private String jobName;
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private Date jobExeuctionTime;
	private boolean result;

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getJobExeuctionTime() {
		return jobExeuctionTime;
	}

	public void setJobExeuctionTime(Date jobExeuctionTime) {
		this.jobExeuctionTime = jobExeuctionTime;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public boolean isResult() {
		return result;
	}

}
