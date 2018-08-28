package com.customerportal.bean;

public class Fecilities {

	private String externalId;
	private String contact;
	private String address;
	private String company;
	private String fecilityId;
	private String fid;
	private boolean tankPaidService;
	private String state;
	private String street;
	private String city;
	private String zip;
	private boolean paidService;
	private String name;

	public void setExternalId(String externalId) {
		this.externalId = externalId;
	}

	public String getExternalId() {
		return externalId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public String getFecilityId() {
		return fecilityId;
	}

	public void setFecilityId(String fecilityId) {
		this.fecilityId = fecilityId;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public boolean isTankPaidService() {
		return tankPaidService;
	}

	public void setTankPaidService(boolean tankPaidService) {
		this.tankPaidService = tankPaidService;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public boolean isPaidService() {
		return paidService;
	}

	public void setPaidService(boolean paidService) {
		this.paidService = paidService;
	}

}
