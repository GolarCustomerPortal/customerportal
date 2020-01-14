package com.customerportal.bean;

import java.util.Date;

public class InventoryReport {
	private String dateTime;
	private String product;
	private String gallons;
	private String tank;
	private String name;
	private String date;
	private String facility;
	private String fid;
	private String defg;
	private String inches;
	private String ullage;
	private String water;
	private String Id;
	private String newDate;
	private int rowId;

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getGallons() {
		return gallons;
	}

	public void setGallons(String gallons) {
		this.gallons = gallons;
	}

	public String getTank() {
		return tank;
	}

	public void setTank(String tank) {
		this.tank = tank;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getDateTime() {
		return dateTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getFacility() {
		return facility;
	}

	public void setFacility(String facility) {
		this.facility = facility;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getDefg() {
		return defg;
	}

	public void setDefg(String defg) {
		this.defg = defg;
	}

	public String getInches() {
		return inches;
	}

	public void setInches(String inches) {
		this.inches = inches;
	}

	public String getUllage() {
		return ullage;
	}

	public void setUllage(String ullage) {
		this.ullage = ullage;
	}

	public String getWater() {
		return water;
	}

	public void setWater(String water) {
		this.water = water;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getNewDate() {
		return newDate;
	}

	public void setNewDate(String newDate) {
		this.newDate = newDate;
	}

	public void setRowId(int rowId) {
		this.rowId = rowId;
	}

	public int getRowId() {
		return rowId;
	}
}
