package com.customerportal.bean;

import java.util.Date;

public class SiteExpenses {
	private int id;
	private String accountID;
	private String fID;
	private double amount;
	private Date date;
	private String dateString;
	private String checkNo;
	private String vendor;
	private String dataEnteredBy;
	private String others;
	private String salesforceId;
	private String dataModifiedBy;
	private Date createdDate;
	private Date modifiedDate;

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public String getAccountID() {
		return accountID;
	}

	public void setAccountID(String accountID) {
		this.accountID = accountID;
	}

	public String getfID() {
		return fID;
	}

	public void setfID(String fID) {
		this.fID = fID;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getCheckNo() {
		return checkNo;
	}

	public void setCheckNo(String checkNo) {
		this.checkNo = checkNo;
	}

	public String getVendor() {
		return vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	public void setDataEnteredBy(String dataEnteredBy) {
		this.dataEnteredBy = dataEnteredBy;
	}

	public String getDataEnteredBy() {
		return dataEnteredBy;
	}

	public void setOthers(String others) {
		this.others = others;
	}

	public String getOthers() {
		return others;
	}

	public void setSalesforceId(String salesforceId) {
		this.salesforceId = salesforceId;
	}

	public String getSalesforceId() {
		return salesforceId;
	}

	public void setDateString(String dateString) {
		this.dateString = dateString;
	}

	public String getDateString() {
		return dateString;
	}

	public String getDataModifiedBy() {
		return dataModifiedBy;
	}

	public void setDataModifiedBy(String dataModifiedBy) {
		this.dataModifiedBy = dataModifiedBy;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

}
