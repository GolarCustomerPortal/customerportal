package com.customerportal.bean;

import java.util.ArrayList;
import java.util.List;

public class Company {

	private String companyOwner;
	private String companyName;
	private String existingClient;
	private String externalID;
	private String name;
	private String ownerName;
	List<Facilities> fecilities = new ArrayList<Facilities>();
	public String getCompanyOwner() {
		return companyOwner;
	}
	public void setCompanyOwner(String companyOwner) {
		this.companyOwner = companyOwner;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public void setFecilities(List<Facilities> fecilities) {
		this.fecilities = fecilities;
	}
	public List<Facilities> getFecilities() {
		return fecilities;
	}
}
