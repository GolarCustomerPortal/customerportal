package com.customerportal.bean;

import java.util.ArrayList;
import java.util.List;

public class SearchResults {

	private List<Companies> companiesList = new ArrayList<Companies>();
	private List<Facilities> facilitiesList = new ArrayList<Facilities>();
	public List<Companies> getCompaniesList() {
		return companiesList;
	}
	public void setCompaniesList(List<Companies> companiesList) {
		this.companiesList = companiesList;
	}
	public List<Facilities> getFacilitiesList() {
		return facilitiesList;
	}
	public void setFacilitiesList(List<Facilities> facilitiesList) {
		this.facilitiesList = facilitiesList;
	}
	
	
}
