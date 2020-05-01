package com.customerportal.bean;

import java.io.Serializable;

public class MonthlyReports implements Serializable {

	private String id;
	private String tankMonitorBrand;
	private String tankMonitorModel;
	private String telnetCode;
	private String externalID;
	private String reportLabel;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTankMonitorBrand() {
		return tankMonitorBrand;
	}
	public void setTankMonitorBrand(String tankMonitorBrand) {
		this.tankMonitorBrand = tankMonitorBrand;
	}
	public String getTankMonitorModel() {
		return tankMonitorModel;
	}
	public void setTankMonitorModel(String tankMonitorModel) {
		this.tankMonitorModel = tankMonitorModel;
	}
	public String getTelnetCode() {
		return telnetCode;
	}
	public void setTelnetCode(String telnetCode) {
		this.telnetCode = telnetCode;
	}
	public String getExternalID() {
		return externalID;
	}
	public void setExternalID(String externalID) {
		this.externalID = externalID;
	}
	public String getReportLabel() {
		return reportLabel;
	}
	public void setReportLabel(String reportLabel) {
		this.reportLabel = reportLabel;
	}
	
	
}
