package com.customerportal.bean;

import java.util.ArrayList;
import java.util.List;

public class SearchResults {

	private List<Company> companiesList = new ArrayList<Company>();
	private List<Facilities> facilitiesList = new ArrayList<Facilities>();
	public List<Company> getCompaniesList() {
		return companiesList;
	}
	public void setCompaniesList(List<Company> companiesList) {
		this.companiesList = companiesList;
	}
	public List<Facilities> getFacilitiesList() {
		return facilitiesList;
	}
	public void setFacilitiesList(List<Facilities> facilitiesList) {
		this.facilitiesList = facilitiesList;
	}
	
	
}
