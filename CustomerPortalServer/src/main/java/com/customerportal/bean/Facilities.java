package com.customerportal.bean;

public class Facilities {

	private String externalId;
	private String contact;
	private String address;
	private String company;
	private String facilityId;
	private String fid;
	private boolean tankPaidService;
	private String state;
	private String street;
	private String city;
	private String zip;
	private boolean paidService;
	private String name;
	private String brand;
	private boolean notificationFormButtonEnable;
	private boolean complianceButtonEnable;
	private boolean certificationButtonEnable;

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

	public String getFacilityId() {
		return facilityId;
	}

	public void setFacilityId(String facilityId) {
		this.facilityId = facilityId;
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
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getBrand() {
		return brand;
	}

	public boolean isNotificationFormButtonEnable() {
		return notificationFormButtonEnable;
	}

	public void setNotificationFormButtonEnable(boolean notificationFormButtonEnable) {
		this.notificationFormButtonEnable = notificationFormButtonEnable;
	}

	public boolean isComplianceButtonEnable() {
		return complianceButtonEnable;
	}

	public void setComplianceButtonEnable(boolean complianceButtonEnable) {
		this.complianceButtonEnable = complianceButtonEnable;
	}

	public boolean isCertificationButtonEnable() {
		return certificationButtonEnable;
	}

	public void setCertificationButtonEnable(boolean certificationButtonEnable) {
		this.certificationButtonEnable = certificationButtonEnable;
	}

}
