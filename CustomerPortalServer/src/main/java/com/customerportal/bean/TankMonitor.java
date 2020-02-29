package com.customerportal.bean;

public class TankMonitor {

	private String id;
	private String label;
	private String monitorCode;
	private String brand;
	private String model;
	private String externalID;
	private String uiPriority;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getMonitorCode() {
		return monitorCode;
	}

	public void setMonitorCode(String monitorCode) {
		this.monitorCode = monitorCode;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public void setExternalID(String externalID) {
		this.externalID = externalID;
	}

	public String getExternalID() {
		return externalID;
	}

	public void setUiPriority(String uiPriority) {
		this.uiPriority = uiPriority;
	}

	public String getUiPriority() {
		return uiPriority;
	}
}
