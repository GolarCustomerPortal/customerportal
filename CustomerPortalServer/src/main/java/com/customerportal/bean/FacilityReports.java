package com.customerportal.bean;

import java.io.Serializable;

public class FacilityReports implements Serializable {

	private String fid;
	private String reportType;
	private String id;
	private byte[] content;
	private String contentAsText;
	private String createdBy;
	private String updatedBy;
	private String createdDate;
	private String updatedDate;

	private boolean stationConnectError = false;
	private String stationConnectErrorMessage;

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public byte[] getContent() {
		return content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	public boolean isStationConnectError() {
		return stationConnectError;
	}

	public void setStationConnectError(boolean stationConnectError) {
		this.stationConnectError = stationConnectError;
	}

	public String getStationConnectErrorMessage() {
		return stationConnectErrorMessage;
	}

	public void setStationConnectErrorMessage(String stationConnectErrorMessage) {
		this.stationConnectErrorMessage = stationConnectErrorMessage;
	}

	public void setContentAsText(String contentAsText) {
		this.contentAsText = contentAsText;
	}

	public String getContentAsText() {
		return contentAsText;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getUpdatedDate() {
		return updatedDate;
	}
}
