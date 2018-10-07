package com.customerportal.bean;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

public class LoginHistory {

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String userId;
	private Date loginTime;
	private boolean fromApp;
	

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}
	public boolean isFromApp() {
		return fromApp;
	}
	public void setFromApp(boolean fromApp) {
		this.fromApp = fromApp;
	}

}
