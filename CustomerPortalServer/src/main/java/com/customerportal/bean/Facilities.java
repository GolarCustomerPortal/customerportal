package com.customerportal.bean;

import java.util.ArrayList;
import java.util.List;

public class Facilities {

	private String id;
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
	private String leakTankTestButtonStatus;
	private String leakTankTestCount;
	private String TankStatusButtonStatus;
	private String TankStatusCount;
	private String csldButtonStatus;
	private String csldCount;
	private String compliance;
	private String nfCompliant;
	private String imageURL;
	private Gaslevel gasLevel;
	private String projectManager;
	private String projectManagerPhone;
	private String facilityTankPaidMessage;
	private String incomeExpenseUpdatesButtonEnable;
	private String clientContact;
	private String gasLevelUpdatedDate;
	private boolean stationConnectError = false;
	private String stationConnectErrorMessage;

	private List<KeyValue> consolidateReport = new ArrayList<KeyValue>();

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
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

	public void setGasLevel(Gaslevel gasLevel) {
		this.gasLevel = gasLevel;
	}

	public Gaslevel getGasLevel() {
		return gasLevel;
	}

	public void setProjectManager(String projectManager) {
		this.projectManager = projectManager;
	}

	public String getProjectManager() {
		return projectManager;
	}

	public void setProjectManagerPhone(String projectManagerPhone) {
		this.projectManagerPhone = projectManagerPhone;
	}

	public String getProjectManagerPhone() {
		return projectManagerPhone;
	}

	public void setFacilityTankPaidMessage(String facilityTankPaidMessage) {
		this.facilityTankPaidMessage = facilityTankPaidMessage;
	}

	public String getFacilityTankPaidMessage() {
		return facilityTankPaidMessage;
	}

	public String getLeakTankTestButtonStatus() {
		return leakTankTestButtonStatus;
	}

	public void setLeakTankTestButtonStatus(String leakTankTestButtonStatus) {
		this.leakTankTestButtonStatus = leakTankTestButtonStatus;
	}

	public String getTankStatusButtonStatus() {
		return TankStatusButtonStatus;
	}

	public void setTankStatusButtonStatus(String tankStatusButtonStatus) {
		TankStatusButtonStatus = tankStatusButtonStatus;
	}

	public String getCsldButtonStatus() {
		return csldButtonStatus;
	}

	public void setCsldButtonStatus(String csldButtonStatus) {
		this.csldButtonStatus = csldButtonStatus;
	}
	public void setNfCompliant(String nfCompliant) {
		this.nfCompliant = nfCompliant;
	}
	public String getNfCompliant() {
		return nfCompliant;
	}

	public String getLeakTankTestCount() {
		return leakTankTestCount;
	}

	public void setLeakTankTestCount(String leakTankTestCount) {
		this.leakTankTestCount = leakTankTestCount;
	}

	public String getTankStatusCount() {
		return TankStatusCount;
	}

	public void setTankStatusCount(String tankStatusCount) {
		TankStatusCount = tankStatusCount;
	}

	public String getCsldCount() {
		return csldCount;
	}

	public void setCsldCount(String csldCount) {
		this.csldCount = csldCount;
	}
	public void setIncomeExpenseUpdatesButtonEnable(String incomeExpenseUpdatesButtonEnable) {
		this.incomeExpenseUpdatesButtonEnable = incomeExpenseUpdatesButtonEnable;
	}
	public String getIncomeExpenseUpdatesButtonEnable() {
		return incomeExpenseUpdatesButtonEnable;
	}
	public void setClientContact(String clientContact) {
		this.clientContact = clientContact;
	}
	public String getClientContact() {
		return clientContact;
	}
	public void setGasLevelUpdatedDate(String gasLevelUpdatedDate) {
		this.gasLevelUpdatedDate = gasLevelUpdatedDate;
	}
	public String getGasLevelUpdatedDate() {
		return gasLevelUpdatedDate;
	}
	public void setStationConnectError(boolean stationConnectError) {
		this.stationConnectError = stationConnectError;
	}
	public boolean isStationConnectError() {
		return stationConnectError;
	}
	public void setStationConnectErrorMessage(String stationConnectErrorMessage) {
		this.stationConnectErrorMessage = stationConnectErrorMessage;
	}
	public String getStationConnectErrorMessage() {
		return stationConnectErrorMessage;
	}
}
