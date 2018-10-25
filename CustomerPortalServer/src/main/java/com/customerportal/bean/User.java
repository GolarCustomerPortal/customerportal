package com.customerportal.bean;

import java.util.Date;

public class User {

	private String firstName;
	private String lastName;
	private String emailAddress;
	private String username;
	private String password;
	private String id;
	private boolean admin;
	private boolean newlyCreated;
	private boolean active;
	private boolean edit;
	private String imageContent;
	private String token;
	private boolean loginsuccess;
	private String fullName;
	private String permission;
	private Date lastLoginTime;
	private boolean golarsEmployee;
	private boolean fromApp;
	private boolean userManager;

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
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

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public void setNewlyCreated(boolean newlyCreated) {
		this.newlyCreated = newlyCreated;
	}

	public boolean isNewlyCreated() {
		return newlyCreated;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public boolean isActive() {
		return active;
	}

	public void setEdit(boolean edit) {
		this.edit = edit;
	}

	public boolean isEdit() {
		return edit;
	}

	public void setImageContent(String imageContent) {
		this.imageContent = imageContent;
	}

	public String getImageContent() {
		return imageContent;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getToken() {
		return token;
	}

	public void setLoginsuccess(boolean loginsuccess) {
		this.loginsuccess = loginsuccess;
	}

	public boolean isLoginsuccess() {
		return loginsuccess;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getFullName() {
		return fullName;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public String getPermission() {
		return permission;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public boolean isGolarsEmployee() {
		return golarsEmployee;
	}

	public void setGolarsEmployee(boolean golarsEmployee) {
		this.golarsEmployee = golarsEmployee;
	}

	public void setFromApp(boolean fromApp) {
		this.fromApp = fromApp;
	}

	public boolean isFromApp() {
		return fromApp;
	}

	public void setUserManager(boolean userManager) {
		this.userManager = userManager;
	}

	public boolean isUserManager() {
		return userManager;
	}
}
