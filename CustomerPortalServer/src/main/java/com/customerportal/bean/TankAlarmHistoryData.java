package com.customerportal.bean;

import java.util.ArrayList;
import java.util.List;

public class TankAlarmHistoryData {
	private String name;
	private int viewCount;
	private int totalCount;
	private List<TankAarmHistory> alarmHistory = new ArrayList<TankAarmHistory>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<TankAarmHistory> getAlarmHistory() {
		return alarmHistory;
	}

	public void setAlarmHistory(List<TankAarmHistory> alarmHistory) {
		this.alarmHistory = alarmHistory;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getViewCount() {
		return viewCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
}
