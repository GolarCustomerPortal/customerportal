package com.customerportal.bean;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class SiteIncome {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String accountID;
	private String fID;
	private String fromDateString;
	private Date fromDate;
	private double gallonsSold;
	private double gasAmount;
	private double insideSalesAmount;
	private double lotteryAmount;
	private double scratchOffSold;
	private Date toDate;
	private String toDateString;
	private String dataEnteredBy;
	private double tax;
	private String salesforceId;
	private String dataModifiedBy;
	private Date createdDate;
	private Date modifiedDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public double getGallonsSold() {
		return gallonsSold;
	}

	public void setGallonsSold(double gallonsSold) {
		this.gallonsSold = gallonsSold;
	}

	public double getGasAmount() {
		return gasAmount;
	}

	public void setGasAmount(double gasAmount) {
		this.gasAmount = gasAmount;
	}

	public double getInsideSalesAmount() {
		return insideSalesAmount;
	}

	public void setInsideSalesAmount(double insideSalesAmount) {
		this.insideSalesAmount = insideSalesAmount;
	}

	public double getLotteryAmount() {
		return lotteryAmount;
	}

	public void setLotteryAmount(double lotteryAmount) {
		this.lotteryAmount = lotteryAmount;
	}

	public double getScratchOffSold() {
		return scratchOffSold;
	}

	public void setScratchOffSold(double scratchOffSold) {
		this.scratchOffSold = scratchOffSold;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public String getDataEnteredBy() {
		return dataEnteredBy;
	}

	public void setDataEnteredBy(String dataEnteredBy) {
		this.dataEnteredBy = dataEnteredBy;
	}

	public void setTax(double tax) {
		this.tax = tax;
	}

	public double getTax() {
		return tax;
	}

	public void setSalesforceId(String salesforceId) {
		this.salesforceId = salesforceId;
	}

	public String getSalesforceId() {
		return salesforceId;
	}

	public String getFromDateString() {
		return fromDateString;
	}

	public void setFromDateString(String fromDateString) {
		this.fromDateString = fromDateString;
	}

	public String getToDateString() {
		return toDateString;
	}

	public void setToDateString(String toDateString) {
		this.toDateString = toDateString;
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
