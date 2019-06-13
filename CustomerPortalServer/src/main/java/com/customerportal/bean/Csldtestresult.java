package com.customerportal.bean;

public class Csldtestresult {
	private String id;
	private String name;
	private String facility__c;
	private String fid__c;
	private String occuredAt__c;
	private String result__c;
	private String date__c;
	private String tank__c;
	private String tankType__c;
	private String product__c;
	private String viewed="false";

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFacility__c() {
		return facility__c;
	}

	public void setFacility__c(String facility__c) {
		this.facility__c = facility__c;
	}

	public String getFid__c() {
		return fid__c;
	}

	public void setFid__c(String fid__c) {
		this.fid__c = fid__c;
	}

	public String getOccuredAt__c() {
		return occuredAt__c;
	}

	public void setOccuredAt__c(String occuredAt__c) {
		this.occuredAt__c = occuredAt__c;
	}

	public String getResult__c() {
		return result__c;
	}

	public void setResult__c(String result__c) {
		this.result__c = result__c;
	}

	public void setDate__c(String date__c) {
		this.date__c = date__c;
	}

	public String getDate__c() {
		return date__c;
	}

	public String getTank__c() {
		return tank__c;
	}

	public void setTank__c(String tank__c) {
		this.tank__c = tank__c;
	}

	public String getTankType__c() {
		return tankType__c;
	}

	public void setTankType__c(String tankType__c) {
		this.tankType__c = tankType__c;
	}

	public void setProduct__c(String product__c) {
		this.product__c = product__c;
	}

	public String getProduct__c() {
		return product__c;
	}

	public void setViewed(String viewed) {
		this.viewed = viewed;
	}

	public String getViewed() {
		return viewed;
	}
}
