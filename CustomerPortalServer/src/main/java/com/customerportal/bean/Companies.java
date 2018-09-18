package com.customerportal.bean;

import java.util.ArrayList;
import java.util.List;

public class Companies {

	private String name;
	List<Facilities> fecilities = new ArrayList<Facilities>();
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Facilities> getFecilities() {
		return fecilities;
	}
	public void setFecilities(List<Facilities> fecilities) {
		this.fecilities = fecilities;
	}
	
	
}
