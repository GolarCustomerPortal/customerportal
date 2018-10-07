package com.customerportal.bean;

import java.util.Date;

public class InventoryReport {
private Date dateTime;
private String  product;
private String  gallons;
private String  tank;
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
public void setDateTime(Date dateTime) {
	this.dateTime = dateTime;
}
public Date getDateTime() {
	return dateTime;
}

}
