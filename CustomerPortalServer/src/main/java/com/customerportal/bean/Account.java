package com.customerportal.bean;

public class Account {
	private String Id;
	private String facilityOperatorPOA;
	private String propertyOwnerPOA;
	private String ustOwnerPOA;
	private String operatorAffidevitOfLease;
	private String ownerAffidevitOfLease;
	private String sosStatus;
	private String taxIDInformation;
	private String letterOfNetworthCertification;
	private String operatorLeaseAgreement;
	private String lineAndLeakDetector;
	private String lnlDetrTstRequrd;
	private String cathodicProtection;
	private String cprequired;
	private String operatorAcertificate;
	private String operatorBcertificate;
	private String operatorCcertificate;
	private String tankTestingReport;
	private String tankTestingReportRequired;
	private String repairDocumentRequired;
	private String releaseDetectionReport;
	private String releaseDetectionReportRequired;
	private String internalLiningInspection;
	private String internalLiningInspectionRequired;
	private String mgtPaidService;
	private String notificationDueDate;
	private String notificationFormSubmitted;
	private String propertyDeedLandContract;
	private String repairDocuments;
	private String name;
	private String fid;
	private String street;
	private String city;
	private String state;
	private String postalCode;
	private String documentLink;

	private boolean facilityOperatorPOAEnable = false;
	private boolean propertyOwnerPOAEnable = false;
	private boolean ustOwnerPOAEnable = false;
	private boolean operatorAffidevitOfEnable = false;
	private boolean ownerAffidevitOfLeaseEnable = false;
	private boolean sosStatusEnable = false;
	private boolean operatorAffidevitOfLeaseEnable = false;
	private boolean taxIDInformationEnable = false;
	private boolean letterOfNetworthCertificationEnable = false;
	private boolean operatorLeaseAgreementEnable = false;
	private boolean notificationDueDateEnable = false;
	private boolean propertyDeedLandContractEnable = false;
	private boolean notificationFormSubmittedEnable = false;

	// compliance enable start

	private boolean lnlDetrTstRequrdEnable = false;
	private boolean cprequiredEnable = false;
	private boolean tankTestingReportRequiredEnable = false;
	private boolean repairDocumentRequiredEnable = false;
	private boolean releaseDetectionReportRequiredEnable = false;
	private boolean internalLiningInspectionRequiredEnable = false;

	// certification start
	private boolean operatorAcertificateEnable = false;
	private boolean operatorBcertificateEnable = false;
	private boolean operatorCcertificateEnable = false;

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getFacilityOperatorPOA() {
		return facilityOperatorPOA;
	}

	public void setFacilityOperatorPOA(String facilityOperatorPOA) {
		this.facilityOperatorPOA = facilityOperatorPOA;
	}

	public String getPropertyOwnerPOA() {
		return propertyOwnerPOA;
	}

	public void setPropertyOwnerPOA(String propertyOwnerPOA) {
		this.propertyOwnerPOA = propertyOwnerPOA;
	}

	public String getUstOwnerPOA() {
		return ustOwnerPOA;
	}

	public void setUstOwnerPOA(String ustOwnerPOA) {
		this.ustOwnerPOA = ustOwnerPOA;
	}

	public String getOperatorAffidevitOfLease() {
		return operatorAffidevitOfLease;
	}

	public void setOperatorAffidevitOfLease(String operatorAffidevitOfLease) {
		this.operatorAffidevitOfLease = operatorAffidevitOfLease;
	}

	public String getOwnerAffidevitOfLease() {
		return ownerAffidevitOfLease;
	}

	public void setOwnerAffidevitOfLease(String ownerAffidevitOfLease) {
		this.ownerAffidevitOfLease = ownerAffidevitOfLease;
	}

	public String getSosStatus() {
		return sosStatus;
	}

	public void setSosStatus(String sosStatus) {
		this.sosStatus = sosStatus;
	}

	public String getTaxIDInformation() {
		return taxIDInformation;
	}

	public void setTaxIDInformation(String taxIDInformation) {
		this.taxIDInformation = taxIDInformation;
	}

	public String getLetterOfNetworthCertification() {
		return letterOfNetworthCertification;
	}

	public void setLetterOfNetworthCertification(String letterOfNetworthCertification) {
		this.letterOfNetworthCertification = letterOfNetworthCertification;
	}

	public String getOperatorLeaseAgreement() {
		return operatorLeaseAgreement;
	}

	public void setOperatorLeaseAgreement(String operatorLeaseAgreement) {
		this.operatorLeaseAgreement = operatorLeaseAgreement;
	}

	public String getLineAndLeakDetector() {
		return lineAndLeakDetector;
	}

	public void setLineAndLeakDetector(String lineAndLeakDetector) {
		this.lineAndLeakDetector = lineAndLeakDetector;
	}

	public String getLnlDetrTstRequrd() {
		return lnlDetrTstRequrd;
	}

	public void setLnlDetrTstRequrd(String lnlDetrTstRequrd) {
		this.lnlDetrTstRequrd = lnlDetrTstRequrd;
	}

	public String getCathodicProtection() {
		return cathodicProtection;
	}

	public void setCathodicProtection(String cathodicProtection) {
		this.cathodicProtection = cathodicProtection;
	}

	public String getCprequired() {
		return cprequired;
	}

	public void setCprequired(String cprequired) {
		this.cprequired = cprequired;
	}

	public String getOperatorAcertificate() {
		return operatorAcertificate;
	}

	public void setOperatorAcertificate(String operatorAcertificate) {
		this.operatorAcertificate = operatorAcertificate;
	}

	public String getOperatorBcertificate() {
		return operatorBcertificate;
	}

	public void setOperatorBcertificate(String operatorBcertificate) {
		this.operatorBcertificate = operatorBcertificate;
	}

	public String getOperatorCcertificate() {
		return operatorCcertificate;
	}

	public void setOperatorCcertificate(String operatorCcertificate) {
		this.operatorCcertificate = operatorCcertificate;
	}

	public String getTankTestingReport() {
		return tankTestingReport;
	}

	public void setTankTestingReport(String tankTestingReport) {
		this.tankTestingReport = tankTestingReport;
	}

	public String getTankTestingReportRequired() {
		return tankTestingReportRequired;
	}

	public void setTankTestingReportRequired(String tankTestingReportRequired) {
		this.tankTestingReportRequired = tankTestingReportRequired;
	}

	public String getRepairDocumentRequired() {
		return repairDocumentRequired;
	}

	public void setRepairDocumentRequired(String repairDocumentRequired) {
		this.repairDocumentRequired = repairDocumentRequired;
	}

	public String getReleaseDetectionReport() {
		return releaseDetectionReport;
	}

	public void setReleaseDetectionReport(String releaseDetectionReport) {
		this.releaseDetectionReport = releaseDetectionReport;
	}

	public String getReleaseDetectionReportRequired() {
		return releaseDetectionReportRequired;
	}

	public void setReleaseDetectionReportRequired(String releaseDetectionReportRequired) {
		this.releaseDetectionReportRequired = releaseDetectionReportRequired;
	}

	public String getInternalLiningInspection() {
		return internalLiningInspection;
	}

	public void setInternalLiningInspection(String internalLiningInspection) {
		this.internalLiningInspection = internalLiningInspection;
	}

	public String getInternalLiningInspectionRequired() {
		return internalLiningInspectionRequired;
	}

	public void setInternalLiningInspectionRequired(String internalLiningInspectionRequired) {
		this.internalLiningInspectionRequired = internalLiningInspectionRequired;
	}

	public String getMgtPaidService() {
		return mgtPaidService;
	}

	public void setMgtPaidService(String mgtPaidService) {
		this.mgtPaidService = mgtPaidService;
	}

	public String getNotificationDueDate() {
		return notificationDueDate;
	}

	public void setNotificationDueDate(String notificationDueDate) {
		this.notificationDueDate = notificationDueDate;
	}

	public String getNotificationFormSubmitted() {
		return notificationFormSubmitted;
	}

	public void setNotificationFormSubmitted(String notificationFormSubmitted) {
		this.notificationFormSubmitted = notificationFormSubmitted;
	}

	public String getPropertyDeedLandContract() {
		return propertyDeedLandContract;
	}

	public void setPropertyDeedLandContract(String propertyDeedLandContract) {
		this.propertyDeedLandContract = propertyDeedLandContract;
	}

	public String getRepairDocuments() {
		return repairDocuments;
	}

	public void setRepairDocuments(String repairDocuments) {
		this.repairDocuments = repairDocuments;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getFid() {
		return fid;
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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public void setDocumentLink(String documentLink) {
		this.documentLink = documentLink;
	}

	public String getDocumentLink() {
		return documentLink;
	}

	public void setFacilityOperatorPOAEnable(boolean facilityOperatorPOAEnable) {
		this.facilityOperatorPOAEnable = facilityOperatorPOAEnable;
	}

	public boolean isFacilityOperatorPOAEnable() {
		return facilityOperatorPOAEnable;
	}

	public void setPropertyOwnerPOAEnable(boolean propertyOwnerPOAEnable) {
		this.propertyOwnerPOAEnable = propertyOwnerPOAEnable;
	}

	public boolean isPropertyOwnerPOAEnable() {
		return propertyOwnerPOAEnable;
	}

	public void setUstOwnerPOAEnable(boolean ustOwnerPOAEnable) {
		this.ustOwnerPOAEnable = ustOwnerPOAEnable;
	}

	public boolean isUstOwnerPOAEnable() {
		return ustOwnerPOAEnable;
	}

	public void setOperatorAffidevitOfLeaseEnable(boolean operatorAffidevitOfLeaseEnable) {
		this.operatorAffidevitOfLeaseEnable = operatorAffidevitOfLeaseEnable;
	}

	public boolean isOperatorAffidevitOfLeaseEnable() {
		return operatorAffidevitOfLeaseEnable;
	}

	public boolean isOperatorAffidevitOfEnable() {
		return operatorAffidevitOfEnable;
	}

	public void setOperatorAffidevitOfEnable(boolean operatorAffidevitOfEnable) {
		this.operatorAffidevitOfEnable = operatorAffidevitOfEnable;
	}

	public boolean isOwnerAffidevitOfLeaseEnable() {
		return ownerAffidevitOfLeaseEnable;
	}

	public void setOwnerAffidevitOfLeaseEnable(boolean ownerAffidevitOfLeaseEnable) {
		this.ownerAffidevitOfLeaseEnable = ownerAffidevitOfLeaseEnable;
	}

	public boolean isSosStatusEnable() {
		return sosStatusEnable;
	}

	public void setSosStatusEnable(boolean sosStatusEnable) {
		this.sosStatusEnable = sosStatusEnable;
	}

	public boolean isTaxIDInformationEnable() {
		return taxIDInformationEnable;
	}

	public void setTaxIDInformationEnable(boolean taxIDInformationEnable) {
		this.taxIDInformationEnable = taxIDInformationEnable;
	}

	public boolean isLetterOfNetworthCertificationEnable() {
		return letterOfNetworthCertificationEnable;
	}

	public void setLetterOfNetworthCertificationEnable(boolean letterOfNetworthCertificationEnable) {
		this.letterOfNetworthCertificationEnable = letterOfNetworthCertificationEnable;
	}

	public boolean isOperatorLeaseAgreementEnable() {
		return operatorLeaseAgreementEnable;
	}

	public void setOperatorLeaseAgreementEnable(boolean operatorLeaseAgreementEnable) {
		this.operatorLeaseAgreementEnable = operatorLeaseAgreementEnable;
	}

	public void setNotificationDueDateEnable(boolean notificationDueDateEnable) {
		this.notificationDueDateEnable = notificationDueDateEnable;
	}

	public boolean isNotificationDueDateEnable() {
		return notificationDueDateEnable;
	}

	public void setPropertyDeedLandContractEnable(boolean propertyDeedLandContractEnable) {
		this.propertyDeedLandContractEnable = propertyDeedLandContractEnable;
	}

	public boolean isPropertyDeedLandContractEnable() {
		return propertyDeedLandContractEnable;
	}

	public void setNotificationFormSubmittedEnable(boolean notificationFormSubmittedEnable) {
		this.notificationFormSubmittedEnable = notificationFormSubmittedEnable;
	}

	public boolean isNotificationFormSubmittedEnable() {
		return notificationFormSubmittedEnable;
	}

	public boolean isLnlDetrTstRequrdEnable() {
		return lnlDetrTstRequrdEnable;
	}

	public void setLnlDetrTstRequrdEnable(boolean lnlDetrTstRequrdEnable) {
		this.lnlDetrTstRequrdEnable = lnlDetrTstRequrdEnable;
	}

	public boolean isCprequiredEnable() {
		return cprequiredEnable;
	}

	public void setCprequiredEnable(boolean cprequiredEnable) {
		this.cprequiredEnable = cprequiredEnable;
	}

	public boolean isTankTestingReportRequiredEnable() {
		return tankTestingReportRequiredEnable;
	}

	public void setTankTestingReportRequiredEnable(boolean tankTestingReportRequiredEnable) {
		this.tankTestingReportRequiredEnable = tankTestingReportRequiredEnable;
	}

	public boolean isRepairDocumentRequiredEnable() {
		return repairDocumentRequiredEnable;
	}

	public void setRepairDocumentRequiredEnable(boolean repairDocumentRequiredEnable) {
		this.repairDocumentRequiredEnable = repairDocumentRequiredEnable;
	}

	public boolean isReleaseDetectionReportRequiredEnable() {
		return releaseDetectionReportRequiredEnable;
	}

	public void setReleaseDetectionReportRequiredEnable(boolean releaseDetectionReportRequiredEnable) {
		this.releaseDetectionReportRequiredEnable = releaseDetectionReportRequiredEnable;
	}

	public boolean isInternalLiningInspectionRequiredEnable() {
		return internalLiningInspectionRequiredEnable;
	}

	public void setInternalLiningInspectionRequiredEnable(boolean internalLiningInspectionRequiredEnable) {
		this.internalLiningInspectionRequiredEnable = internalLiningInspectionRequiredEnable;
	}

	public boolean isOperatorAcertificateEnable() {
		return operatorAcertificateEnable;
	}

	public void setOperatorAcertificateEnable(boolean operatorAcertificateEnable) {
		this.operatorAcertificateEnable = operatorAcertificateEnable;
	}

	public boolean isOperatorBcertificateEnable() {
		return operatorBcertificateEnable;
	}

	public void setOperatorBcertificateEnable(boolean operatorBcertificateEnable) {
		this.operatorBcertificateEnable = operatorBcertificateEnable;
	}

	public boolean isOperatorCcertificateEnable() {
		return operatorCcertificateEnable;
	}

	public void setOperatorCcertificateEnable(boolean operatorCcertificateEnable) {
		this.operatorCcertificateEnable = operatorCcertificateEnable;
	}

}
