package com.customerportal.bean;

public class TankAarmHistory {
	private String id;
	private String type;
	private String tank;
	private String runDate;
	private String occuredDate;
	private String facility;
	private String alarmType;
	private String fid;
	private String name;
	private String viewed;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTank() {
		return tank;
	}

	public void setTank(String tank) {
		this.tank = tank;
	}

	public String getRunDate() {
		return runDate;
	}

	public void setRunDate(String runDate) {
		this.runDate = runDate;
	}

	public String getOccuredDate() {
		return occuredDate;
	}

	public void setOccuredDate(String occuredDate) {
		this.occuredDate = occuredDate;
	}

	public String getFacility() {
		return facility;
	}

	public void setFacility(String facility) {
		this.facility = facility;
	}

	public String getAlarmType() {
		return alarmType;
	}

	public void setAlarmType(String alarmType) {
		this.alarmType = alarmType;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setViewed(String viewed) {
		this.viewed = viewed;
	}

	public String getViewed() {
		return viewed;
	}
}
