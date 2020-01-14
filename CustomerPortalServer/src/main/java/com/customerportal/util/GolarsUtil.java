package com.customerportal.util;

import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import com.customerportal.bean.SiteExpenses;
import com.customerportal.bean.SiteIncome;
import com.sforce.soap.enterprise.Connector;
import com.sforce.soap.enterprise.DeleteResult;
import com.sforce.soap.enterprise.EnterpriseConnection;
import com.sforce.soap.enterprise.SaveResult;
import com.sforce.soap.enterprise.sobject.Account;
import com.sforce.soap.enterprise.sobject.Site_Expenses__c;
import com.sforce.soap.enterprise.sobject.Site_Income__c;
import com.sforce.ws.ConnectionException;
import com.sforce.ws.ConnectorConfig;

public class GolarsUtil {
	private static Properties salesforceProperties = new Properties();
	static EnterpriseConnection connection;

	public static SaveResult[] saveExpensesIntoSalesForce(SiteExpenses siteExpense) {

		try {
			Class<GolarsUtil> cl = GolarsUtil.class;

			salesforceProperties.load(cl.getResourceAsStream("/customerportal.properties"));
		} catch (Exception e1) {
			System.out.println("Email Configuration fiele not found" + e1.getMessage());
		}

		final String USERNAME = salesforceProperties.getProperty("username");
		final String PASSWORD = salesforceProperties.getProperty("password");
		SaveResult[] saveResults = null;
		try {
			ConnectorConfig config = new ConnectorConfig();
			config.setUsername(USERNAME);
			config.setPassword(PASSWORD);
			connection = Connector.newConnection(config);
			Site_Expenses__c[] expenses_Record = new Site_Expenses__c[1];
			expenses_Record[0] = new Site_Expenses__c();
			expenses_Record[0].setCustom_Id__c((double) siteExpense.getId());
			expenses_Record[0].setAccount_ID__c(siteExpense.getAccountID());
			expenses_Record[0].setData_Entered_By__c(siteExpense.getDataEnteredBy());
			expenses_Record[0].setAmount__c(siteExpense.getAmount());
			expenses_Record[0].setCheck_No__c(siteExpense.getCheckNo());
			expenses_Record[0].setFID__c(siteExpense.getfID());
			Calendar fromCal = Calendar.getInstance();
			fromCal.setTime(siteExpense.getDate());
			expenses_Record[0].setDate__c(fromCal);
			expenses_Record[0].setVendor__c(siteExpense.getVendor());
			if (siteExpense.getVendor().equalsIgnoreCase("Others"))
				expenses_Record[0].setOther__c(siteExpense.getOthers());
			saveResults = connection.create(expenses_Record);
			System.out.println(
					saveResults + "--------saveResults the error length is " + saveResults[0].getErrors().length);

		} catch (ConnectionException e) {
			System.out.println("Exception in saveDocumentURLINTOSalesForce--" + e.getMessage());
			return saveResults;
		}
		return saveResults;

	}

	public static DeleteResult[] deletencomeIntoSalesForce(String salesForceId) {
		try {
			Class<GolarsUtil> cl = GolarsUtil.class;

			salesforceProperties.load(cl.getResourceAsStream("/customerportal.properties"));
		} catch (Exception e1) {
			System.out.println("Email Configuration fiele not found" + e1.getMessage());
		}

		final String USERNAME = salesforceProperties.getProperty("username");
		final String PASSWORD = salesforceProperties.getProperty("password");
		DeleteResult[] saveResults = null;
		try {
			ConnectorConfig config = new ConnectorConfig();
			config.setUsername(USERNAME);
			config.setPassword(PASSWORD);
			connection = Connector.newConnection(config);
			String[] expenses_Record = new String[1];
			expenses_Record[0] = salesForceId;
			saveResults = connection.delete(expenses_Record);
		} catch (ConnectionException e) {
			System.out.println("Exception in saveDocumentURLINTOSalesForce--" + e.getMessage());
			return saveResults;
		}
		return saveResults;
	}

	public static SaveResult[] saveIncomeIntoSalesForce(SiteIncome siteIncome, boolean needToUpdateAccount) {

		try {

			Class<GolarsUtil> cl = GolarsUtil.class;

			salesforceProperties.load(cl.getResourceAsStream("/customerportal.properties"));
		} catch (Exception e1) {
			System.out.println("Email Configuration fiele not found" + e1.getMessage());
		}

		final String USERNAME = salesforceProperties.getProperty("username");
		final String PASSWORD = salesforceProperties.getProperty("password");
		SaveResult[] incomesaveResults = null, accountsaveResults = null;
		try {
			ConnectorConfig config = new ConnectorConfig();
			config.setUsername(USERNAME);
			config.setPassword(PASSWORD);
			connection = Connector.newConnection(config);
			Site_Income__c[] income_Record = new Site_Income__c[1];
			income_Record[0] = new Site_Income__c();
			income_Record[0].setCustom_Id__c(new Double(siteIncome.getId()));
			income_Record[0].setAccount_ID__c(siteIncome.getAccountID());
			income_Record[0].setData_Entered_By__c(siteIncome.getDataEnteredBy());
			income_Record[0].setGas_Amount__c(siteIncome.getGasAmount());
			income_Record[0].setGallons_Sold__c(siteIncome.getGallonsSold());
			income_Record[0].setInside_Sales_Amount__c(siteIncome.getInsideSalesAmount());
			income_Record[0].setLottery_Amount__c(siteIncome.getLotteryAmount());
			income_Record[0].setScratch_Off_Sold__c(siteIncome.getScratchOffSold());
			income_Record[0].setTax__c(siteIncome.getTax());
			income_Record[0].setFID__c(siteIncome.getfID());
			Calendar fromCal = Calendar.getInstance();
			fromCal.setTime(siteIncome.getFromDate());
			income_Record[0].setFrom_Date__c(fromCal);

			Calendar toCal = Calendar.getInstance();
			toCal.setTime(siteIncome.getToDate());
			income_Record[0].setTo_Date__c(toCal);
			if (siteIncome.getSalesforceId() != null) {
				income_Record[0].setId(siteIncome.getSalesforceId());
				incomesaveResults = connection.update(income_Record);
			} else
				incomesaveResults = connection.create(income_Record);
			if (incomesaveResults[0].getErrors().length == 0) {
				Account[] accountRecord = new Account[1];
				accountRecord[0] = new Account();
				accountRecord[0].setIncome_Expense_Updates__c(needToUpdateAccount);
				accountRecord[0].setId(siteIncome.getAccountID());
				accountsaveResults = connection.update(accountRecord);
			}
			System.out.println(accountsaveResults + "--------saveResults the error length is "
					+ accountsaveResults[0].getErrors().length);

		} catch (ConnectionException e) {
			System.out.println("Exception in saveDocumentURLINTOSalesForce--" + e.getMessage());
			return incomesaveResults;
		}
		return incomesaveResults;

	}

	/**
	 * <p>
	 * Checks if two dates are on the same day ignoring time.
	 * </p>
	 * 
	 * @param date1 the first date, not altered, not null
	 * @param date2 the second date, not altered, not null
	 * @return true if they represent the same day
	 * @throws IllegalArgumentException if either date is <code>null</code>
	 */
	public static boolean isSameDay(Date date1, Date date2) {
		if (date1 == null || date2 == null) {
			throw new IllegalArgumentException("The dates must not be null");
		}
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(date1);
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(date2);
		return isSameDay(cal1, cal2);
	}

	/**
	 * <p>
	 * Checks if two calendars represent the same day ignoring time.
	 * </p>
	 * 
	 * @param cal1 the first calendar, not altered, not null
	 * @param cal2 the second calendar, not altered, not null
	 * @return true if they represent the same day
	 * @throws IllegalArgumentException if either calendar is <code>null</code>
	 */
	public static boolean isSameDay(Calendar cal1, Calendar cal2) {
		if (cal1 == null || cal2 == null) {
			throw new IllegalArgumentException("The dates must not be null");
		}
		return (cal1.get(Calendar.ERA) == cal2.get(Calendar.ERA) && cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR)
				&& cal1.get(Calendar.DAY_OF_YEAR) == cal2.get(Calendar.DAY_OF_YEAR));
	}

	/**
	 * <p>
	 * Checks if a date is today.
	 * </p>
	 * 
	 * @param date the date, not altered, not null.
	 * @return true if the date is today.
	 * @throws IllegalArgumentException if the date is <code>null</code>
	 */
	public static boolean isToday(Date date) {
		return isSameDay(date, Calendar.getInstance().getTime());
	}

	

}