package com.customerportal.bean;

import java.util.ArrayList;
import java.util.List;

public class Facilities {

	private String externalId;
	private String contact;
	private String address;
	private String company;
	private String facilityId;
	private String fid;
	private String tankPaidService;
	private String state;
	private String street;
	private String city;
	private String zip;
	private String paidService;
	private String name;
	private String brand;
	private String notificationFormButtonEnable;
	private String complianceButtonEnable;
	private String certificationButtonEnable;
	private String compliance;
	private String imageURL;
	private List<KeyValue> consolidateReport = new ArrayList<KeyValue>();

	public String getExternalId() {
		return externalId;
	}

	public void setExternalId(String externalId) {
		this.externalId = externalId;
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

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getFacilityId() {
		return facilityId;
	}

	public void setFacilityId(String facilityId) {
		this.facilityId = facilityId;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getTankPaidService() {
		return tankPaidService;
	}

	public void setTankPaidService(String tankPaidService) {
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

	public String getPaidService() {
		return paidService;
	}

	public void setPaidService(String paidService) {
		this.paidService = paidService;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getNotificationFormButtonEnable() {
		return notificationFormButtonEnable;
	}

	public void setNotificationFormButtonEnable(String notificationFormButtonEnable) {
		this.notificationFormButtonEnable = notificationFormButtonEnable;
	}

	public String getComplianceButtonEnable() {
		return complianceButtonEnable;
	}

	public void setComplianceButtonEnable(String complianceButtonEnable) {
		this.complianceButtonEnable = complianceButtonEnable;
	}

	public String getCertificationButtonEnable() {
		return certificationButtonEnable;
	}

	public void setCertificationButtonEnable(String certificationButtonEnable) {
		this.certificationButtonEnable = certificationButtonEnable;
	}

	public String getCompliance() {
		return compliance;
	}

	public void setCompliance(String compliance) {
		this.compliance = compliance;
	}

	public void setConsolidateReport(List<KeyValue> consolidateReport) {
		this.consolidateReport = consolidateReport;
	}

	public List<KeyValue> getConsolidateReport() {
		return consolidateReport;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public String getImageURL() {
		return imageURL;
	}
}
