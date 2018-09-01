package com.customerportal.bean;

public class Contact {
	private String Id;
	private String existingClient;
	private String externalID;
	private String firstName;
	private String lastName;
	private String emailAddress;
	private boolean mailingAddress;
	private boolean mailingCity;
	private boolean mailingCountry;
	private boolean mailingPostalCode;
	private String mailingState;
	private String mailingStreet;
	private boolean memberID;
	private String middleName;
	private String mobilePhone;
	private String name;
	private String phone;
	private String profession;
	private String salutation;
	private String taxID;
	private String title;
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getExistingClient() {
		return existingClient;
	}
	public void setExistingClient(String existingClient) {
		this.existingClient = existingClient;
	}
	public String getExternalID() {
		return externalID;
	}
	public void setExternalID(String externalID) {
		this.externalID = externalID;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public boolean isMailingAddress() {
		return mailingAddress;
	}
	public void setMailingAddress(boolean mailingAddress) {
		this.mailingAddress = mailingAddress;
	}
	public boolean isMailingCity() {
		return mailingCity;
	}
	public void setMailingCity(boolean mailingCity) {
		this.mailingCity = mailingCity;
	}
	public boolean isMailingCountry() {
		return mailingCountry;
	}
	public void setMailingCountry(boolean mailingCountry) {
		this.mailingCountry = mailingCountry;
	}
	public boolean isMailingPostalCode() {
		return mailingPostalCode;
	}
	public void setMailingPostalCode(boolean mailingPostalCode) {
		this.mailingPostalCode = mailingPostalCode;
	}
	public String getMailingState() {
		return mailingState;
	}
	public void setMailingState(String mailingState) {
		this.mailingState = mailingState;
	}
	public String getMailingStreet() {
		return mailingStreet;
	}
	public void setMailingStreet(String mailingStreet) {
		this.mailingStreet = mailingStreet;
	}
	public boolean isMemberID() {
		return memberID;
	}
	public void setMemberID(boolean memberID) {
		this.memberID = memberID;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public String getSalutation() {
		return salutation;
	}
	public void setSalutation(String salutation) {
		this.salutation = salutation;
	}
	public String getTaxID() {
		return taxID;
	}
	public void setTaxID(String taxID) {
		this.taxID = taxID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	

}
