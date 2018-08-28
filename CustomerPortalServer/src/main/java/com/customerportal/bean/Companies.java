package com.customerportal.bean;

import java.util.ArrayList;
import java.util.List;

public class Companies {

	private String name;
	List<Fecilities> fecilities = new ArrayList<Fecilities>();
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Fecilities> getFecilities() {
		return fecilities;
	}
	public void setFecilities(List<Fecilities> fecilities) {
		this.fecilities = fecilities;
	}
	
	
}
