package com.customerportal.bean;

import java.util.ArrayList;
import java.util.List;

public class Companies {

	private String name;
	List<Facilities> facilities = new ArrayList<Facilities>();
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Facilities> getFacilities() {
		return facilities;
	}
	public void setFacilities(List<Facilities> facilities) {
		this.facilities = facilities;
	}
	
	
}
