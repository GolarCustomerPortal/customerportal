package com.customerportal.util;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.TimeZone;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.customerportal.bean.Account;
import com.customerportal.bean.ChangePassword;
import com.customerportal.bean.Company;
import com.customerportal.bean.Contact;
import com.customerportal.bean.Csldtestresult;
import com.customerportal.bean.CustomAttachments;
import com.customerportal.bean.CustomerPortalAttachments;
import com.customerportal.bean.Facilities;
import com.customerportal.bean.FacilityProductMap;
import com.customerportal.bean.FacilityReports;
import com.customerportal.bean.Gaslevel;
import com.customerportal.bean.IncomeReportData;
import com.customerportal.bean.InventoryReport;
import com.customerportal.bean.JobSchedule;
import com.customerportal.bean.JobScheduleHistory;
import com.customerportal.bean.KeyValue;
import com.customerportal.bean.Leaktestresults;
import com.customerportal.bean.LoginHistory;
import com.customerportal.bean.SearchResults;
import com.customerportal.bean.Settings;
import com.customerportal.bean.SiteExpenses;
import com.customerportal.bean.SiteIncome;
import com.customerportal.bean.TankAarmHistory;
import com.customerportal.bean.TankAlarmHistoryData;
import com.customerportal.bean.TankMonitorSignup;
import com.customerportal.bean.Tankstatusreport;
import com.customerportal.bean.USSBOA;
import com.customerportal.bean.User;
import com.customerportal.bean.Userpreferences;
import com.sforce.soap.enterprise.DeleteResult;
import com.sforce.soap.enterprise.SaveResult;

public class DBUtil {
	private static DBUtil dbObj;
	private static String RED_COLOR="#ff0000";
	private static String GRAY_COLOR="#808080";
	private static String GREEN_COLOR="#00FF00";
	static Properties urlProperties = new Properties();
	static String errorHandlingPDF = "http://golars360.com/golars/rest/import/1016388/Error+Handling.pdf";

	public DBUtil() {
	}

	public static DBUtil getInstance() {
		if (dbObj == null) {
			dbObj = new DBUtil();
			try {
				urlProperties.load(CustomerPortalFileUpload.class.getResourceAsStream("/customerportal.properties"));
				errorHandlingPDF = urlProperties.getProperty("errorHandlingPDF");
			} catch (IOException e) {
			}
		}
		return dbObj;
	}

	public List<User> getAllUsers() {

		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery("SELECT * FROM crmuser order by firstName ASC  ", User.class);
		List lst = query.list();
		t.commit();
		session.close();
		return lst;
	}
	public User getSpecificUser(String userId) {

		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery("SELECT * FROM crmuser where id =:userId", User.class);
		query.setString("userId", userId);
		List lst = query.list();
		t.commit();
		session.close();
		
		if(lst != null)
			return (User) lst.get(0);
		return null;
	}

	public User login(String username, String password, boolean fromApp) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			User user = (User) session.get(User.class, username);
			password = new String(Base64.getEncoder().encode(password.getBytes()));
			if (password.equals(user.getPassword())) {
				user.setLastLoginTime(new Date());
				session.save(user);
				LoginHistory history = new LoginHistory();
				history.setLoginTime(new Date());
				history.setUserId(user.getUsername());
				history.setFromApp(fromApp);
				session.save(history);
				trx.commit();
				session.close();
				return user;
			}

		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred in login   method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally {

		}
		return null;
	}

	public User register(User userObj) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			User user = (User) session.get(User.class, userObj.getUsername());
			if (user != null)
				return null;
			userObj.setPassword(new String(Base64.getEncoder().encode(userObj.getPassword().getBytes())));
			session.save(userObj);
			trx.commit();
			session.close();
			return userObj;
		} catch (Exception exception) {
			System.out.println("Exception occred in register  method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		}
	}

	public User editUser(User userObj) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			User user = (User) session.get(User.class, userObj.getUsername());
			if (!userObj.getPassword().equals(user.getPassword()))
				userObj.setPassword(new String(Base64.getEncoder().encode(userObj.getPassword().getBytes())));
			// userObj.setNewlyCreated(user.isNewlyCreated());
			// boolean newleyCreated = user.isNewlyCreated();
			user.setFirstName(userObj.getFirstName());
			user.setLastName(userObj.getLastName());
			user.setActive(userObj.isActive());
			user.setAdmin(userObj.isAdmin());
			user.setUserManager(userObj.isUserManager());
			user.setEmailAddress(userObj.getEmailAddress());
			user.setPassword(userObj.getPassword());
			if (userObj.getImageContent() != null)
				user.setImageContent(userObj.getImageContent());
			else
				userObj.setImageContent(user.getImageContent());
			// user.setNewlyCreated(newleyCreated);
			user.setPermission(userObj.getPermission());
			session.update(user);
			trx.commit();
			session.close();
			return userObj;
		} catch (Exception exception) {
			System.out.println("Exception occred in update method -- " + exception.getMessage());
			exception.printStackTrace();
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		}
	}

	public List<Facilities> fetchFacilities(String userId) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			User user = getSpecificUser(userId);
			String queryString = "SELECT * FROM Facility_Management__c";
			if (user == null || !user.isAdmin() && !user.isUserManager())
				queryString += " where Contact__c= '" + userId + "'";
			Query query = session.createNativeQuery(queryString, Facilities.class);
			List<Facilities>  lst = query.list();
//			setGasLevels(lst);
			trx.commit();
			session.close();
			return lst;
		} catch (

		Exception exception)

		{
			exception.printStackTrace();
			System.out.println("Exception occred in fetchFacilities method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}
	}
	public List<Facilities> fetchFacilitiesWithIpAddress(String userId) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			String queryString = "SELECT * FROM Facility_Management__c where Tank_Monitor_Brand__c is not null && Tank_Monitor_Model__c is not null && Tank_Monitor_Static_IP__c is not null and Contact__c= '" + userId + "'";
			Query query = session.createNativeQuery(queryString, Facilities.class);
			List<Facilities>  lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (

		Exception exception)

		{
			exception.printStackTrace();
			System.out.println("Exception occred in fetchFacilitiesWithIpAddress method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}
	}
	private void setGasLevels(List<Facilities> lst) {
		for (Facilities facility : lst) {
			if(facility== null)continue;
			Gaslevel gasLevel = getGasLevels(facility.getFacilityId());
			facility.setGasLevel(gasLevel);
		}
		
	}

	public List<Facilities> searchFacilities(String searchType, String userId, String searchString) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			User user = getSpecificUser(userId);
			String queryString = "SELECT *  FROM Facility_Management__c";

			queryString += " where ";
			if (user == null || !user.isAdmin() && !user.isUserManager())
				queryString += " Contact__c= '" + userId + "'  and ";
			queryString += " ( ";
			if (searchType.equalsIgnoreCase("all")) {
				queryString += "  FID__C like '%" + searchString + "%' or Facility_Name__c like '%" + searchString
						+ "%' or Facility_Address__c like '%" + searchString + "%'";
			}
			if (searchType.equalsIgnoreCase("fid")) {
				queryString += " FID__C like '%" + searchString + "%'";
			}
			if (searchType.equalsIgnoreCase("name")) {
				queryString += " Facility_Name__c like '%" + searchString + "%'";
			}
			if (searchType.equalsIgnoreCase("address")) {
				queryString += " Facility_Address__c like '%" + searchString + "%'";
			}
			queryString += " )";
			Query query = session.createNativeQuery(queryString,Facilities.class);
			List<Facilities> lst = query.list();
			List<Facilities> resultList   = CustomerPortalUtil.remoteDuplicateRecords(lst);
			setGasLevels(resultList);
			trx.commit();
			session.close();
			CustomerPortalUtil.fillImageURL(resultList);
			return resultList;

		} catch (

		Exception exception)

		{
			exception.printStackTrace();
			System.out.println("Exception occred in fetchFacilities method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}
	}

	public List<User> getAllUsers(String searchOption, String searchString) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			Query query = null;
			if (searchOption.equalsIgnoreCase("fname")) {
				query = session.createNativeQuery(
						"SELECT Email__c,Existing_Client__c,External_ID__c,FirstName,Id,LastName,MailingAddress,MailingCity,MailingCountry"
								+ ",MailingPostalCode,MailingState,MailingStreet,Member_ID__c,MiddleName,MobilePhone,Name,"
								+ "Phone,Profession__c,Salutation,Tax_ID__c,Title F"
								+ "ROM Contact c where c.FirstName LIKE :searchString",
						Contact.class);

			} else if (searchOption.equalsIgnoreCase("lname")) {
				query = session.createNativeQuery(
						"SELECT Email__c,Existing_Client__c,External_ID__c,FirstName,Id,LastName,MailingAddress,MailingCity,MailingCountry"
								+ ",MailingPostalCode,MailingState,MailingStreet,Member_ID__c,MiddleName,MobilePhone,Name,"
								+ "Phone,Profession__c,Salutation,Tax_ID__c,Title F"
								+ "ROM Contact c where c.LastName LIKE :searchString",
						Contact.class);
			}
			if (searchOption.equalsIgnoreCase("email")) {
				query = session.createNativeQuery(
						"SELECT Email__c,Existing_Client__c,External_ID__c,FirstName,Id,LastName,MailingAddress,MailingCity,MailingCountry"
								+ ",MailingPostalCode,MailingState,MailingStreet,Member_ID__c,MiddleName,MobilePhone,Name,"
								+ "Phone,Profession__c,Salutation,Tax_ID__c,Title F"
								+ "ROM Contact c where c.Email__c LIKE :searchString",
						Contact.class);
			}
			query.setString("searchString", "%" + searchString + "%");
			List<User> lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred in getALl Users method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally {

		}
	}

	public List<Facilities> getSpecificFacilitiesForUser(String userId, String facilitiesType) {

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			String queryString = "Select * "
					+ "FROM Facility_Management__c  where Golars_Tank_Paid_Service__c =:tankService ";
			User user = getSpecificUser(userId);
			if (user == null || !user.isAdmin() && !user.isUserManager()) {
				queryString += " and Contact__c =:userId";
			}
			Query query = session.createNativeQuery(queryString, Facilities.class);
			if (user == null || !user.isAdmin() && !user.isUserManager()) {
				query.setString("userId", userId);
			}
			if (facilitiesType.equalsIgnoreCase("managed"))
				query.setString("tankService", "true");
			else
				query.setString("tankService", "false");
			List<Facilities> lst = query.list();
//			setGasLevels(lst);
			trx.commit();
			session.close();
			for (Facilities facilities : lst) {
				if(facilities.getClientContact() !=null && !facilities.getClientContact().equalsIgnoreCase(userId))
					facilities.setClientContact(null);
			}

			CustomerPortalUtil.fillImageURL(lst);

			return lst;
		} catch (

		Exception exception)

		{
			exception.printStackTrace();
			System.out.println("Exception occred in getSpecificFacilitiesForUser method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}

	}

	public List<Facilities> getSpecificFacility(String userId, String facilityID) {

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			String queryString;
			// Transaction t = session.beginTransaction();
			User user = getSpecificUser(userId);
			if (user == null || !user.isAdmin() && !user.isUserManager() )
				queryString = "SELECT * "
						+ "FROM Facility_Management__c f where f.Contact__c =:userId and f.Facility__c =:facilityId";
			else
				queryString = "SELECT * "
						+ "FROM Facility_Management__c f where f.Facility__c =:facilityId";
			Query query = session.createNativeQuery(
					queryString,
					Facilities.class);
			if (user == null || !user.isAdmin() && !user.isUserManager() )
				query.setString("userId", userId);
			query.setString("facilityId", facilityID);
			List<Facilities> lst = query.list();
			trx.commit();
			session.close();
			for (Facilities facilities : lst) {
				if(facilities.getClientContact() !=null && !facilities.getClientContact().equalsIgnoreCase(userId))
					facilities.setClientContact(null);
			}
//			for (Facilities facility : lst) {
//				List<String> tankMonitorLabels = fetchTankMonitorLabels(facility);
//				facility.setTankMonitorLabels(tankMonitorLabels);
//			}
			setGasLevels(lst);
			CustomerPortalUtil.fillImageURL(lst);
			return lst;
		} catch (

		Exception exception)

		{
			exception.printStackTrace();
			System.out.println("Exception occred in getSpecificFacilitiesForUser method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}

	}

	public List<KeyValue> fetchTankMonitorLabels(Facilities facility) {
		List<KeyValue> tankMonitorLabelAndValueList = new ArrayList<KeyValue>();
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			String queryString = "SELECT Report_Label__c, Telnet_Code__c FROM tank_monitor_reports__c f";
				queryString += " where f.Tank_Monitor_Brand__c =:brand and f.Tank_Monitor_Model__c =:model order by UI_Priority__c ASC";
			Query query = session.createNativeQuery(queryString);
			query.setString("brand", facility.getTankMonitorBrand());
			query.setString("model", facility.getTankMonitorModel());
			// query.setString("contactId", userId);
			List<Object[]> lst = query.list();
			trx.commit();
			session.close();
			if(lst.size()>0) {
			for (Object[]  row : lst) {
				if(row[0] !=null) {
				KeyValue keyValue = new KeyValue();
				keyValue.setName(row[0].toString());
				if(row[1] !=null) {
					keyValue.setValue(row[1].toString());
				}
				tankMonitorLabelAndValueList.add(keyValue);
				}
			}
			}
			return tankMonitorLabelAndValueList;
		} catch (

		Exception exception)

		{
			exception.printStackTrace();
			System.out.println("Exception occred in fetchCompanies method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}
	}

	public List<Company> fetchCompanies(String userId) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			String queryString = "SELECT Company_Name__c,Company_Owner__c,Existing_Client__c,External_ID__c,Name,Owner_Name__c,Company_Address__c,Company__c FROM affiliate_company__c";
			User user = getSpecificUser(userId);
			if (user == null || !user.isAdmin() && !user.isUserManager())
				queryString += " where Company_Owner__c='" + userId + "'";
			Query query = session.createNativeQuery(queryString, Company.class);
			// query.setString("contactId", userId);
			List lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (

		Exception exception)

		{
			System.out.println("Exception occred in fetchCompanies method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}

	}

	public List<Company> fetchCompany(String userId,String companyId) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			String queryString = "SELECT Company_Name__c,Company_Owner__c,Existing_Client__c,External_ID__c,Name,Owner_Name__c,Company_Address__c,Company__c FROM affiliate_company__c";
			User user = getSpecificUser(userId);
			if (user == null || !user.isAdmin() && !user.isUserManager())
				queryString += " where Company_Owner__c='" + userId + "'";
			Query query = session.createNativeQuery(queryString, Company.class);
			// query.setString("contactId", userId);
			List lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (

		Exception exception)

		{
			System.out.println("Exception occred in fetchCompanies method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}

	}

	
	
	public int fetchComplianceFacilities(String userId, String facilitiesIdString, String compliance) {
		if (facilitiesIdString == null || facilitiesIdString.length() == 0) {
			return 0;
		}
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			String queryString ="";
			if(compliance.equalsIgnoreCase("true"))
				queryString ="Select count(*) from Account WHERE  (Is_GT_Compliant__c='" + compliance + "' and Is_NF_Compliant__c ='" + compliance + "')";
			else
				queryString ="Select count(*) from Account WHERE  (Is_GT_Compliant__c='" + compliance + "' or Is_NF_Compliant__c ='" + compliance + "')";
			if (facilitiesIdString != null && facilitiesIdString.length() > 0) {
				queryString += " and id in (" + facilitiesIdString + " )";
			}
			Query query = session.createNativeQuery(queryString);
			int size = ((Number) query.uniqueResult()).intValue();
			trx.commit();
			session.close();
			return size;
		} catch (

		Exception exception)

		{
			System.out.println("Exception occred in fetchComplianceFacilities method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return 0;
		} finally

		{

		}

	}

	public List<Facilities> facilityNotificationFormList(String facilitiesIdString) {

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			String queryString = "Select id from Account WHERE ((Is_Operator_Business_Registration__c = 'true' AND Operator_Business_Registration__c IS NULL) \r\n" + 
					"OR (Is_Property_Owner_Business_Registration__c = 'true' AND Property_Owner_Business_Registration__c IS NULL)\r\n" + 
					"OR (Is_UST_Owner_Business_Registration__c = 'true' AND UST_Owner_Business_Registration__c IS NULL) \r\n" + 
					"OR (Is_Operator_Owner_Tax_ID__c = 'true' AND Operator_Owner_Tax_ID__c IS NULL) \r\n" + 
					"OR (Is_Property_Owner_Tax_ID__c = 'true' AND Property_Owner_Tax_ID__c IS NULL)  \r\n" + 
					"OR (Is_UST_Owner_Tax_ID__c = 'true' AND UST_Owner_Tax_ID__c IS NULL)\r\n" + 
					"OR (Is_Operator_Lease_Agreement__c = 'true' AND Operator_Lease_Agreement_new__c IS NULL) \r\n" + 
					"OR (Is_Financial_Responsibility__c = 'true' AND Financial_Responsibility__c IS NULL) \r\n" + 
					"OR (Is_Deed_or_LC_Required__c = 'true' AND Deed_or_Land_Contract__c IS NULL)\r\n" + 
					"OR (Is_Facility_Site_Map__c  = 'true' AND Facility_Site_Map__c IS NULL) and  MGT_Paid_Service__c = 'true') ";

			if (facilitiesIdString != null && facilitiesIdString.length() > 0) {
				queryString += "and id in (" + facilitiesIdString + " )";
			}
			Query query = session.createNativeQuery(queryString);	
			List lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (

		Exception exception)

		{
			exception.printStackTrace();
			System.out.println("Exception occred in facilityNotificationFormList method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}

	}

	public List<Facilities> facilityComplianceList(String facilitiesIdString) {

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			String queryString = "Select id from Account WHERE ((Is_Release_Detection_Report_Required__c = 'true' AND Release_Detection_Report__c IS NULL)\r\n" + 
					"OR (Are_Repair_Documents_Required__c = 'true' AND Repair_Documents__c IS NULL) \r\n" + 
					"OR (Is_LnL_Detr_Tst_requrd__c = 'true' AND Line_and_Leak_Detector_Test__c IS NULL) \r\n" + 
					"OR (Is_Tank_Testing_Report_Required__c = 'true' AND Tank_Testing_Report__c IS NULL) \r\n" + 
					"OR (Is_CP_required__c = 'true' AND Cathodic_Protection__c IS NULL) \r\n" + 
					"OR (Is_IL_Inspection_Required__c = 'true' AND Internal_Lining_Inspection__c IS NULL) \r\n" + 
					"OR (Is_Piping_CP_Required__c = 'true' AND Piping_Cathodic_Protection__c IS NULL) \r\n" + 
					"OR (Is_Drop_Tube_Repair_Required__c = 'true' AND Drop_Tube_Repair_Document__c IS NULL) \r\n" + 
					"OR (Is_Tank_Interstitial_Monitoring_Required__c = 'true' AND Tank_Interstitial_Monitoring__c IS NULL) \r\n" + 
					"OR (Is_Pipe_Interstitial_Monitoring_Required__c = 'true' AND Piping_Interstitial_Monitoring__c IS NULL) \r\n" + 
					"OR (Is_ATG_Test_Required__c = 'true' AND ATG_Test_Report__c IS NULL) \r\n" + 
					"OR (Is_ATG_Repair_Required__c = 'true' AND ATG_Repair_Report__c IS NULL) \r\n" + 
					"OR (Is_Spill_Bucket_Testing_Required__c = 'true' AND Spill_Bucket_Testing_Document__c IS NULL) \r\n" + 
					"OR (Is_Spill_Bucket_Repair_Required__c = 'true' AND Spill_Bucket_Repair_Document__c IS NULL) \r\n" + 
					"OR (Is_Sump_Maintenance_Required__c = 'true' AND Sump_Maintenance_Document__c IS NULL) \r\n" + 
					"OR (Is_UDC_Maintenance_Required__c = 'true' AND UDC_Maintenance_Document__c IS NULL) \r\n" + 
					"OR (Is_SIR_Required__c = 'true' AND SIR_Report__c IS NULL) \r\n" + 
					"OR (Is_Monthly_Walk_Through_Inspection__c = 'true' AND Monthly_Walk_Through_Report__c IS NULL) \r\n" + 
					"OR (Is_Tank_Monitor_Static_IP__c = 'true' AND Tank_Monitor_Static_IP__c IS NULL) )";
			if (facilitiesIdString != null && facilitiesIdString.length() > 0) {
				queryString += "and id in (" + facilitiesIdString + " )";
			}

			Query query = session.createNativeQuery(queryString);
			List lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (

		Exception exception)

		{
			System.out.println("Exception occred in facilityComplianceList method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}

	}

	public List<Facilities> facilityCertificationList(String facilitiesIdString) {

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			String queryString = "Select id from Account WHERE "
					+ "(Operator_A_certificate__c is null  OR Operator_B_certificate__c is null  "
					+ "OR Operator_C_certificate__c is null) AND MGT_Paid_Service__c = 'true' ";
			if (facilitiesIdString != null && facilitiesIdString.length() > 0) {
				queryString += "and id in (" + facilitiesIdString + " )";
			}
			Query query = session.createNativeQuery(queryString);
			// Transaction t = session.beginTransaction();
			List lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (

		Exception exception)

		{
			System.out.println("Exception occred in facilityCertificationList method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}

	}

	public boolean resetPassword(ChangePassword changePasswordObj) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			User user = (User) session.get(User.class, changePasswordObj.getUsername());

			user.setPassword(new String(Base64.getEncoder().encode(changePasswordObj.getUpdatedPassword().getBytes())));
			session.update(user);
			trx.commit();
			session.close();
			return true;

		} catch (Exception exception) {
			System.out.println("Exception occred in changePassword method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return false;
		}
	}

	public boolean changePassword(ChangePassword changePasswordObj) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			User user = (User) session.get(User.class, changePasswordObj.getUsername());

			String password = new String(Base64.getEncoder().encode(changePasswordObj.getPassword().getBytes()));
			if (password.equals(user.getPassword())) {
				user.setPassword(
						new String(Base64.getEncoder().encode(changePasswordObj.getUpdatedPassword().getBytes())));
				user.setNewlyCreated(false);
				session.update(user);
				trx.commit();
				session.close();
				return true;
			} else {
				return false;
			}
		} catch (Exception exception) {
			System.out.println("Exception occred in changePassword method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return false;
		}
	}

	public List<Facilities> fetchFacilitiesForCompany(String companyName, String companyOwner) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			Query query = session
					.createNativeQuery(
							"SELECT * "
									+ "FROM Facility_Management__c f where f.company__c =:companyName",
							Facilities.class);
			// query.setString("userId", companyOwner);

			query.setString("companyName", companyName);
			List<Facilities> lst = query.list();
			setGasLevels(lst);

			trx.commit();
			session.close();
			CustomerPortalUtil.fillImageURL(lst);
			return lst;
		} catch (

		Exception exception)

		{
			exception.printStackTrace();
			System.out.println("Exception occred in fetchFacilitiesForCompany method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}

	}

	public List<Facilities> fetchFacilitiesFCompliance(String userId, String compliance) {

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			String queryString="";
			User user = getSpecificUser(userId);
			if (user == null || !user.isAdmin() && !user.isUserManager() )
				queryString="SELECT * FROM "
						+ "Facility_Management__c where contact__c =:userId";
				
			else
				queryString = "SELECT * FROM "
						+ "Facility_Management__c";
			Query query = session.createNativeQuery(queryString
					,
					Facilities.class);
			// if (compliance.equalsIgnoreCase("compliance")) {
			// query.setString("compliance", "true");
			// query.setString("tankService", "true");
			// } else{
			// query.setString("compliance", "false");
			// query.setString("tankService", "true");
			// }
			if (user == null || !user.isAdmin() && !user.isUserManager() )
			query.setString("userId", userId);
			List<Facilities> lst = query.list();
			trx.commit();
			session.close();
			CustomerPortalUtil.fillImageURL(lst);
			List<Facilities> resultList = new ArrayList<Facilities>();
			if (compliance.equalsIgnoreCase("compliance")) {
				for (Facilities facility : lst) {
					if (facility.getCompliance() != null && facility.getCompliance().equalsIgnoreCase("true"))
						resultList.add(facility);
				}
			}
			if (compliance.equalsIgnoreCase("non compliance")) {
				for (Facilities facility : lst) {
					if (facility.getCompliance() != null && facility.getCompliance().equalsIgnoreCase("false"))
						resultList.add(facility);
				}
			}
			return resultList;
		} catch (

		Exception exception)

		{
			exception.printStackTrace();
			System.out.println("Exception occred in fetchFacilitiesFCompliance method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}

	}

	public List<USSBOA> fetchUSSBOAContent(String vendorType) {

		List<USSBOA> lst = new ArrayList<USSBOA>();
		if(!vendorType.equalsIgnoreCase("preferred"))
			return lst;
		
		Session session = HibernateUtil.getSession();
		;
		Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery(
				"SELECT a.Name,a.Is_Active__c,a.BillingStreet,a.BillingCity,a.BillingState,	a.BillingPostalCode,c.name as vendorName,c.email__c,c.Phone,c.mobilephone, b.G360_URL__c "
						+ "FROM account a, contact c,custom_attachments__c b where a.Parent_Name__c = 'USSBOA Preferred Vendors' and a.Is_Active__c = 'True' AND a.Company_Contact__c = c.Id and a.id = b.facility__C and type__C ='Vendor Contract' ");
//		if(vendorType.equalsIgnoreCase("preferred"))
//			query.setString("vendorType", "Preferred Vendor");
//		else
//			query.setString("vendorType", "Associate Vendor");

		
		List<Object[]> rows = query.list();
		for (Object[] row : rows) {
			USSBOA ussboa = new USSBOA();
			if (row[0] != null)
				ussboa.setName(row[0].toString());
			if (row[1] != null && row[1].toString().equalsIgnoreCase("true"))
				ussboa.setActive(true);
			String street = null;
			if (row[2] != null)
				street = row[2].toString();
			String city = null;
			if (row[3] != null)
				city = row[3].toString();
			String state = null;
			if (row[4] != null)
				state = row[4].toString();
			String postalcode = null;
			if (row[5] != null)
				postalcode = row[5].toString();
			String address = getAddress(street, city, state, postalcode);
			ussboa.setAddress(address);
			if (row[6] != null)
				ussboa.setOwnerName(row[6].toString());
			if (row[7] != null)
				ussboa.setEmail(row[7].toString());
			if (row[8] != null)
				ussboa.setPhone(row[8].toString());
			if (row[9] != null)
				ussboa.setMobile(row[9].toString());
			if (row[10] != null)
				ussboa.setDocumentLink(row[10].toString());
			lst.add(ussboa);
		}
		t.commit();
		session.close();
		return lst;
	}

	public List<TankMonitorSignup> fetchTankMonitorSignup() {

		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery("SELECT FID__C,ipAddress,name,address from tank_monitor_signup",
				TankMonitorSignup.class);

		List<TankMonitorSignup> lst = query.list();
		t.commit();
		session.close();
		return lst;
	}

	public TankMonitorSignup fetchTankMonitorSearch(String searchString) {

		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery(
				"SELECT FID__C,ipAddress,name,address from tank_monitor_signup where FID__C =:searchString",
				TankMonitorSignup.class);
		query.setString("searchString", searchString);
		List<TankMonitorSignup> lst = query.list();
		TankMonitorSignup tSignup = new TankMonitorSignup();

		query = session.createNativeQuery("SELECT * from Account where FID__C =:searchString", Account.class);
		query.setString("searchString", searchString);
		List<Account> accountList = query.list();
		if (accountList != null && accountList.size() > 0) {
			Account account = accountList.get(0);
			tSignup.setFid(account.getFid());
			tSignup.setName(account.getName());
			String address = getAddress(account.getStreet(), account.getCity(), account.getState(),
					account.getPostalCode());
			tSignup.setAddress(address);
		} else {
			tSignup = null;
		}

		if (lst != null && lst.size() > 0) {
			TankMonitorSignup tmpSignup = lst.get(0);
			if (tSignup == null)
				tSignup = tmpSignup;
			tSignup.setIpAddress(tmpSignup.getIpAddress());
		}
		t.commit();	
		session.close();
		return tSignup;
	}

	private String getAddress(String street, String city, String state, String postalcode) {
		String address = "";
		if (street != null)
			address += street + ", ";
		if (city != null)
			address += city + ", ";
		if (state != null)
			address += state + ", ";
		if (postalcode != null)
			address += postalcode + ", ";
		if (address != null && address.trim().endsWith(",")) {
			address = address.trim();
			address = address.substring(0, address.length() - 1);
		}
		return address;
	}

	public Account fetchFacilitiesNotificationData(String facilitiesId, Account account) {

		String  operatorBusinessRegistration="NF - Operator Business Registration";
		String propertyOwnerBusinessRegistration="NF - Property Owner Business Registration";
		String ustOwnerBusinessRegistration ="NF - UST Owner Business Registration";
		String operatorOwnerTaxId ="NF - Operator Owner Tax ID";
		String propertyOwnerTaxId="NF - Property Owner Tax ID";
		String ustOwnerTaxId="NF - UST Owner Tax ID";
		String operatorLeaseAgreement="NF - Operator Lease Agreement";
		String financialResponsibility="NF - Financial Responsibility (Insurance)";
		String deedOrLandContract="NF - Deed or Land Contract";
		String facilitySiteMap="NF - Facility Site Map";
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			Query query = session.createNativeQuery(
					"SELECT * FROM account where MGT_Paid_Service__c = 'true' AND id =:facilitiesId",
					Account.class);

			query.setString("facilitiesId", facilitiesId);
			List<Account> lst = query.list();
			trx.commit();
			session.close();
			if (lst.size() > 0) {
				Account localAccount = lst.get(0);
				
				

				if(localAccount.getIsOperatorBusinessRegistration()!= null && localAccount.getIsOperatorBusinessRegistration().equalsIgnoreCase("true") && localAccount.getOperatorBusinessRegistration() == null)
					account.setOperatorBusinessEnable(true);
				if(localAccount.getOperatorBusinessRegistration() !=null)
					account.setOperatorBusinessURL(localAccount.getOperatorBusinessRegistration());
				if(localAccount.getIsPropertyOwnerBusinessRegistration()!=null && localAccount.getIsPropertyOwnerBusinessRegistration().equalsIgnoreCase("true") && localAccount.getPropertyOwnerBusinessRegistration() == null)
					account.setPropertyOwnerBusinessEnable(true);
				if(localAccount.getPropertyOwnerBusinessRegistration() !=null)
					account.setPropertyOwnerBusinessURL(localAccount.getPropertyOwnerBusinessRegistration());
				if(localAccount.getIsOwnerBusinessRegistration()!=null && localAccount.getIsOwnerBusinessRegistration().equalsIgnoreCase("true") && localAccount.getUstOwnerBusinessRegistration() == null)
					account.setUstOwnerBusinessEnable(true);
				if(localAccount.getUstOwnerBusinessRegistration() !=null)
					account.setUstOwnerBusinessURL(localAccount.getUstOwnerBusinessRegistration());
				if(localAccount.getIsOperatorOwnerTaxId()!=null && localAccount.getIsOperatorOwnerTaxId().equalsIgnoreCase("true") && localAccount.getOperatorOwnerTaxId() == null)
					account.setOperatorOwnerEnable(true);
				if(localAccount.getIsPropertyOwnerTaxId()!=null && localAccount.getIsPropertyOwnerTaxId().equalsIgnoreCase("true") && localAccount.getPropertyOwnerTaxId() == null)
					account.setPropertyOwnerTaxIDEnable(true);
				if(localAccount.getIsUSTOwnerTaxId()!=null && localAccount.getIsUSTOwnerTaxId().equalsIgnoreCase("true") && localAccount.getUstOwnerTaxId() == null)
					account.setUstOwnerBusinessEnable(true);
				if(localAccount.getIsOperatorLeaseAgreement()!=null && localAccount.getIsOperatorLeaseAgreement().equalsIgnoreCase("true") && localAccount.getOperatorLeaseAgreementNew() == null)
					account.setOperatorLeaseAgreementEnable(true);
				if(localAccount.getIsFinancialResponsibility()!=null && localAccount.getIsFinancialResponsibility().equalsIgnoreCase("true") && localAccount.getFinancialResponsibility() == null)
					account.setFinancialResponsibilityEnable(true);
				if(localAccount.getIsDeedOrLCRequired()!=null && localAccount.getIsDeedOrLCRequired().equalsIgnoreCase("true") && localAccount.getDeedOrLandContract() == null)
					account.setPropertyDeedLandContractEnable(true);
				if(localAccount.getIsFacilitySiteMap()!=null && localAccount.getIsFacilitySiteMap().equalsIgnoreCase("true") && localAccount.getFacilitySiteMap() == null)
					account.setFacilitySiteMapEnable(true);
				if(localAccount.getCofaLink() != null)
					account.setCofaLinkURL(localAccount.getCofaLink());
			
				
				String custom_portal_whereclause = "";
				
				if(localAccount.getIsOperatorBusinessRegistration().equalsIgnoreCase("true") && localAccount.getOperatorBusinessRegistration()== null)
					custom_portal_whereclause+= "'"+operatorBusinessRegistration+"'"+",";
				if(localAccount.getIsPropertyOwnerBusinessRegistration().equalsIgnoreCase("true") && localAccount.getPropertyOwnerBusinessRegistration()== null)
					custom_portal_whereclause+= "'"+propertyOwnerBusinessRegistration+"'"+",";
				if(localAccount.getIsOwnerBusinessRegistration().equalsIgnoreCase("true") && localAccount.getUstOwnerBusinessRegistration()== null)
					custom_portal_whereclause+= "'"+ustOwnerBusinessRegistration+"'"+",";
				if(localAccount.getIsOperatorOwnerTaxId().equalsIgnoreCase("true") && localAccount.getOperatorOwnerTaxId()== null)
					custom_portal_whereclause+= "'"+operatorOwnerTaxId+"'"+",";
				if(localAccount.getIsPropertyOwnerTaxId().equalsIgnoreCase("true") && localAccount.getPropertyOwnerTaxId()== null)
					custom_portal_whereclause+= "'"+propertyOwnerTaxId+"'"+",";
				if(localAccount.getIsUSTOwnerTaxId().equalsIgnoreCase("true") && localAccount.getUstOwnerTaxId()== null)
					custom_portal_whereclause+= "'"+ustOwnerTaxId+"'"+",";
				if(localAccount.getIsOperatorLeaseAgreement().equalsIgnoreCase("true") && localAccount.getOperatorLeaseAgreementNew()== null)
					custom_portal_whereclause+= "'"+operatorLeaseAgreement+"'"+",";
				if(localAccount.getIsFinancialResponsibility().equalsIgnoreCase("true") && localAccount.getFinancialResponsibility()== null)
					custom_portal_whereclause+= "'"+financialResponsibility+"'"+",";

				if(localAccount.getIsDeedOrLCRequired().equalsIgnoreCase("true") && localAccount.getDeedOrLandContract()== null)
					custom_portal_whereclause+= "'"+deedOrLandContract+"'"+",";
				if(localAccount.getFacilitySiteMap() == null && localAccount.getIsFacilitySiteMap().equalsIgnoreCase("true"))
					custom_portal_whereclause+= "'"+facilitySiteMap+"'"+",";
//				if(localAccount.getCofaLink() == null)
//					custom_portal_whereclause+= "'"+cofaLink+"'"+",";
				if(custom_portal_whereclause.endsWith(","))
					custom_portal_whereclause = custom_portal_whereclause.substring(0, custom_portal_whereclause.lastIndexOf(","));
				if(custom_portal_whereclause.trim().length()>0){
				session = HibernateUtil.getSession();
				trx = session.beginTransaction();
				try {
					// Transaction t = session.beginTransaction();
					query = session.createNativeQuery(
							"SELECT * FROM customer_portal_attachments__c  where facility__c =:facilitiesId and type__c in ("+custom_portal_whereclause+")",CustomerPortalAttachments.class);
					query.setString("facilitiesId", facilitiesId);
					List<CustomerPortalAttachments> customPortalList = query.list();
					trx.commit();
					session.close();
					if(customPortalList.size()>0){
						for (CustomerPortalAttachments attachments : customPortalList) {
							
						
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(operatorBusinessRegistration) && attachments.getApprovalStatus() != null)
							account.setOperatorBusinessSubmitted(true);
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(propertyOwnerBusinessRegistration) && attachments.getApprovalStatus() != null)
							account.setPropertyOwnerBusinessSubmitted(true);
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(ustOwnerBusinessRegistration) && attachments.getApprovalStatus() != null)
							account.setUstOwnerBusinessSubmitted(true);
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(operatorOwnerTaxId) && attachments.getApprovalStatus() != null)
							account.setOperatorOwnerSubmitted(true);
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(propertyOwnerTaxId) && attachments.getApprovalStatus() != null)
							account.setPropertyOwnerTaxIDSubmitted(true);
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(ustOwnerTaxId) && attachments.getApprovalStatus() != null)
							account.setUstOwnerSubmitted(true);
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(operatorLeaseAgreement) && attachments.getApprovalStatus() != null)
							account.setOperatorLeaseAgreementSubmitted(true);
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(financialResponsibility) && attachments.getApprovalStatus() != null)
							account.setFinancialResponsibilitySubmitted(true);
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(deedOrLandContract) && attachments.getApprovalStatus() != null)
							account.setPropertyDeedLandContractSubmitted(true);
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(facilitySiteMap) && attachments.getApprovalStatus() != null)
							account.setFacilitySiteMapSubmitted(true);
					}
					}
					
				} catch (Exception exception) {
					exception.printStackTrace();
					System.out.println(
							"Exception occred in fetchFacilitiesNotificationData method -- " + exception.getMessage());
					if (trx != null)
						trx.rollback();
					if (session != null)
						session.close();
				} finally{}
				}
				
				//custom attachments
				String custom_attachments_whereclause = "";
				
				if(localAccount.getOperatorBusinessRegistration()!= null)
					custom_attachments_whereclause+= "'"+operatorBusinessRegistration+"'"+",";
				if(localAccount.getPropertyOwnerBusinessRegistration()!= null)
					custom_attachments_whereclause+= "'"+propertyOwnerBusinessRegistration+"'"+",";
				if(localAccount.getUstOwnerBusinessRegistration()!= null)
					custom_attachments_whereclause+= "'"+ustOwnerBusinessRegistration+"'"+",";
				if(localAccount.getOperatorOwnerTaxId()!= null)
					custom_attachments_whereclause+= "'"+operatorOwnerTaxId+"'"+",";
				if(localAccount.getPropertyOwnerTaxId()!= null)
					custom_attachments_whereclause+= "'"+propertyOwnerTaxId+"'"+",";
				if(localAccount.getUstOwnerTaxId()!= null)
					custom_attachments_whereclause+= "'"+ustOwnerTaxId+"'"+",";
				if(localAccount.getOperatorLeaseAgreement()!= null)
					custom_attachments_whereclause+= "'"+operatorLeaseAgreement+"'"+",";
				if(localAccount.getFinancialResponsibility()!= null)
					custom_attachments_whereclause+= "'"+financialResponsibility+"'"+",";

				if(localAccount.getDeedOrLandContract()!= null)
					custom_attachments_whereclause+= "'"+deedOrLandContract+"'"+",";
				if(localAccount.getIsFacilitySiteMap() != null)
					custom_attachments_whereclause+= "'"+facilitySiteMap+"'"+",";
				
				if(custom_attachments_whereclause.endsWith(","))
					custom_attachments_whereclause = custom_attachments_whereclause.substring(0, custom_attachments_whereclause.lastIndexOf(","));
				session = HibernateUtil.getSession();
				trx = session.beginTransaction();
				try {
					// Transaction t = session.beginTransaction();
					query = session.createNativeQuery(
							"SELECT * FROM custom_attachments__c  where facility__c =:facilitiesId and active__c='true' and type__c in ("+custom_attachments_whereclause+")",CustomAttachments.class);
					query.setString("facilitiesId", facilitiesId);
					List<CustomAttachments> customPortalList = query.list();
					trx.commit();
					session.close();
					if(customPortalList.size()>0){
						for (CustomAttachments attachments : customPortalList) {
//						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(operatorBusinessRegistration))
//							account.setOperatorBusinessURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
//						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(propertyOwnerBusinessRegistration))
//							account.setPropertyOwnerBusinessURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
//						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(ustOwnerBusinessRegistration))
//							account.setUstOwnerBusinessURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(operatorOwnerTaxId))
							account.setOperatorOwnerURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(propertyOwnerTaxId))
							account.setPropertyOwnerTaxIDURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(ustOwnerTaxId))
							account.setUstOwnerURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(operatorLeaseAgreement))
							account.setOperatorLeaseAgreementURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(financialResponsibility))
							account.setFinancialResponsibilityURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(deedOrLandContract))
							account.setPropertyDeedLandContractURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(facilitySiteMap))
							account.setFacilitySiteMapURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);;
//						if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(cofaLink))
//							account.setCofaLinkURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
					}

				}
					
				} catch (Exception exception) {
					exception.printStackTrace();
					System.out.println(
							"Exception occred in fetchFacilitiesNotificationData method -- " + exception.getMessage());
					if (trx != null)
						trx.rollback();
					if (session != null)
						session.close();
				} finally{}
				

				return account;
			}
			return account;
		} catch (

		Exception exception)

		{

			exception.printStackTrace();
			System.out
					.println("Exception occred in fetchFacilitiesNotificationData method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}

	}

	public void insertCustomPortalAttachment(String facilityId, int id, String type) {
		CustomerPortalAttachments attachment = new CustomerPortalAttachments();
		attachment.setApprovalStatus("Pending");
		attachment.setId(id+"");
		attachment.setFacility(facilityId);
		attachment.setType(type);

		Session session = null;

		Transaction trx = null;
		try {
			session = HibernateUtil.getSession();
			trx = session.beginTransaction();
			session.save(attachment);
			trx.commit();
			session.close();
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred in updating user Preferences method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();

		}
		// User user = (User) session.get(User.class, username);

	}

	public SearchResults retrieveSearchResults(String searchType, String searchString, String username,
			boolean isadmin) {
		SearchResults result = new SearchResults();
		// List<String> facilitiesList = fetchFacilityId(username);
		searchString = searchString.trim();
		List<Facilities> facilitiesList = searchFacilities(searchType, username, searchString);
		if(facilitiesList != null)
			CustomerPortalUtil.getActualFacilitiesList(facilitiesList,username);
		List<Company> companiesList = fetchCompanyNamesForSearch(searchType, username, searchString);
		for (Company company : companiesList) {
			List<Facilities> facilitiesListLocal = DBUtil.getInstance()
					.fetchFacilitiesForCompany(company.getCompanyName(), company.getCompanyOwner());
			CustomerPortalUtil.getActualFacilitiesList(facilitiesListLocal,username);
			company.setFacilities(facilitiesListLocal);
		}
		result.setFacilitiesList(facilitiesList);
		result.setCompaniesList(companiesList);
		return result;
	}

	private List<Company> fetchCompanyNamesForSearch(String searchType, String userId, String searchString) {
		if (searchType.equalsIgnoreCase("fid")) {

			return new ArrayList<Company>();
		}
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			String queryString = "SELECT * FROM affiliate_company__c";
			queryString += " where ";
			User user = getSpecificUser(userId);
			if (user == null || !user.isAdmin() && !user.isUserManager())
				queryString += " Company_Owner__c='" + userId + "'  and ";
			queryString += "( ";
			if (searchType.equalsIgnoreCase("all")) {
				queryString += " Company__c like '%" + searchString + "%' or Company_Address__c like '%" + searchString
						+ "%'";
			}

			if (searchType.equalsIgnoreCase("name")) {
				queryString += " Company__c like '%" + searchString + "%'";
			}
			if (searchType.equalsIgnoreCase("address")) {
				queryString += " Company_Address__c like '%" + searchString + "%'";
			}
			queryString += " )";

			Query query = session.createNativeQuery(queryString, Company.class);
			// query.setString("contactId", userId);
			List lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (

		Exception exception)

		{
			System.out.println("Exception occred in fetchCompanies method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}

	}

	public List<String> fetchFacilityId(String userId) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			Query query = session.createNativeQuery(
					"select Facility__c FROM Facility_Management__c where Contact__c= '" + userId + "'");
			List lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (

		Exception exception)

		{
			System.out.println("Exception occred in fetchFacilityId method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}
	}

	public List<Company> fetchCompanyNames(String userId) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			Query query = session.createNativeQuery(
					"SELECT Company_Name__c,Company_Owner__c,Existing_Client__c,External_ID__c,Name,Owner_Name__c FROM affiliate_company__c where Company_Owner__c= '"
							+ userId + "'",
					Company.class);
			// Transaction t = session.beginTransaction();
			// Query query = session.createNativeQuery(
			// "SELECT
			// Company_Name__c,Company_Owner__c,Existing_Client__c,External_ID__c,Name,Owner_Name__c
			// FROM affiliate_company__c where Company_Owner__c='"
			// + userId + "'",
			// Company.class);
			// query.setString("contactId", userId);
			List lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (

		Exception exception)

		{
			exception.printStackTrace();
			System.out.println("Exception occred in fetchCompanies  method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}

	}

	public List<LoginHistory> getLoginHistory(String userId) {

		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery("SELECT * FROM loginhistory where userId =:userId", LoginHistory.class);
		query.setString("userId", userId);
		List lst = query.list();
		t.commit();
		session.close();
		return lst;

	}

	public List<FacilityProductMap> getSpecificFacilityProductMap(String facilityId) {

		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery("SELECT * FROM facility_product_map__c where Facility__C =:facilityId", FacilityProductMap.class);
		query.setString("facilityId", facilityId);
		List lst = query.list();
		t.commit();
		session.close();
		 
		if(lst != null)
			return lst;
		return null;
	}
	
	public List<KeyValue> retrieveConsolidateReport(List<Facilities> facilitiesList) {
		// Map<String, Object> consolidateMap = new HashMap<String, Object>();
		List<KeyValue> consolidateList = new ArrayList<KeyValue>();
		List<KeyValue> consolidateFinalList = new ArrayList<KeyValue>();
		for (Facilities facilities : facilitiesList) {
			if (facilities == null)
				continue;
			consolidateList = new ArrayList<KeyValue>();
			List<FacilityProductMap> facilityProductMap =  getSpecificFacilityProductMap(facilities.getFacilityId());
			Session session = HibernateUtil.getSession();
			Transaction t = session.beginTransaction();

			Query query = session.createNativeQuery(
					"SELECT MAX(Date__c) as DATETIME, PRODUCT__c, GALLONS__c, TANK__c FROM inventoryreport__c where Facility__c='"
							+ facilities.getFacilityId()
							+ "' and Date__c  = (SELECT MAX(Date__c) FROM inventoryreport__c where Facility__c='"
							+ facilities.getFacilityId()
							+ "' )  group by Tank__C order by Date__C DESC;");
			List<Object[]> lst = query.list();
			t.commit();
			session.close();

			System.out.println(lst.size());
			if (lst.size() > 0) {
				for (Object[] row : lst) {
					InventoryReport iReport = new InventoryReport();
					if(row[0] !=null)
						iReport.setDateTime(row[0].toString());
					if(row[1] !=null)
					iReport.setProduct(row[1].toString());
					if(row[2] !=null)
						iReport.setGallons(row[2].toString());
					if(row[3] !=null)
						iReport.setTank(row[3].toString());
					boolean productFound = false;
					KeyValue selectedKeyValue = null;
					for (KeyValue keyvalue : consolidateList) {
						if (keyvalue.getKey().equalsIgnoreCase(iReport.getProduct())) {
							productFound = true;
							selectedKeyValue = keyvalue;
							break;
						}

					}
					if (productFound) {
						int gallonsIntValue = (int) Double.parseDouble(selectedKeyValue.getValue());
						gallonsIntValue += (int) Double.parseDouble(iReport.getGallons());
						selectedKeyValue.setValue(gallonsIntValue + "");
					} else {
						KeyValue kv = new KeyValue();
						kv.setKey(iReport.getProduct().toUpperCase());
						kv.setName(iReport.getTank());
						kv.setValue(iReport.getGallons());
						consolidateList.add(kv);
					}
					System.out.println(iReport);
				}
			}
			
			for (KeyValue keyvalue : consolidateList) {	
			
				boolean productFound = false;
				FacilityProductMap selectedProductMap=null;
				for (FacilityProductMap productMap : facilityProductMap) {
					if(productMap.getProduct().trim().equalsIgnoreCase(keyvalue.getKey().trim())) {
						productFound = true;
						selectedProductMap = productMap;
						break;
				}
				
			}
				if(productFound) {
					KeyValue selectedKeyValue = null;
					boolean finalProductFound = false;
					
					for (KeyValue finalKeyValue : consolidateFinalList) {
						if (finalKeyValue.getKey().trim().equalsIgnoreCase(selectedProductMap.getFuelType())) {
							finalProductFound = true;
							selectedKeyValue = finalKeyValue;
							break;
						}
					}
						if(finalProductFound) {
							int gallonsIntValue = (int) Double.parseDouble(selectedKeyValue.getValue());
							gallonsIntValue += (int) Double.parseDouble(keyvalue.getValue());
							selectedKeyValue.setValue(gallonsIntValue + "");
						} else {
							KeyValue kv = new KeyValue();
							kv.setKey(selectedProductMap.getFuelType().toUpperCase());
							kv.setName(keyvalue.getName());
							kv.setValue(keyvalue.getValue());
							consolidateFinalList.add(kv);
						}
							
						}else {
							KeyValue kv = new KeyValue();
							kv.setKey(keyvalue.getKey().trim().toUpperCase());
							kv.setName(keyvalue.getName());
							kv.setValue(keyvalue.getValue());
							consolidateFinalList.add(kv);
						}
					
					
				}
					
//					KeyValue selectedKeyValue = null;
//					for (KeyValue keyvalue : consolidateList) {
//						if (keyvalue.getKey().equalsIgnoreCase(productMap.getProduct())) {
//							productFound = true;
//							selectedKeyValue = keyvalue;
//							break;
//						}
//
//					}
//					if (productFound) {
//						for (KeyValue keyValue : consolidateFinalList) {
//							
//						}
//						
//						int gallonsIntValue = (int) Double.parseDouble(selectedKeyValue.getValue());
////						gallonsIntValue += (int) Double.parseDouble();
//						selectedKeyValue.setValue(gallonsIntValue + "");
//					} else {
//						KeyValue kv = new KeyValue();
//						kv.setKey(productMap.getProduct().toUpperCase());
//						kv.setName(selectedKeyValue.getName());
//						kv.setValue(selectedKeyValue.getValue());
//						consolidateFinalList.add(kv);
//					}
					
				}
				
		

		// query.setString("userId", userId);
	
		return consolidateFinalList;
	}

	public List<KeyValue> retrieveSpecifiFacilityConsolidateReport(Facilities facilities) {
		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
		// Map<String, Object> consolidateMap = new HashMap<String, Object>();
		List<KeyValue> consolidateList = new ArrayList<KeyValue>();

		Query query = session
				.createNativeQuery(
						"SELECT MAX(Date__c) as DATETIME, PRODUCT__c, GALLONS__c, TANK__c FROM inventoryreport__c where Facility__c='"
								+ facilities.getFacilityId()
								+ "' and Date__c  = (SELECT MAX(Date__c ) FROM inventoryreport__c where Facility__c='"
								+ facilities.getFacilityId()
								+ "' )  group by Tank__C order by Date__C  DESC   ;");
		List<Object[]> lst = query.list();
		System.out.println(lst.size());
		if (lst.size() > 0) {
			for (Object[] row : lst) {
				InventoryReport iReport = new InventoryReport();
				if(row[0] !=null)
					iReport.setDateTime(row[0].toString());
				if(row[1] !=null)
				iReport.setProduct(row[1].toString());
				if(row[2] !=null)
					iReport.setGallons(row[2].toString());
				if(row[3] !=null)
					iReport.setTank(row[3].toString());
				boolean productFound = false;
				KeyValue selectedKeyValue = null;
				for (KeyValue keyvalue : consolidateList) {
					if (keyvalue.getKey().equalsIgnoreCase(iReport.getProduct())) {
						productFound = true;
						selectedKeyValue = keyvalue;
						break;
					}

				}
				if (productFound) {
					int gallonsIntValue = (int) Double.parseDouble(selectedKeyValue.getValue());
					gallonsIntValue += (int) Double.parseDouble(iReport.getGallons());
					selectedKeyValue.setValue(gallonsIntValue + "");
				} else {
					KeyValue kv = new KeyValue();
					kv.setKey(iReport.getProduct().trim().toUpperCase());
					kv.setValue(iReport.getGallons());
					consolidateList.add(kv);
				}
				if(facilities.getGasLevelUpdatedDate()== null) {
					SimpleDateFormat df=new SimpleDateFormat("MMM dd, yyyy kk:mm aa");
					df.setTimeZone(TimeZone.getTimeZone("America/New_York"));
					SimpleDateFormat df1=new SimpleDateFormat("MMM dd, yyyy kk:mm aa");
					df1.setTimeZone(TimeZone.getTimeZone("America/New_York"));
				try {
					facilities.setGasLevelUpdatedDate(df1.format(df.parse(iReport.getDateTime()+"")).toUpperCase());
				} catch (ParseException e) {
					if(facilities.getGasLevelUpdatedDate()== null) {
						SimpleDateFormat df2=new SimpleDateFormat("MMM dd, yyyy kk:mm aa");
						df2.setTimeZone(TimeZone.getTimeZone("America/New_York"));
						SimpleDateFormat df3=new SimpleDateFormat("MMM dd, yyyy kk:mm aa");
						df3.setTimeZone(TimeZone.getTimeZone("America/New_York"));
					try {
						facilities.setGasLevelUpdatedDate(df3.format(df2.parse(iReport.getDateTime()+"")).toUpperCase());
					} catch (ParseException e1) {
						facilities.setGasLevelUpdatedDate("");
					}
				}
				}
				}
				//				System.out.println(iReport);
			}
		}

		// query.setString("userId", userId);
		t.commit();
		session.close();
		return consolidateList;
	}

	public boolean addOrUpdateTankMonitorSignup(TankMonitorSignup tankSignup) {

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			TankMonitorSignup tankDB = (TankMonitorSignup) session.get(TankMonitorSignup.class, tankSignup.getFid());

			if (tankDB == null) {
				session.save(tankSignup);
			} else {
				tankDB.setIpAddress(tankSignup.getIpAddress());
				session.update(tankDB);
			}

			trx.commit();
			session.close();

		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred in addOrUpdateTankMonitorSignup   method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return false;
		} finally {

		}
		return true;

	}

	public boolean deleteTankMonitorSignup(String facilitiesId) {

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			TankMonitorSignup tankDB = (TankMonitorSignup) session.get(TankMonitorSignup.class, facilitiesId);

			if (tankDB != null) {
				session.delete(tankDB);
			}
			
			trx.commit();
			session.close();
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred in deleteTankMonitorSignup   method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return false;
		} finally {

		}
		return true;

	}

	public boolean saveUserPreferences(Userpreferences pref) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			Userpreferences userPref = (Userpreferences) session.get(Userpreferences.class, pref.getName());

			if (userPref != null) {
				userPref.setValue(pref.getValue());
				session.update(userPref);
			} else {
				session.save(pref);
			}
			trx.commit();
			session.close();

		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred in saveUserPreferences   method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return false;
		} finally {

		}
		return true;
	}

	public List<Userpreferences> getUserPreferences() {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {

			Query query = session.createNativeQuery("SELECT * FROM userpreferences", Userpreferences.class);
			List lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (Exception exception) {
			exception.printStackTrace();

			System.out.println("Exception occred in getUserPreferences   method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally {

		}
	}

	public String getUserPreferences(String name) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {

			Userpreferences userPref = (Userpreferences) session.get(Userpreferences.class, name);
			trx.commit();
			session.close();
			if (userPref != null)
				return userPref.getValue();
		} catch (Exception exception) {
			exception.printStackTrace();

			System.out.println("Exception occred in getUserPreferences   method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally {

		}
		return name;
	}
	public List<TankAarmHistory> getTankalarmHistory(String facilitiesIdString) {
		if(facilitiesIdString == null || facilitiesIdString.trim().length()==0)
			return new ArrayList<TankAarmHistory>();
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			long millisec = System.currentTimeMillis();
			Query query = session.createNativeQuery(
					"SELECT tnk.FID__c, acc.Name, tnk.OccuredDate__c, tnk.AlarmType__c, tnk.Id FROM tankalarmhistory__c tnk, account acc where tnk.Facility__c = acc.Id  and (tnk.viewed is null or tnk.viewed ='false') "
					+ "and tnk.AlarmType__C !='---' and facility__C in ("
							+ facilitiesIdString + " ) order by tnk.OccuredDate__c desc");

			List<TankAarmHistory> lst = new ArrayList<TankAarmHistory>();
			List<Object[]> rows = query.list();
			trx.commit();
			session.close();
			System.out.println("query execute in "+((System.currentTimeMillis()-millisec)/1000) +"  seconds");
			for (Object[] row : rows) {
				TankAarmHistory alarmHistory = new TankAarmHistory();
				if (row[0] != null)
					alarmHistory.setFid(row[0].toString());
				if (row[1] != null)
					alarmHistory.setName(row[1].toString());

				if (row[2] != null)
					alarmHistory.setOccuredDate(row[2].toString());
				if (row[3] != null)
					alarmHistory.setAlarmType(row[3].toString());
				if (row[4] != null)
					alarmHistory.setId(row[4].toString());
				lst.add(alarmHistory);
			}


			return lst;
		} catch (

		Exception exception)

		{
			exception.printStackTrace();
			System.out.println("Exception occred in getTankalarmHistory method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		}

	}
	
	public List<TankAlarmHistoryData> getTankalarmHistoryNew(String facilitiesIdString) {

		List<TankAlarmHistoryData> alarmHistoryList  = new ArrayList<TankAlarmHistoryData>();
		if(facilitiesIdString == null || facilitiesIdString.trim().length()==0)
			return alarmHistoryList;
		
		Map<String,List<TankAarmHistory>> tankMap = new HashMap<String,List<TankAarmHistory>>();
		Map<String,Integer> tankMapCountMap = new HashMap<String,Integer>();
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			long millisec = System.currentTimeMillis();
			Query query = session.createNativeQuery(
					"SELECT tnk.FID__c, acc.Name, tnk.OccuredDate__c, tnk.AlarmType__c, tnk.Id,tnk.AlarmType__C,tnk.viewed FROM tankalarmhistory__c tnk, account acc where tnk.Facility__c = acc.Id  and SUBSTRING(tnk.OccuredDate__c,1,10) >=  DATE_SUB(CURDATE(), INTERVAL 1 MONTH)  "
							+ "and tnk.AlarmType__C !='---' and facility__C in (" + facilitiesIdString
							+ " ) order by tnk.OccuredDate__c desc");

			List<TankAarmHistory> lst = new ArrayList<TankAarmHistory>();
			List<Object[]> rows = query.list();
			trx.commit();
			session.close();
			System.out.println("query execute in " + ((System.currentTimeMillis() - millisec) / 1000) + "  seconds and the total records are"+rows.size());
			for (Object[] row : rows) {
				TankAarmHistory alarmHistory = new TankAarmHistory();
				if (row[0] != null)
					alarmHistory.setFid(row[0].toString());
				if (row[1] != null)
					alarmHistory.setName(row[1].toString());

				if (row[2] != null)
					alarmHistory.setOccuredDate(row[2].toString());
				if (row[3] != null)
					alarmHistory.setAlarmType(row[3].toString());
				if (row[4] != null)
					alarmHistory.setId(row[4].toString());
				if (row[5] != null)
					alarmHistory.setAlarmType(row[5].toString());
				if (row[6] != null) {
					alarmHistory.setViewed(row[6].toString());

				}
				if (row[6] == null || row[6].toString().equalsIgnoreCase("false"))
					if (tankMapCountMap.get(alarmHistory.getAlarmType()) != null) {
						tankMapCountMap.put(alarmHistory.getAlarmType(),
								tankMapCountMap.get(alarmHistory.getAlarmType()) + 1);

					} else {

						tankMapCountMap.put(alarmHistory.getAlarmType(), 1);
					}
			
				// lst.add(alarmHistory);
				if (tankMap.get(alarmHistory.getAlarmType()) != null) {
					tankMap.get(alarmHistory.getAlarmType()).add(alarmHistory);

				} else {
					List<TankAarmHistory> tempList = new ArrayList<TankAarmHistory>();
					tempList.add(alarmHistory);
					tankMap.put(alarmHistory.getAlarmType(), tempList);
				}

			}

			// if(lst.size()!=0){
			// for (TankAarmHistory history: lst) {
			//
			// }
			// data.setName(alarmType);
			// data.setAlarmHistory(lst);
			// alarmHistoryList.add(data);
			// }
			int totalCount = 0;
			for (String alarmType : tankMapCountMap.keySet()) {
				totalCount += tankMapCountMap.get(alarmType);
			}

			for (String alarmType : tankMap.keySet()) {
				TankAlarmHistoryData data = new TankAlarmHistoryData();
				if (tankMapCountMap.get(alarmType) != null){
					data.setName(alarmType + " (" + tankMapCountMap.get(alarmType) + ")");
					data.setViewCount(tankMapCountMap.get(alarmType));
				}
				else
					data.setName(alarmType);
				data.setAlarmHistory(tankMap.get(alarmType));
				data.setTotalCount(totalCount);
				alarmHistoryList.add(data);
			}
			return alarmHistoryList;
		} catch (

		Exception exception)

		{
			exception.printStackTrace();
			System.out.println("Exception occred in getTankalarmHistory method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		}

	}

	public boolean resetTankalarmHistory(String[] facilityArray) {

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			for (String facility : facilityArray) {

				TankAarmHistory alarmHistory = (TankAarmHistory) session.get(TankAarmHistory.class, facility);

				if (alarmHistory != null) {
					alarmHistory.setViewed("true");
					session.update(alarmHistory);
				}
			}
			trx.commit();
			session.close();
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred in resetTankalarmHistory   method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return false;
		} finally {

		}
		return true;

	}

	public List<JobSchedule> getJobScheduleData() {

		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery("SELECT * FROM schedulejob", JobSchedule.class);
		List lst = query.list();
		t.commit();
		session.close();
		return lst;
	}

	public JobSchedule saveJobScheduleData(JobSchedule schedule) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {

			JobSchedule scheduleDB = (JobSchedule) session.get(JobSchedule.class, schedule.getJobName());
			if (scheduleDB != null) {
				scheduleDB.setDependentJobName(schedule.getDependentJobName());
				scheduleDB.setEndFilePath(schedule.getEndFilePath());
				scheduleDB.setRecurrence(schedule.isRecurrence());
				scheduleDB.setSourceFilePath(schedule.getSourceFilePath());
				scheduleDB.setJobPath(schedule.getJobPath());
				scheduleDB.setSchedule(schedule.getSchedule());
				scheduleDB.setStartTime(schedule.getStartTime());
				session.update(scheduleDB);
			} else {
				session.save(schedule);
			}
			trx.commit();
			session.close();
			return schedule;
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred in saveJobScheduleData   method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally {

		}
	}

	public boolean deleteJobScheduleData(String jobName) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {

			JobSchedule scheduleDB = (JobSchedule) session.get(JobSchedule.class, jobName);
			if (scheduleDB != null) {
				session.remove(scheduleDB);
			}
			trx.commit();
			session.close();
			return true;
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred in deleteJobScheduleData   method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return false;
		} finally {

		}
	}

	public List<JobSchedule> getParentSchedulejobs() {

		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery(
				"SELECT * FROM schedulejob where dependentjob is null or dependentjob = ''", JobSchedule.class);
		List lst = query.list();
		t.commit();
		session.close();
		return lst;
	}

	public List<JobSchedule> getChildSchedulejobs(String jobName) {
		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery("SELECT * FROM schedulejob where dependentjob =:jobName",
				JobSchedule.class);
		query.setString("jobName", jobName);
		List lst = query.list();
		t.commit();
		session.close();
		return lst;
	}

	public void writeSchduleHistory(JobScheduleHistory history) {

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {

			session.save(history);
			trx.commit();
			session.close();
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred in saveJobScheduleData   method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			
		} finally {

		}

	}

	public List<JobScheduleHistory> getJobScheduleHistoryData() {


		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery("SELECT * FROM schedulejobhistory s order by s.jobexecutiontime desc", JobScheduleHistory.class);
		query.setFirstResult(0).setMaxResults(50);
		List lst = query.list();
		t.commit();
		session.close();
		return lst;
	
	}
	public Gaslevel getGasLevels(String facilityId) {


		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery("SELECT * FROM gaslevel where  facilityId =:facilityId", Gaslevel.class);
		query.setString("facilityId", facilityId);
		List lst = query.list();
		t.commit();
		session.close();
		if(lst != null && lst.size()>0)
		return (Gaslevel) lst.get(0);
		return null;
	
	}

	public Gaslevel saveGasLevels(Gaslevel gasLevel) {

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			Gaslevel dbGasLevel = (Gaslevel) session.get(Gaslevel.class, gasLevel.getFacilityId());

			if (dbGasLevel != null) {
				dbGasLevel.setGaslevels(gasLevel.getGaslevels());
				session.update(dbGasLevel);
			} else {
				session.save(gasLevel);
			}
			trx.commit();
			session.close();

		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred in saveGasLevels   method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return gasLevel;
		} finally {

		}
		return gasLevel;
	
	}

public static void main(String[] args) {
	
}

public String getLeakTankTestButtonStatus(Facilities facility) {

	if(facility == null)
		return GRAY_COLOR;// gray
	Session session = HibernateUtil.getSession();
	Transaction trx = session.beginTransaction();
	try {
		long millisec = System.currentTimeMillis();
		Query query = session.createNativeQuery("select T.facility__C,T.type__C,T.tank__C,T.testtype__c,T.RESULT__c,T.Date__c,T.ID,T.viewed,T.rn\r\n" + 
				"from (\r\n" + 
				"     select T.facility__C,T.name,T.tank__C,T.testtype__c,\r\n" + 
				"            T.type__C,T.RESULT__c,T.Date__c,T.ID,T.viewed,\r\n" + 
				"            row_number() over(partition by T.testtype__C order by T.Date__c desc) as rn\r\n" + 
				"     from leaktestresults__c as T\r\n" + 
				"     ) as T\r\n" + 
				"where T.rn <= 10 and facility__C = '"+facility.getFacilityId()+"'");

		List lst = new ArrayList();
		List<Object[]> rows = query.list();
		trx.commit();
		session.close();
		System.out.println("query execute in "+((System.currentTimeMillis()-millisec)/1000) +"  seconds. The size is "+rows.size());
		if(rows == null || rows.size() == 0)
			return GRAY_COLOR;// gray
		String result = checkLeakTankResult(rows);
		return result;
	} catch (

	Exception exception)

	{
		exception.printStackTrace();
		System.out.println("Exception occred in getTankalarmHistory method -- " + exception.getMessage());
		if (trx != null)
			trx.rollback();
		if (session != null)
			session.close();
		return RED_COLOR;// red
	}


	
}

public String getLeakTankTestCount(Facilities facility) {

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			long millisec = System.currentTimeMillis();
			Query query = session.createNativeQuery("select * from leaktestresults__c where facility__C = '"
					+ facility.getFacilityId() + "' and (viewed is null or viewed ='false')");

			List rows = query.list();

			trx.commit();
			session.close();
			if (rows == null)
				return "0";
			else
				return rows.size() + "";
		} catch (

		Exception exception)

		{
			exception.printStackTrace();
			System.out.println("Exception occred in getTankalarmHistory method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
		}
		return "0";

	}
public String getTankStatusCount(Facilities facility) {

	Session session = HibernateUtil.getSession();
	Transaction trx = session.beginTransaction();
	try {
		long millisec = System.currentTimeMillis();
		Query query = session.createNativeQuery("select * from tankstatusreport__c where facility__C = '"
				+ facility.getFacilityId() + "' and (viewed is null or viewed ='false')");

		List rows = query.list();

		trx.commit();
		session.close();
		if (rows == null)
			return "0";
		else
			return rows.size() + "";
	} catch (

	Exception exception)

	{
		exception.printStackTrace();
		System.out.println("Exception occred in getTankalarmHistory method -- " + exception.getMessage());
		if (trx != null)
			trx.rollback();
		if (session != null)
			session.close();
	}
	return "0";

}
public String getIncomeExpenseUpdates(Facilities facility) {

	Session session = HibernateUtil.getSession();
	Transaction trx = session.beginTransaction();
	try {
		long millisec = System.currentTimeMillis();
		Query query = session.createNativeQuery("SELECT Income_Expense_Updates__c FROM customerportal.account where id='"+ facility.getFacilityId() + "'");
		List rows = query.list();
		trx.commit();
		session.close();
		if (rows == null || rows.size() == 0)
			return "false";
		else
			return rows.get(0).toString().equalsIgnoreCase("false")?"true":"false";
	} catch (
	Exception exception)

	{
		exception.printStackTrace();
		System.out.println("Exception occred in getTankalarmHistory method -- " + exception.getMessage());
		if (trx != null)
			trx.rollback();
		if (session != null)
			session.close();
	}
	return "false";
}
public String getCsldCount(Facilities facility) {

	Session session = HibernateUtil.getSession();
	Transaction trx = session.beginTransaction();
	try {
		long millisec = System.currentTimeMillis();
		Query query = session.createNativeQuery("select * from csldtestresult__c where facility__C = '"
				+ facility.getFacilityId() + "' and (viewed is null or viewed ='false')");

		List rows = query.list();

		trx.commit();
		session.close();
		if (rows == null)
			return "0";
		else
			return rows.size() + "";
	} catch (

	Exception exception)

	{
		exception.printStackTrace();
		System.out.println("Exception occred in getTankalarmHistory method -- " + exception.getMessage());
		if (trx != null)
			trx.rollback();
		if (session != null)
			session.close();
	}
	return "0";

}

private String checkLeakTankResult(List<Object[]> rows) {
	String result =GREEN_COLOR;//green
	for (Object[] row : rows) {
			if(row[4] == null || !row[4].toString().equalsIgnoreCase("Pass")){
				result= RED_COLOR;// red
			return result;
			}		
	}
	return result;
	
}

public Map<String, HashMap<String, ArrayList<Tankstatusreport>>> getTankStatusTestDetails(String facilityId) {

	Session session = HibernateUtil.getSession();
	Transaction trx = session.beginTransaction();
	Map<String, HashMap<String, ArrayList<Tankstatusreport>>> resultMap = new HashMap<String,HashMap<String,ArrayList<Tankstatusreport>>>();
	HashMap<String,ArrayList<Tankstatusreport>> annualMap = new HashMap<String,ArrayList<Tankstatusreport>>();
	HashMap<String,ArrayList<Tankstatusreport>> grossMap = new HashMap<String,ArrayList<Tankstatusreport>>();
	HashMap<String,ArrayList<Tankstatusreport>> periodicMap = new HashMap<String,ArrayList<Tankstatusreport>>();
	
	try {
		long millisec = System.currentTimeMillis();
		Query query = session.createNativeQuery("select T.facility__C,T.tank__C,T.product__C,T.status__C,T.runDate__c,T.ID,T.viewed,T.rn\r\n" + 
				"from (\r\n" + 
				"     select T.facility__C,T.name,T.tank__C,T.product__C,T.status__C,T.runDate__c,T.ID,T.viewed,\r\n" + 
				"            row_number() over(partition by T.product__C order by T.runDate__c desc) as rn\r\n" + 
				"     from tankstatusreport__c as T where facility__C = '"+facilityId+"' \r\n" + 
				"     ) as T\r\n" + 
				"where T.rn <= 10 and facility__C = '"+facilityId+"'");

		
		List<Object[]> rows = query.list();
		trx.commit();
		session.close();
		System.out.println("query execute in "+((System.currentTimeMillis()-millisec)/1000) +"  seconds. The size is "+rows.size());
		for (Object[] row : rows) {
			ArrayList<Tankstatusreport> annualList = new ArrayList<Tankstatusreport>();
			ArrayList<Tankstatusreport> grossList = new ArrayList<Tankstatusreport>();
			ArrayList<Tankstatusreport> periodicList = new ArrayList<Tankstatusreport>();
			Tankstatusreport tankstatusreport = new Tankstatusreport();
			if (row[0] != null)
				tankstatusreport.setFacility__c(row[0].toString());
			if (row[1] != null )
				tankstatusreport.setTank__c(row[1].toString().toLowerCase().indexOf("tank")>=0?row[1].toString():"TANK"+(row[1].toString()));
			if (row[2] != null)
				tankstatusreport.setProduct__c(row[2].toString());
			if (row[3] != null && row[3].toString().equalsIgnoreCase("normal"))
				tankstatusreport.setResult__c("PASS");
			else
				tankstatusreport.setResult__c("FAIL");;
			if (row[4] != null)
				tankstatusreport.setDate__c(row[4].toString());;
			if (row[5] != null)
				tankstatusreport.setId(row[5].toString());
			if (row[6] != null)
				tankstatusreport.setViewed(row[6].toString());
			if(tankstatusreport.getProduct__c() != null && tankstatusreport.getProduct__c().equalsIgnoreCase("UNLEADED")){
				if(annualMap.get(tankstatusreport.getTank__c())!=null){
					annualMap.get(tankstatusreport.getTank__c()).add(tankstatusreport);
				}else{
					annualList.add(tankstatusreport);
					annualMap.put(tankstatusreport.getTank__c(),annualList);
				}
			}
			else if(tankstatusreport.getProduct__c() != null && tankstatusreport.getProduct__c().equalsIgnoreCase("PREMIUM"))
				{

				if(grossMap.get(tankstatusreport.getTank__c())!=null){
					grossMap.get(tankstatusreport.getTank__c()).add(tankstatusreport);
				}else{
					grossList.add(tankstatusreport);
					grossMap.put(tankstatusreport.getTank__c(),grossList);
				}
			
				}
			else if(tankstatusreport.getProduct__c() != null && tankstatusreport.getProduct__c().equalsIgnoreCase("DIESEL"))
			{

				if(periodicMap.get(tankstatusreport.getTank__c())!=null){
					periodicMap.get(tankstatusreport.getTank__c()).add(tankstatusreport);
				}else{
					periodicList.add(tankstatusreport);
					periodicMap.put(tankstatusreport.getTank__c(),periodicList);
				}
			
				}
		}
		
		resultMap.put("UNLEADED", annualMap);
		resultMap.put("PREMIUM", grossMap);
		resultMap.put("DIESEL", periodicMap);
		return resultMap;
	} catch (

	Exception exception)

	{
		exception.printStackTrace();
		System.out.println("Exception occred in getTankalarmHistory method -- " + exception.getMessage());
		if (trx != null)
			trx.rollback();
		if (session != null)
			session.close();
		return resultMap;
	}
}
public Map<String, HashMap<String, ArrayList<Csldtestresult>>> getCSLDTestDetails(String facilityId) {

	Session session = HibernateUtil.getSession();
	Transaction trx = session.beginTransaction();
	Map<String, HashMap<String, ArrayList<Csldtestresult>>> resultMap = new HashMap<String,HashMap<String,ArrayList<Csldtestresult>>>();
	HashMap<String,ArrayList<Csldtestresult>> annualMap = new HashMap<String,ArrayList<Csldtestresult>>();
	HashMap<String,ArrayList<Csldtestresult>> grossMap = new HashMap<String,ArrayList<Csldtestresult>>();
	HashMap<String,ArrayList<Csldtestresult>> periodicMap = new HashMap<String,ArrayList<Csldtestresult>>();
	
	try {
		long millisec = System.currentTimeMillis();
		Query query = session.createNativeQuery("select T.facility__C,T.tank__C,T.RESULT__c,T.RunDate__c,T.TankType__c,T.ID,T.viewed,T.rn\r\n" + 
				"from (\r\n" + 
				"     select T.facility__C,T.name,T.tank__C,\r\n" + 
				"            T.RESULT__c,T.RunDate__c,T.TankType__c,T.ID,T.viewed,\r\n" + 
				"            row_number() over(order by T.RunDate__c desc) as rn\r\n" + 
				"     from csldtestresult__c as T  where facility__C = '"+facilityId+"' \r\n" + 
				"     ) as T\r\n" + 
				"where T.rn <= 10 and facility__C = '"+facilityId+"'");

		
		List<Object[]> rows = query.list();
		trx.commit();
		session.close();
		System.out.println("query execute in "+((System.currentTimeMillis()-millisec)/1000) +"  seconds. The size is "+rows.size());
		for (Object[] row : rows) {
			ArrayList<Csldtestresult> annualList = new ArrayList<Csldtestresult>();
			ArrayList<Csldtestresult> grossList = new ArrayList<Csldtestresult>();
			ArrayList<Csldtestresult> periodicList = new ArrayList<Csldtestresult>();
			Csldtestresult csldtestresult = new Csldtestresult();
			if (row[0] != null)
				csldtestresult.setFacility__c(row[0].toString());
			if (row[1] != null )
				csldtestresult.setTank__c(row[1].toString().toLowerCase().indexOf("tank")>=0?row[1].toString():"TANK"+(row[1].toString()));
			if (row[2] != null)
				csldtestresult.setResult__c(row[2].toString());
			if (row[3] != null )
				csldtestresult.setDate__c(row[3].toString());
			if (row[4] != null)
				csldtestresult.setTankType__c(row[4].toString());;
				
			if (row[5] != null)
				csldtestresult.setId(row[5].toString());
			if (row[6] != null)
				csldtestresult.setViewed(row[6].toString());
			
			if(csldtestresult.getTankType__c() != null && csldtestresult.getTankType__c().equalsIgnoreCase("UNLEADED")){
				if(annualMap.get(csldtestresult.getTank__c())!=null){
					annualMap.get(csldtestresult.getTank__c()).add(csldtestresult);
				}else{
					annualList.add(csldtestresult);
					annualMap.put(csldtestresult.getTank__c(),annualList);
				}
			}
			else if(csldtestresult.getTankType__c() != null && csldtestresult.getTankType__c().equalsIgnoreCase("PREMIUM"))
				{

				if(grossMap.get(csldtestresult.getTank__c())!=null){
					grossMap.get(csldtestresult.getTank__c()).add(csldtestresult);
				}else{
					grossList.add(csldtestresult);
					grossMap.put(csldtestresult.getTank__c(),grossList);
				}
			
				}
			else if(csldtestresult.getTankType__c() != null && csldtestresult.getTankType__c().equalsIgnoreCase("DIESEL"))
			{

				if(periodicMap.get(csldtestresult.getTank__c())!=null){
					periodicMap.get(csldtestresult.getTank__c()).add(csldtestresult);
				}else{
					periodicList.add(csldtestresult);
					periodicMap.put(csldtestresult.getTank__c(),periodicList);
				}
			
				}
		}
		
		resultMap.put("UNLEADED", annualMap);
		resultMap.put("PREMIUM", grossMap);
		resultMap.put("DIESEL", periodicMap);
		return resultMap;
	} catch (

	Exception exception)

	{
		exception.printStackTrace();
		System.out.println("Exception occred in getTankalarmHistory method -- " + exception.getMessage());
		if (trx != null)
			trx.rollback();
		if (session != null)
			session.close();
		return resultMap;
	}
}


public Map<String, HashMap<String, ArrayList<Leaktestresults>>> getLeakTankTestDetails(String facilityId) {

	Session session = HibernateUtil.getSession();
	Transaction trx = session.beginTransaction();
	Map<String, HashMap<String, ArrayList<Leaktestresults>>> resultMap = new HashMap<String,HashMap<String,ArrayList<Leaktestresults>>>();
	HashMap<String,ArrayList<Leaktestresults>> annualMap = new HashMap<String,ArrayList<Leaktestresults>>();
	HashMap<String,ArrayList<Leaktestresults>> grossMap = new HashMap<String,ArrayList<Leaktestresults>>();
	HashMap<String,ArrayList<Leaktestresults>> periodicMap = new HashMap<String,ArrayList<Leaktestresults>>();
	
	try {
		long millisec = System.currentTimeMillis();
		Query query = session.createNativeQuery("select T.facility__C,T.type__C,T.tank__C,T.testtype__c,T.RESULT__c,T.Date__c,T.ID,T.viewed,T.rn\r\n" + 
				"from (\r\n" + 
				"     select T.facility__C,T.name,T.tank__C,T.testtype__c,\r\n" + 
				"            T.type__C,T.RESULT__c,T.Date__c,T.ID,T.viewed,\r\n" + 
				"            row_number() over(partition by T.testtype__C order by T.Date__c desc) as rn\r\n" + 
				"     from leaktestresults__c as T where T.facility__C = '"+facilityId+"' \r\n" + 
				"     ) as T\r\n" + 
				"where T.rn <= 10 and  T.facility__C = '"+facilityId+"'");

		
		List<Object[]> rows = query.list();
		trx.commit();
		session.close();
		System.out.println("query execute in "+((System.currentTimeMillis()-millisec)/1000) +"  seconds. The size is "+rows.size());
		for (Object[] row : rows) {
			ArrayList<Leaktestresults> annualList = new ArrayList<Leaktestresults>();
			ArrayList<Leaktestresults> grossList = new ArrayList<Leaktestresults>();
			ArrayList<Leaktestresults> periodicList = new ArrayList<Leaktestresults>();
			Leaktestresults leaktestresults = new Leaktestresults();
			if (row[0] != null)
				leaktestresults.setFacility__c(row[0].toString());
			if (row[1] != null)
				leaktestresults.setType__c(row[1].toString());
			if (row[2] != null)
				leaktestresults.setTank__c(row[2].toString());
			if (row[3] != null)
				leaktestresults.setTesttype__c(row[3].toString());;
			if (row[4] != null)
				leaktestresults.setResult__c(row[4].toString());
				else
					leaktestresults.setResult__c("FAIL");;
			if (row[5] != null)
				leaktestresults.setDate__c(row[5].toString());
			if (row[6] != null)
				leaktestresults.setId(row[6].toString());
			if (row[7] != null)
				leaktestresults.setViewed(row[7].toString());
			if(leaktestresults.getTesttype__c() != null && leaktestresults.getTesttype__c().equalsIgnoreCase("ANNUAL")){
				if(annualMap.get(leaktestresults.getTank__c())!=null){
					annualMap.get(leaktestresults.getTank__c()).add(leaktestresults);
				}else{
					annualList.add(leaktestresults);
					annualMap.put(leaktestresults.getTank__c(),annualList);
				}
			}
			else if(leaktestresults.getTesttype__c() != null && leaktestresults.getTesttype__c().equalsIgnoreCase("GROSS"))
				{

				if(grossMap.get(leaktestresults.getTank__c())!=null){
					grossMap.get(leaktestresults.getTank__c()).add(leaktestresults);
				}else{
					grossList.add(leaktestresults);
					grossMap.put(leaktestresults.getTank__c(),grossList);
				}
			
				}
			else if(leaktestresults.getTesttype__c() != null && leaktestresults.getTesttype__c().equalsIgnoreCase("PERIODIC"))
			{

				if(periodicMap.get(leaktestresults.getTank__c())!=null){
					periodicMap.get(leaktestresults.getTank__c()).add(leaktestresults);
				}else{
					periodicList.add(leaktestresults);
					periodicMap.put(leaktestresults.getTank__c(),periodicList);
				}
			
				}
		}
		
		resultMap.put("ANNUAL", annualMap);
		resultMap.put("GROSS", grossMap);
		resultMap.put("PERIODIC", periodicMap);
		return resultMap;
	} catch (

	Exception exception)

	{
		exception.printStackTrace();
		System.out.println("Exception occred in getTankalarmHistory method -- " + exception.getMessage());
		if (trx != null)
			trx.rollback();
		if (session != null)
			session.close();
		return resultMap;
	}


	
}



public String getTankStatusButtonStatus(Facilities facility) {


	if(facility == null)
		return GRAY_COLOR;// gray
	Session session = HibernateUtil.getSession();
	Transaction trx = session.beginTransaction();
	try {
		long millisec = System.currentTimeMillis();
		Query query = session.createNativeQuery("select T.facility__C,T.tank__C,T.product__C,T.status__C,T.runDate__c,T.ID,T.viewed,T.rn\r\n" + 
				"from (\r\n" + 
				"     select T.facility__C,T.name,T.tank__C,T.product__C,T.status__C,T.runDate__c,T.ID,T.viewed,\r\n" + 
				"            row_number() over(partition by T.product__C order by T.runDate__c desc) as rn\r\n" + 
				"     from tankstatusreport__c as T\r\n" + 
				"     ) as T\r\n" + 
				"where T.rn <= 10 and facility__C = '"+facility.getFacilityId()+"'");

		List lst = new ArrayList();
		List<Object[]> rows = query.list();
		trx.commit();
		session.close();
		System.out.println("query execute in "+((System.currentTimeMillis()-millisec)/1000) +" seconds. The size is "+rows.size());
		if(rows == null || rows.size() == 0)
			return GRAY_COLOR;// gray
		String result = checkTankStatusResult(rows);
		return result;
	} catch (

	Exception exception)

	{
		exception.printStackTrace();
		System.out.println("Exception occred in getTankalarmHistory method -- " + exception.getMessage());
		if (trx != null)
			trx.rollback();
		if (session != null)
			session.close();
		return RED_COLOR;// red
	}


	

}
private String checkTankStatusResult(List<Object[]> rows) {
	String result =GREEN_COLOR;//green
	for (Object[] row : rows) {
			if(!row[3].toString().equalsIgnoreCase("normal")){
				result= RED_COLOR;// red
			return result;
			}
	}
	return result;
	
}

public String getCsldButtonStatus(Facilities facility) {


	if(facility == null)
		return GRAY_COLOR;// gray
	Session session = HibernateUtil.getSession();
	Transaction trx = session.beginTransaction();
	try {
		long millisec = System.currentTimeMillis();
		Query query = session.createNativeQuery("select T.facility__C,T.tank__C,T.RESULT__c,T.RunDate__c,T.ID,T.viewed,T.rn\r\n" + 
				"from (\r\n" + 
				"     select T.facility__C,T.name,T.tank__C,\r\n" + 
				"            T.RESULT__c,T.RunDate__c,T.ID,T.viewed,\r\n" + 
				"            row_number() over(order by T.RunDate__c desc) as rn\r\n" + 
				"     from csldtestresult__c as T\r\n" + 
				"     ) as T\r\n" + 
				"where T.rn <= 10 and facility__C = '"+facility.getFacilityId()+"'");

		List lst = new ArrayList();
		List<Object[]> rows = query.list();
		trx.commit();
		session.close();
		System.out.println("query execute in "+((System.currentTimeMillis()-millisec)/1000) +"  seconds. The size is "+rows.size());
		if(rows == null || rows.size() == 0)
			return GRAY_COLOR;// gray
		String result = checkCSLDStatusResult(rows);
		return result;
	} catch (

	Exception exception)

	{
		exception.printStackTrace();
		System.out.println("Exception occred in getTankalarmHistory method -- " + exception.getMessage());
		if (trx != null)
			trx.rollback();
		if (session != null)
			session.close();
		return RED_COLOR;// red
	}


	

}
private String checkCSLDStatusResult(List<Object[]> rows) {
	String result =GREEN_COLOR;//green
	for (Object[] row : rows) {
			if(row[2]!=null && !row[2].toString().equalsIgnoreCase("pass")){
				result= RED_COLOR;// red
			return result;
			}
	}
	return result;
}

	public Account fetchUSTComplianceDataData(String facilitiesId, Account account) {

		String releaseDetectionReport = "GT - Release Detection Report";
		String repairDocuments = "GT - Repair Documents (Optional)";
		String lineAndLeakDetector = "GT - Line and Leak Detector Test";
		String tankTestingReport = "GT - Tank Tightness Report";
		String cathodicProtectionAnode = "GT - Cathodic Protection (Anode)";
		String cathodicProtectionElectric = "GT - Cathodic Protection (Electric))";
		
		String cathodicProtectionCheck = "Cathodic Protection ";
		String internalLiningInspection = "GT - Internal Lining Inspection";
		String pipingCathodicProtection = "GT - Piping Cathodic Protection";
		String dropTubeRepairDocument = "GT - Drop Tube Repair Document";
		String tankInterstitialMonitoring = "GT - Tank Interstitial Monitoring";
		String pipinginterstitialMonitoring = "GT - Piping Interstitial Monitoring";
		String atgTestReport = "GT - ATG Test Report";
		String atgRepairReport = "GT - ATG Repair Report";
		String spillBucketTestingDocument = "GT - Spill Bucket Testing Document";
		String spillBucketRepairDocument = "GT - Spill Bucket Repair Document";
		String sumpMaintenanceDocument = "GT - Sump Maintenance Document";
		String udcMaintenanceDocument = "GT - UDC Maintenance Document";
		String sirReport = "GT - SIR Report";
		String monthlyWalkThroughReport = "GT - Monthly Walk Through Report";
		String tankMonitorStaticIP = "GT - Release Detection Report";

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			Query query = session.createNativeQuery(
					"SELECT * FROM account where MGT_Paid_Service__c = 'true' AND id =:facilitiesId",
					Account.class);

			query.setString("facilitiesId", facilitiesId);
			List<Account> lst = query.list();
			trx.commit();
			session.close();
			if (lst.size() > 0) {
				Account localAccount = lst.get(0);

				if (localAccount.getIsReleaseDetectionReportRequired()!=null && localAccount.getIsReleaseDetectionReportRequired().equalsIgnoreCase("true")
						&& localAccount.getReleaseDetectionReport() == null)
					account.setReleaseDetectionReportEnable(true);
				if (localAccount.getIsRepairDocumentRequired()!=null && localAccount.getIsRepairDocumentRequired().equalsIgnoreCase("true")
						&& localAccount.getRepairDocuments() == null)
					account.setRepairDocumentsEnable(true);
				if (localAccount.getIsLnlDetrTstRequrd()!=null && localAccount.getIsLnlDetrTstRequrd().equalsIgnoreCase("true")
						&& localAccount.getLineAndLeakDetector() == null)
					account.setLineAndLeakDetectorEnable(true);
				if (localAccount.getIsTankTestingReportRequired()!=null && localAccount.getIsTankTestingReportRequired().equalsIgnoreCase("true")
						&& localAccount.getTankTestingReport() == null)
					account.setTankTestingReportEnable(true);
				if (localAccount.getIsCprequired()!=null && localAccount.getIsCprequired().equalsIgnoreCase("true") && localAccount.getCathodicProtection() == null)
					account.setCathodicProtectionEnable(true);
				if (localAccount.getIsInternalLiningInspectionRequired()!=null && localAccount.getIsInternalLiningInspectionRequired().equalsIgnoreCase("true")
						&& localAccount.getInternalLiningInspection() == null)
					account.setInternalLiningInspectionEnable(true);
				if (localAccount.getIsPipingCPRequired()!=null && localAccount.getIsPipingCPRequired().equalsIgnoreCase("true")
						&& localAccount.getPipingCathodicProtection() == null)
					account.setPipingCathodicProtectionEnable(true);
				if (localAccount.getIsDropTubeRepairRequired()!=null && localAccount.getIsDropTubeRepairRequired().equalsIgnoreCase("true")
						&& localAccount.getDropTubeRepairDocument() == null)
					account.setDropTubeRepairDocumentEnable(true);
				if (localAccount.getIsTankInterstitialMonitoringRequired()!=null && localAccount.getIsTankInterstitialMonitoringRequired().equalsIgnoreCase("true")
						&& localAccount.getTankInterstitialMonitoring() == null)
					account.setTankInterstitialMonitoringEnable(true);
				if (localAccount.getIsPipeInterstitialMontoringRequired()!=null && localAccount.getIsPipeInterstitialMontoringRequired().equalsIgnoreCase("true")
						&& localAccount.getPipinginterstitialMonitoring() == null)
					account.setPipinginterstitialMonitoringEnable(true);
				if (localAccount.getIsATGTestRequired()!=null && localAccount.getIsATGTestRequired().equalsIgnoreCase("true") && localAccount.getAtgTestReport() == null)
					account.setAtgTestReportEnable(true);
				if (localAccount.getIsATGRepairRequired()!=null && localAccount.getIsATGRepairRequired().equalsIgnoreCase("true") && localAccount.getAtgRepairReport() == null)
					account.setAtgRepairReportEnable(true);
				if (localAccount.getIsSpillBucketTestingDocument()!=null && localAccount.getIsSpillBucketTestingDocument().equalsIgnoreCase("true")
						&& localAccount.getSpillBucketTestingDocument() == null)
					account.setSpillBucketTestingDocumentEnable(true);
				if (localAccount.getIsSpillBucketRepairRequired()!=null && localAccount.getIsSpillBucketRepairRequired().equalsIgnoreCase("true")
						&& localAccount.getSpillBucketRepairDocument() == null)
					account.setSpillBucketRepairDocumentEnable(true);
				if (localAccount.getIsSumpMaintenanceRequired()!=null && localAccount.getIsSumpMaintenanceRequired().equalsIgnoreCase("true")
						&& localAccount.getSumpMaintenanceDocument() == null)
					account.setSumpMaintenanceDocumentEnable(true);
				if (localAccount.getIsUDCMaintenanceRequired()!=null && localAccount.getIsUDCMaintenanceRequired().equalsIgnoreCase("true")
						&& localAccount.getUdcMaintenanceDocument() == null)
					account.setUdcMaintenanceDocumentEnable(true);
				if (localAccount.getIsSirRequired()!=null && localAccount.getIsSirRequired().equalsIgnoreCase("true") && localAccount.getSirReport() == null)
					account.setSirReportEnable(true);
				if (localAccount.getIsMonthlyWalkThroughInspection()!=null && localAccount.getIsMonthlyWalkThroughInspection().equalsIgnoreCase("true")
						&& localAccount.getMonthlyWalkThroughReport() == null)
					account.setMonthlyWalkThroughReportEnable(true);
				if (localAccount.getIsTankMonitorStaticIP()!=null && localAccount.getIsTankMonitorStaticIP().equalsIgnoreCase("true")
						&& localAccount.getTankMonitorStaticIP() == null)
					account.setTankMonitorStaticIPEnable(true);

				String custom_portal_whereclause = "";

				if (localAccount.getIsReleaseDetectionReportRequired().equalsIgnoreCase("true")
						&& localAccount.getReleaseDetectionReport() == null)
					custom_portal_whereclause += "'" + releaseDetectionReport + "'" + ",";
				if (localAccount.getIsRepairDocumentRequired().equalsIgnoreCase("true")
						&& localAccount.getRepairDocuments() == null)
					custom_portal_whereclause += "'" + repairDocuments + "'" + ",";
				if (localAccount.getIsLnlDetrTstRequrd().equalsIgnoreCase("true")
						&& localAccount.getLineAndLeakDetector() == null)
					custom_portal_whereclause += "'" + lineAndLeakDetector + "'" + ",";
				if (localAccount.getIsTankTestingReportRequired().equalsIgnoreCase("true")
						&& localAccount.getTankTestingReport() == null)
					custom_portal_whereclause += "'" + tankTestingReport + "'" + ",";
				if (localAccount.getIsCprequired().equalsIgnoreCase("true") && localAccount.getCathodicProtection() == null)
					custom_portal_whereclause += "'" + cathodicProtectionAnode + "'" + ","+"'" + cathodicProtectionElectric + "'" + ",";
				if (localAccount.getIsInternalLiningInspectionRequired().equalsIgnoreCase("true")
						&& localAccount.getInternalLiningInspection() == null)
					custom_portal_whereclause += "'" + internalLiningInspection + "'" + ",";
				if (localAccount.getIsPipingCPRequired().equalsIgnoreCase("true")
						&& localAccount.getPipingCathodicProtection() == null)
					custom_portal_whereclause += "'" + pipingCathodicProtection + "'" + ",";
				if (localAccount.getIsDropTubeRepairRequired().equalsIgnoreCase("true")
						&& localAccount.getDropTubeRepairDocument() == null)
					custom_portal_whereclause += "'" + dropTubeRepairDocument + "'" + ",";

				if (localAccount.getIsTankInterstitialMonitoringRequired().equalsIgnoreCase("true")
						&& localAccount.getTankInterstitialMonitoring() == null)
					custom_portal_whereclause += "'" + tankInterstitialMonitoring + "'" + ",";
				if (localAccount.getIsPipeInterstitialMontoringRequired().equalsIgnoreCase("true")
						&& localAccount.getPipinginterstitialMonitoring() == null)
					custom_portal_whereclause += "'" + pipinginterstitialMonitoring + "'" + ",";
				if (localAccount.getIsATGTestRequired().equalsIgnoreCase("true") && localAccount.getAtgTestReport() == null)
					custom_portal_whereclause += "'" + atgTestReport + "'" + ",";
				if (localAccount.getIsATGRepairRequired().equalsIgnoreCase("true") && localAccount.getAtgRepairReport() == null)
					custom_portal_whereclause += "'" + atgRepairReport + "'" + ",";
				if (localAccount.getIsSpillBucketTestingDocument().equalsIgnoreCase("true")
						&& localAccount.getSpillBucketTestingDocument() == null)
					custom_portal_whereclause += "'" + spillBucketTestingDocument + "'" + ",";
				if (localAccount.getIsSpillBucketRepairRequired().equalsIgnoreCase("true")
						&& localAccount.getSpillBucketRepairDocument() == null)
					custom_portal_whereclause += "'" + spillBucketRepairDocument + "'" + ",";
				if (localAccount.getIsSumpMaintenanceRequired().equalsIgnoreCase("true")
						&& localAccount.getSumpMaintenanceDocument() == null)
					custom_portal_whereclause += "'" + sumpMaintenanceDocument + "'" + ",";
				if (localAccount.getIsUDCMaintenanceRequired().equalsIgnoreCase("true")
						&& localAccount.getUdcMaintenanceDocument() == null)
					custom_portal_whereclause += "'" + udcMaintenanceDocument + "'" + ",";
				if (localAccount.getIsSirRequired().equalsIgnoreCase("true") && localAccount.getSirReport() == null)
					custom_portal_whereclause += "'" + sirReport + "'" + ",";
				if (localAccount.getIsMonthlyWalkThroughInspection().equalsIgnoreCase("true")
						&& localAccount.getMonthlyWalkThroughReport() == null)
					custom_portal_whereclause += "'" + monthlyWalkThroughReport + "'" + ",";
				if (localAccount.getIsTankMonitorStaticIP().equalsIgnoreCase("true")
						&& localAccount.getTankMonitorStaticIP() == null)
					custom_portal_whereclause += "'" + tankMonitorStaticIP + "'" + ",";

				if (custom_portal_whereclause.endsWith(","))
					custom_portal_whereclause = custom_portal_whereclause.substring(0,
							custom_portal_whereclause.lastIndexOf(","));
				if (custom_portal_whereclause.trim().length() > 0) {
					session = HibernateUtil.getSession();
					trx = session.beginTransaction();
					try {
						// Transaction t = session.beginTransaction();
						query = session.createNativeQuery(
								"SELECT * FROM customer_portal_attachments__c  where facility__c =:facilitiesId and type__c in ("
										+ custom_portal_whereclause + ")",
								CustomerPortalAttachments.class);
						query.setString("facilitiesId", facilitiesId);
						List<CustomerPortalAttachments> customPortalList = query.list();
						trx.commit();
						session.close();
						if (customPortalList.size() > 0) {
							for (CustomerPortalAttachments attachments : customPortalList) {

								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(releaseDetectionReport)
										&& attachments.getApprovalStatus() != null)
									account.setReleaseDetectionReportSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(repairDocuments)
										&& attachments.getApprovalStatus() != null)
									account.setRepairDocumentsSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(lineAndLeakDetector)
										&& attachments.getApprovalStatus() != null)
									account.setLineAndLeakDetectorSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(tankTestingReport)
										&& attachments.getApprovalStatus() != null)
									account.setTankTestingReportSubmitted(true);
								if (attachments.getType()!=null && (attachments.getType().equalsIgnoreCase(cathodicProtectionAnode) || attachments.getType().equalsIgnoreCase(cathodicProtectionElectric))
										&& attachments.getApprovalStatus() != null)
									account.setCathodicProtectionSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(internalLiningInspection)
										&& attachments.getApprovalStatus() != null)
									account.setInternalLiningInspectionSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(pipingCathodicProtection)
										&& attachments.getApprovalStatus() != null)
									account.setPipingCathodicProtectionSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(dropTubeRepairDocument)
										&& attachments.getApprovalStatus() != null)
									account.setDropTubeRepairDocumentSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(tankInterstitialMonitoring)
										&& attachments.getApprovalStatus() != null)
									account.setTankInterstitialMonitoringSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(pipinginterstitialMonitoring)
										&& attachments.getApprovalStatus() != null)
									account.setPipinginterstitialMonitoringSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(atgTestReport)
										&& attachments.getApprovalStatus() != null)
									account.setAtgTestReportSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(repairDocuments)
										&& attachments.getApprovalStatus() != null)
									account.setAtgRepairReportSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(lineAndLeakDetector)
										&& attachments.getApprovalStatus() != null)
									account.setSpillBucketTestingDocumentSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(tankTestingReport)
										&& attachments.getApprovalStatus() != null)
									account.setSpillBucketRepairDocumentSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(cathodicProtectionAnode) || attachments.getType().equalsIgnoreCase(cathodicProtectionElectric)
										&& attachments.getApprovalStatus() != null)
									account.setSumpMaintenanceDocumentSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(internalLiningInspection)
										&& attachments.getApprovalStatus() != null)
									account.setUdcMaintenanceDocumentSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(pipingCathodicProtection)
										&& attachments.getApprovalStatus() != null)
									account.setSirReportSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(dropTubeRepairDocument)
										&& attachments.getApprovalStatus() != null)
									account.setMonthlyWalkThroughReportSubmitted(true);
								if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(tankInterstitialMonitoring)
										&& attachments.getApprovalStatus() != null)
									account.setTankMonitorStaticIPSubmitted(true);
							}
						}

					} catch (Exception exception) {
						exception.printStackTrace();
						System.out.println("Exception occred in fetchFacilitiesNotificationData method -- "
								+ exception.getMessage());
						if (trx != null)
							trx.rollback();
						if (session != null)
							session.close();
					} finally {
					}
				}

				// custom attachments
				String custom_attachments_whereclause = "";

				if (localAccount.getReleaseDetectionReport() != null)
					custom_attachments_whereclause += "'" + releaseDetectionReport + "'" + ",";
				if (localAccount.getRepairDocuments() != null)
					custom_attachments_whereclause += "'" + repairDocuments + "'" + ",";
				if (localAccount.getLineAndLeakDetector() != null)
					custom_attachments_whereclause += "'" + lineAndLeakDetector + "'" + ",";
				if (localAccount.getTankTestingReport() != null)
					custom_attachments_whereclause += "'" + tankTestingReport + "'" + ",";
				if (localAccount.getCathodicProtection() != null)
					custom_attachments_whereclause += "'" + cathodicProtectionAnode + "'" + ","+"'" + cathodicProtectionElectric + "'" + ",";
				if (localAccount.getInternalLiningInspection() != null)
					custom_attachments_whereclause += "'" + internalLiningInspection + "'" + ",";
				if (localAccount.getPipingCathodicProtection() != null)
					custom_attachments_whereclause += "'" + pipingCathodicProtection + "'" + ",";
				if (localAccount.getDropTubeRepairDocument() != null)
					custom_attachments_whereclause += "'" + dropTubeRepairDocument + "'" + ",";

				if (localAccount.getTankInterstitialMonitoring() != null)
					custom_attachments_whereclause += "'" + tankInterstitialMonitoring + "'" + ",";
				if (localAccount.getPipinginterstitialMonitoring() != null)
					custom_attachments_whereclause += "'" + pipinginterstitialMonitoring + "'" + ",";
				if (localAccount.getAtgTestReport() != null)
					custom_attachments_whereclause += "'" + atgTestReport + "'" + ",";
				if (localAccount.getAtgRepairReport() != null)
					custom_attachments_whereclause += "'" + atgRepairReport + "'" + ",";
				if (localAccount.getSpillBucketTestingDocument() != null)
					custom_attachments_whereclause += "'" + spillBucketTestingDocument + "'" + ",";
				if (localAccount.getSpillBucketRepairDocument() != null)
					custom_attachments_whereclause += "'" + spillBucketRepairDocument + "'" + ",";

				if (localAccount.getSumpMaintenanceDocument() != null)
					custom_attachments_whereclause += "'" + sumpMaintenanceDocument + "'" + ",";
				if (localAccount.getUdcMaintenanceDocument() != null)
					custom_attachments_whereclause += "'" + udcMaintenanceDocument + "'" + ",";
				if (localAccount.getSirReport() != null)
					custom_attachments_whereclause += "'" + sirReport + "'" + ",";
				if (localAccount.getMonthlyWalkThroughReport() != null)
					custom_attachments_whereclause += "'" + monthlyWalkThroughReport + "'" + ",";
				if (localAccount.getTankMonitorStaticIP() != null)
					custom_attachments_whereclause += "'" + tankMonitorStaticIP + "'" + ",";

				if (custom_attachments_whereclause.endsWith(","))
					custom_attachments_whereclause = custom_attachments_whereclause.substring(0,
							custom_attachments_whereclause.lastIndexOf(","));
				if (custom_attachments_whereclause.trim().length() > 0) {
				session = HibernateUtil.getSession();
				trx = session.beginTransaction();
				try {
					// Transaction t = session.beginTransaction();
					query = session.createNativeQuery(
							"SELECT * FROM custom_attachments__c  where facility__c =:facilitiesId and active__c='true' and type__c in ("
									+ custom_attachments_whereclause + ")",
							CustomAttachments.class);
					query.setString("facilitiesId", facilitiesId);
					List<CustomAttachments> customPortalList = query.list();
					trx.commit();
					session.close();
					if (customPortalList.size() > 0) {
						for (CustomAttachments attachments : customPortalList) {
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(releaseDetectionReport))
							account.setReleaseDetectionReportURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(repairDocuments))
							account.setRepairDocumentsURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(lineAndLeakDetector))
							account.setLineAndLeakDetectorURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(tankTestingReport))
							account.setTankTestingReportURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().contains(cathodicProtectionCheck))
							account.setCathodicProtectionURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(internalLiningInspection))
							account.setInternalLiningInspectionURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(pipingCathodicProtection))
							account.setPipingCathodicProtectionURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(dropTubeRepairDocument))
							account.setDropTubeRepairDocumentURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(tankInterstitialMonitoring))
							account.setTankInterstitialMonitoringURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(pipinginterstitialMonitoring))
							account.setPipinginterstitialMonitoringURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(atgTestReport))
							account.setAtgTestReportURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(atgRepairReport))
							account.setAtgRepairReportURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(spillBucketTestingDocument))
							account.setSpillBucketTestingDocumentURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(spillBucketRepairDocument))
							account.setSpillBucketRepairDocumentURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(sumpMaintenanceDocument))
							account.setSumpMaintenanceDocumentURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(udcMaintenanceDocument))
							account.setUdcMaintenanceDocumentURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(sirReport))
							account.setSirReportURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(monthlyWalkThroughReport))
							account.setMonthlyWalkThroughReportURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
						if (attachments.getType()!=null && attachments.getType().equalsIgnoreCase(tankMonitorStaticIP))
							account.setTankMonitorStaticIPURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
					}
					}

				} catch (Exception exception) {
					exception.printStackTrace();
					System.out.println(
							"Exception occred in fetchFacilitiesNotificationData method -- " + exception.getMessage());
					if (trx != null)
						trx.rollback();
					if (session != null)
						session.close();
				} finally {
				}
				}
				return account;
			}
			return account;
		} catch (Exception exception){

			exception.printStackTrace();
			System.out
					.println("Exception occred in fetchFacilitiesNotificationData method -- " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally{}

	}

public Account fetchOperatorCertificatesData(String facilitiesId,Account account) {
	String  operatorAcertificate="GT - Operator A certificate";
	String  operatorBcertificate="GT - Operator B certificate";
	String  operatorCcertificate="GT - Operator C certificate";
	Session session = HibernateUtil.getSession();
	Transaction trx = session.beginTransaction();
	try {
		// Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery(
				"SELECT * FROM account where MGT_Paid_Service__c = 'true' AND id =:facilitiesId",
				Account.class);

		query.setString("facilitiesId", facilitiesId);
		List<Account> lst = query.list();
		trx.commit();
		session.close();
		if (lst.size() > 0) {
			Account localAccount = lst.get(0);
			account.setOperatorAcertificateEnable(true);
			account.setOperatorBcertificateEnable(true);
			account.setOperatorCcertificateEnable(true);
			
			String custom_portal_whereclause = "";
			if(localAccount.getOperatorAcertificate() == null)
				custom_portal_whereclause+= "'"+operatorAcertificate+"'"+",";
			if(localAccount.getOperatorBcertificate() == null)
				custom_portal_whereclause+= "'"+operatorBcertificate+"'"+",";
			if(localAccount.getOperatorCcertificate() == null)
				custom_portal_whereclause+= "'"+operatorCcertificate+"'"+",";
						if(custom_portal_whereclause.endsWith(","))
				custom_portal_whereclause = custom_portal_whereclause.substring(0, custom_portal_whereclause.lastIndexOf(","));
						System.out.println("custom_portal_whereclause----"+custom_portal_whereclause);
			if(custom_portal_whereclause.trim().length()>0){
			session = HibernateUtil.getSession();
			trx = session.beginTransaction();
			try {
				// Transaction t = session.beginTransaction();
				query = session.createNativeQuery(
						"SELECT * FROM customer_portal_attachments__c  where facility__c =:facilitiesId and type__c in ("+custom_portal_whereclause+")",CustomerPortalAttachments.class);
				query.setString("facilitiesId", facilitiesId);
				List<CustomerPortalAttachments> customPortalList = query.list();
				trx.commit();
				session.close();
				if(customPortalList.size()>0){
					for (CustomerPortalAttachments attachments  : customPortalList) {
						
					
					if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(operatorAcertificate) && attachments.getApprovalStatus() != null)
						account.setOperatorAcertificateSubmitted(true);
					if(attachments.getType().equalsIgnoreCase(operatorBcertificate) && attachments.getApprovalStatus() != null)
						account.setOperatorBcertificateSubmitted(true);
					if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(operatorCcertificate) && attachments.getApprovalStatus() != null)
						account.setOperatorCcertificateSubmitted(true);
					}
				}
				
			} catch (Exception exception) {
				exception.printStackTrace();
				System.out.println(
						"Exception occred in fetchFacilitiesNotificationData method -- " + exception.getMessage());
				if (trx != null)
					trx.rollback();
				if (session != null)
					session.close();
			} finally{}
			}
			
			//custom attachments
			String custom_attachments_whereclause = "";
			if(localAccount.getOperatorAcertificate()!= null)
				custom_attachments_whereclause+= "'"+operatorAcertificate+"'"+",";
			if(localAccount.getOperatorBcertificate()!= null)
				custom_attachments_whereclause+= "'"+operatorBcertificate+"'"+",";
			if(localAccount.getOperatorCcertificate()!= null)
				custom_attachments_whereclause+= "'"+operatorCcertificate+"'"+",";
			if(custom_attachments_whereclause.endsWith(","))
				custom_attachments_whereclause = custom_attachments_whereclause.substring(0, custom_attachments_whereclause.lastIndexOf(","));
			session = HibernateUtil.getSession();
			trx = session.beginTransaction();
			try {
				// Transaction t = session.beginTransaction();
				query = session.createNativeQuery(
						"SELECT * FROM custom_attachments__c  where facility__c =:facilitiesId and active__c='true' and type__c in ("+custom_attachments_whereclause+")",CustomAttachments.class);
				query.setString("facilitiesId", facilitiesId);
				List<CustomAttachments> customPortalList = query.list();
				trx.commit();
				session.close();
				if(customPortalList.size()>0){
					for (CustomAttachments attachments : customPortalList) {
						
					
					if(attachments.getType()!=null && attachments.getType().equalsIgnoreCase(operatorAcertificate))
						account.setOperatorAcertificateURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
					if(attachments.getType().equalsIgnoreCase(operatorBcertificate))
						account.setOperatorBcertificateURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);
					if(attachments.getType().equalsIgnoreCase(operatorCcertificate))
						account.setOperatorCcertificateURL(attachments.getG360URL()!=null?attachments.getG360URL():errorHandlingPDF);;
				}
				}
				
			} catch (Exception exception) {
				exception.printStackTrace();
				System.out.println(
						"Exception occred in fetchFacilitiesNotificationData method -- " + exception.getMessage());
				if (trx != null)
					trx.rollback();
				if (session != null)
					session.close();
			} finally{}
			
			return account;
		}
		return account;
	} catch (
	Exception exception){
		exception.printStackTrace();
		System.out
				.println("Exception occred in fetchFacilitiesNotificationData method -- " + exception.getMessage());
		if (trx != null)
			trx.rollback();
		if (session != null)
			session.close();
		return null;
	} finally

	{

	}
}
public boolean resetTankreportDeatils(String type, String facilitiesId) {

	Session session = HibernateUtil.getSession();
	Transaction trx = session.beginTransaction();
	Query query = null;
	try {
		if(type.equalsIgnoreCase("CSLD"))
		query = session.createNativeQuery(
				"update csldtestresult__c set viewed ='true'where facility__C =:facilitiesId");
		if(type.equalsIgnoreCase("tankstatus"))
		query = session.createNativeQuery(
				"update tankstatusreport__c set viewed ='true'where facility__C =:facilitiesId");
		if(type.equalsIgnoreCase("leaktest"))
			query = session.createNativeQuery(
					"update leaktestresults__c set viewed ='true' where facility__C =:facilitiesId");
		query.setString("facilitiesId", facilitiesId);
		int count = query.executeUpdate();
		trx.commit();
		session.close();
	} catch (Exception exception) {
		exception.printStackTrace();
		System.out.println("Exception occred in resetTankalarmHistory   method --" + exception.getMessage());
		if (trx != null)
			trx.rollback();
		if (session != null)
			session.close();
		return false;
	} finally {

	}
	return true;

}

	public String saveSiteIncome(SiteIncome siteIncome) {
		boolean needToUpdateAccount = false;
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			boolean sameDate = GolarsUtil.isSameDay(siteIncome.getFromDate(), Calendar.getInstance().getTime());
			if(siteIncome.getId()==0) {
				siteIncome.setCreatedDate(new  Date());
				siteIncome.setModifiedDate(new Date());
				siteIncome.setDataModifiedBy(siteIncome.getDataEnteredBy());
				session.saveOrUpdate(siteIncome);
			}else {
				SiteIncome income = session.get(SiteIncome.class,siteIncome.getId());
				income.setModifiedDate(new Date());
				income.setGallonsSold(siteIncome.getGallonsSold());
				income.setGasAmount(siteIncome.getGasAmount());
				income.setInsideSalesAmount(siteIncome.getInsideSalesAmount());
				income.setLotteryAmount(siteIncome.getLotteryAmount());
				income.setCigaretteSalesAmount(siteIncome.getCigaretteSalesAmount());
				income.setScratchOffSold(siteIncome.getScratchOffSold());
				income.setTax(siteIncome.getTax());
				income.setDataModifiedBy(siteIncome.getDataEnteredBy());
				session.update(income);
				
			}
			
			
			if (sameDate) {
				Account account = (Account) session.get(Account.class, siteIncome.getAccountID());
				account.setIncomeExpenseUpdates("true");
				session.saveOrUpdate(account);
				needToUpdateAccount = true;
			}
			trx.commit();
			session.close();
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred in SiteIncome method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return "false";
		} finally {

		}
		SaveResult[] saveResults = GolarsUtil.saveIncomeIntoSalesForce(siteIncome, needToUpdateAccount);
		if (saveResults != null && saveResults[0] != null && saveResults[0].getErrors().length > 0) {
			return "salesforceError";
		}
		session = HibernateUtil.getSession();
		trx = session.beginTransaction();
		try {
			SiteIncome income = session.get(SiteIncome.class,siteIncome.getId());
			income.setSalesforceId(saveResults[0].getId());
			session.update(income);
			trx.commit();
			session.close();
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred in SiteIncome method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return "false";
		} finally {

		}

		return "true";

	}

	public String saveSiteExpenses(SiteExpenses siteExpenses) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			if(siteExpenses.getId()==0) {
				siteExpenses.setCreatedDate(new  Date());
				siteExpenses.setModifiedDate(new Date());
				siteExpenses.setDataModifiedBy(siteExpenses.getDataEnteredBy());
				session.saveOrUpdate(siteExpenses);
			}else {
				SiteExpenses expense = session.get(SiteExpenses.class,siteExpenses.getId());
				expense.setModifiedDate(new Date());
				expense.setAmount(siteExpenses.getAmount());
				expense.setCheckNo(siteExpenses.getCheckNo());
				expense.setDate(expense.getDate());
				expense.setVendor(siteExpenses.getVendor());
				expense.setOthers(siteExpenses.getOthers());
				expense.setDataModifiedBy(siteExpenses.getDataEnteredBy());
				session.update(expense);
			}
			
			trx.commit();
			session.close();
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred in saveSiteExpenses   method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return "false";
		} finally {

		}
		SaveResult[] saveResults = GolarsUtil.saveExpensesIntoSalesForce(siteExpenses);
		if (saveResults != null && saveResults[0] != null && saveResults[0].getErrors().length > 0) {
			return "salesforceError";
		}
		session = HibernateUtil.getSession();
		trx = session.beginTransaction();
		try {
			SiteExpenses expense = session.get(SiteExpenses.class,siteExpenses.getId());
			expense.setSalesforceId(saveResults[0].getId());
			session.update(expense);
			trx.commit();
			session.close();
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred in saveSiteExpenses method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return "false";
		} finally {

		}

		return "true";
	}
public boolean saveIncomePickList(String key,String incomePickListValues) {

	Session session = null;

	Transaction trx = null;
	try {
		// stub
			session = HibernateUtil.getSession();

			trx = session.beginTransaction();// TODO Auto-generated method
			Settings settings = (Settings) session.get(Settings.class, key);
			Query query = null;
			if (settings != null) {
				query = session.createNativeQuery("UPDATE settings s SET s.value =:value WHERE s.key =:key");
				query.setString("value", incomePickListValues);
				query.setString("key", key);
				int result = query.executeUpdate();
			} else {
				query = session.createSQLQuery("INSERT INTO  settings(`key`,`value`) values(?,?)  ");
				query.setParameter(0, key);
				query.setParameter(1, incomePickListValues);
				query.executeUpdate();
			}
			trx.commit();
			session.close();
		
	} catch (Exception exception) {
		System.out.println("Exception occred while updating Setting : " + exception.getMessage());
		if (trx != null)
			trx.rollback();
		if (session != null)
			session.close();
		return false;
	}
	// User user = (User) session.get(User.class, username);
return true;

}
public Settings retrieveUserPreferences(String key) {
	Session session = HibernateUtil.getSession();
	Transaction trx = session.beginTransaction();
	// query.setString("preferenceName", preferenceName);
	List lst = null;
	try {
		Query query = session.createNativeQuery("SELECT * FROM customerportal.settings as s where s.key=:key", Settings.class);
		query.setString("key", key);
		lst = query.list();
		trx.commit();
		session.close();
		if(lst.size()==0)
			return new Settings();
		return (Settings) lst.get(0);
	} catch (Exception e) {
		System.out.println("Exception occred while retrieveUserPreferences : " + e.getMessage());
		if (trx != null)
			trx.rollback();
		if (session != null)
			session.close();
	}
	// session.close();
	return new Settings();
}
public List<KeyValue> getExpensesForUserForYear(String userId,String facilityId, Date startDate, Date endDate){
	List<KeyValue> expensesList = new ArrayList<KeyValue>();
	Session session = HibernateUtil.getSession();
	Transaction t = session.beginTransaction();
	Query query = session.createNativeQuery(
			"SELECT sum(Amount__C), DATE_FORMAT(Date__C, '%M') AS month,  DATE_FORMAT(Date__C, '%Y') AS year  FROM site_expenses__c WHERE Account_ID__c ='" +facilityId+"' and  Date__C >=date_add(\""+new SimpleDateFormat("yyyy-MM-dd").format(startDate)+"\", INTERVAL 0 DAY) \r\n" + 
			"AND Date__C< date_add(\""+new SimpleDateFormat("yyyy-MM-dd").format(endDate)+"\", INTERVAL 0 DAY) GROUP BY DATE_FORMAT(Date__C, '%Y-%m')  order by Date__C;");
	List<Object[]> lst = query.list();
	System.out.println(lst.size());
	for (Object[] object : lst) {
		KeyValue rep = new KeyValue();
		rep.setKey(object[1].toString()+" "+object[2].toString());
		rep.setValue(object[0].toString());
		rep.setName(object[1].toString());
		expensesList.add(rep);
	}
	
	t.commit();
	session.close();
	return expensesList;
}

	public List<SiteExpenses> getExpensesForUserForCustomDate(String userId, String facilityId, Date startDate,
			Date endDate) {
		if (startDate == null)
			startDate = new Date();
		if (endDate == null)
			endDate = new Date();
		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery("SELECT * FROM site_expenses__c WHERE Account_ID__c ='" + facilityId
				+ "' and  Created_Date__C >=date_add(\"" + new SimpleDateFormat("yyyy-MM-dd").format(startDate)
				+ "\", INTERVAL 0 DAY) \r\n" + "AND Created_Date__C< date_add(\""
				+ new SimpleDateFormat("yyyy-MM-dd").format(endDate) + "\", INTERVAL 0 DAY) order by Date__C;",
				SiteExpenses.class);
		List<SiteExpenses> lst = query.list();
		System.out.println(lst.size());
		if (lst != null) {
			for (SiteExpenses siteIncome : lst) {
				siteIncome.setDateString(new SimpleDateFormat("MMM d, yyyy h:mm:ss a").format(siteIncome.getDate()));
			}
		}
		t.commit();
		session.close();
		return lst;
	}

	public List<KeyValue> getIncomeForUserByMonthly(String userId,String facilityId, Date startDate, Date endDate, String chartType){
	List<KeyValue> expensesList = new ArrayList<KeyValue>();
	Session session = HibernateUtil.getSession();
	Transaction t = session.beginTransaction();

	Query query = session.createNativeQuery(
			"select DATE_FORMAT(from_Date__c, '%M') AS month,SUM(Gas_Amount__c) as Gas_Amount__c ,\r\n" + 
			"SUM(Inside_Sales_Amount__c) as Inside_Sales_Amount__c ,SUM(Lottery_Amount__c) as Lottery_Amount__c ,\r\n" + 
			"SUM(Scratch_Off_Sold__c) as Scratch_Off_Sold__c,DATE_FORMAT(from_Date__c, '%Y') AS year  FROM site_income__c WHERE Account_ID__c ='" +facilityId+"' and DATE(from_Date__c)>=date_add(\""+new SimpleDateFormat("yyyy-MM-dd").format(startDate)+"\", INTERVAL 0 DAY)  AND "
					+ "DATE(from_Date__c) <= date_add(\""+new SimpleDateFormat("yyyy-MM-dd").format(endDate)+"\", INTERVAL 0 DAY)  GROUP BY DATE_FORMAT(from_Date__c, '%M')  order by from_Date__c;\r\n" + 
			"");
	List<Object[]> lst = query.list();
	System.out.println(lst.size());
	for (Object[] object : lst) {
		double totalValue=0;
		KeyValue rep = new KeyValue();
		totalValue = object[1] !=null ?totalValue+Double.parseDouble(object[1].toString()):totalValue;
		totalValue = object[2] !=null ?totalValue+Double.parseDouble(object[2].toString()):totalValue;
		totalValue = object[3] !=null ?totalValue+Double.parseDouble(object[3].toString()):totalValue;
		totalValue = object[4] !=null ?totalValue+Double.parseDouble(object[4].toString()):totalValue;
		
		rep.setKey(object[0].toString()+" "+object[5].toString());
		DecimalFormat df = new DecimalFormat("#.00");
	    String totalStringValue = df.format(totalValue);
		rep.setValue(totalStringValue);

		rep.setName(object[0].toString());
		expensesList.add(rep);
	}
	
	t.commit();
	session.close();
	return expensesList;
}
	
	public List<KeyValue> getIncomeForUserByNetIncome(String userId,String facilityId, Date startDate, Date endDate, String chartType){
		List<KeyValue> expensesList = new ArrayList<KeyValue>();
		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();

		Query query = session.createNativeQuery(
				"select DATE_FORMAT(from_Date__c, '%M') AS month,SUM(Gas_Amount__c) as Gas_Amount__c ,\r\n" + 
				"SUM(Inside_Sales_Amount__c) as Inside_Sales_Amount__c ,SUM(Lottery_Amount__c) as Lottery_Amount__c ,\r\n" + 
				"SUM(Scratch_Off_Sold__c) as Scratch_Off_Sold__c,SUM(Tax__c) as Tax__c, DATE_FORMAT(from_Date__c, '%Y') AS year  FROM site_income__c WHERE Account_ID__c ='" +facilityId+"' and DATE(from_Date__c)>=date_add(\""+new SimpleDateFormat("yyyy-MM-dd").format(startDate)+"\", INTERVAL 0 DAY)  AND "
						+ "DATE(from_Date__c) <= date_add(\""+new SimpleDateFormat("yyyy-MM-dd").format(endDate)+"\", INTERVAL 0 DAY)  GROUP BY DATE_FORMAT(from_Date__c, '%M')  order by from_Date__c;\r\n" + 
				"");
		List<Object[]> lst = query.list();
		System.out.println(lst.size());
		for (Object[] object : lst) {
			double totalValue=0;
			KeyValue rep = new KeyValue();
			totalValue = object[1] !=null ?totalValue+((Double.parseDouble(object[1].toString())*10)/100):totalValue;
			totalValue = object[2] !=null ?totalValue+((Double.parseDouble(object[2].toString())*35)/100):totalValue;
			totalValue = object[3] !=null ?totalValue+((Double.parseDouble(object[3].toString())*6)/100):totalValue;
			totalValue = object[4] !=null ?totalValue+((Double.parseDouble(object[4].toString())*6)/100):totalValue;
			totalValue = object[5] !=null ?totalValue-Double.parseDouble(object[5].toString()):totalValue;
			rep.setKey(object[0].toString()+" "+object[6].toString());
			DecimalFormat df = new DecimalFormat("#.00");
		    String totalStringValue = df.format(totalValue);
			rep.setValue(totalStringValue);

			rep.setName(object[0].toString());
			expensesList.add(rep);
		}
		
		t.commit();
		session.close();
		return expensesList;
	}
	

public List<IncomeReportData> getIncomeForUserByType(String userId,String facilityId, Date startDate, Date endDate, String chartType){
	List<IncomeReportData> expensesList = new ArrayList<IncomeReportData>();
	Session session = HibernateUtil.getSession();
	Transaction t = session.beginTransaction();

	Query query = session.createNativeQuery(
			"select DATE_FORMAT(from_Date__c, '%M') AS month, SUM(Gas_Amount__c) as Gas_Amount__c ,\r\n" + 
			"SUM(Inside_Sales_Amount__c) as Inside_Sales_Amount__c , SUM(Cigarette_Sales_Amount__c) as Cigarette_Sales_Amount__c,SUM(Lottery_Amount__c) as Lottery_Amount__c ,\r\n" + 
			"SUM(Scratch_Off_Sold__c) as Scratch_Off_Sold__c,DATE_FORMAT(from_Date__c, '%Y') AS year FROM site_income__c WHERE Account_ID__c ='" +facilityId+ 
			"' and DATE(from_Date__c)>=date_add(\""+new SimpleDateFormat("yyyy-MM-dd").format(startDate)+"\" , INTERVAL 0 DAY)  AND "
					+ "DATE(from_Date__c) <=  date_add(\""+new SimpleDateFormat("yyyy-MM-dd").format(endDate)+"\" , INTERVAL 0 DAY) GROUP BY DATE_FORMAT(from_Date__c, '%M')  order by from_Date__c;\r\n" + 
			"");
	List<Object[]> lst = query.list();
	System.out.println(lst.size());
	List<String> labelsList = Arrays.asList("Gallons Sold","Gas Amount","Inside Sales Amount","Cigarette Sales Amount","Lottery Amount","Scratch Off Sold");
	int index = 0;
	for (Object[] object : lst) {
		IncomeReportData data = new IncomeReportData();
		data.setMonth(object[0].toString() +" "+object[6].toString());
		data.setLabel(labelsList.get(index));
//		data.setGallonsSold(object[1] !=null ?Double.parseDouble(object[1].toString()):0);
		data.setGasAmount(object[1] !=null ?Double.parseDouble(object[1].toString()):0);
		data.setInsideSalesAmount(object[2] !=null ?Double.parseDouble(object[2].toString()):0);
		data.setCigaretteSalesAmount(object[3] !=null ?Double.parseDouble(object[3].toString()):0);
		data.setLotteryAmount(object[4] !=null ?Double.parseDouble(object[3].toString()):0);
		data.setScratchOffSold(object[5] !=null ?Double.parseDouble(object[4].toString()):0);
		expensesList.add(data);
	}
	
	t.commit();
	session.close();
	return expensesList;
}
public List<SiteIncome> deleteIncomeRecord(int incomeId, String userId, String facilityId){
	Session session = HibernateUtil.getSession();
	Transaction t = session.beginTransaction();
	SiteIncome income  = session.get(SiteIncome.class, incomeId);
	session.delete(income);
	t.commit();	
	session.close();
	DeleteResult[] saveResults = GolarsUtil.deletencomeIntoSalesForce(income.getSalesforceId());
	if (saveResults != null && saveResults[0] != null && saveResults[0].getErrors().length > 0) {
		System.out.println("Salesforce error::: "+saveResults.toString());
	}
	return getIncomeForUserByCustomDate(userId, facilityId, new Date(), new Date());
}
public List<SiteExpenses> deleteExpensesRecord(int incomeId, String userId, String facilityId){
	Session session = HibernateUtil.getSession();
	Transaction t = session.beginTransaction();
	SiteExpenses siteExpense  = session.get(SiteExpenses.class, incomeId);
	session.delete(siteExpense);
	t.commit();	
	session.close();
	DeleteResult[] saveResults = GolarsUtil.deletencomeIntoSalesForce(siteExpense.getSalesforceId());
	if (saveResults != null && saveResults[0] != null && saveResults[0].getErrors().length > 0) {
		System.out.println("Salesforce error::: "+saveResults.toString());
	}
	return getExpensesForUserForCustomDate(userId, facilityId, new Date(), new Date());
}

	public List<SiteIncome> getIncomeForUserByCustomDate(String userId, String facilityId, Date startDate,
			Date endDate) {
		if (startDate == null)
			startDate = new Date();
		if (endDate == null)
			endDate = new Date();
		List<IncomeReportData> expensesList = new ArrayList<IncomeReportData>();
		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();

		Query query = session.createNativeQuery("select * FROM site_income__c WHERE Account_ID__c ='" + facilityId
				+ "' and DATE(Created_Date__C)>=date_add(\"" + new SimpleDateFormat("yyyy-MM-dd").format(startDate)
				+ "\" , INTERVAL 0 DAY)  AND " + "DATE(Created_Date__C) <=  date_add(\""
				+ new SimpleDateFormat("yyyy-MM-dd").format(startDate)
				+ "\" , INTERVAL 0 DAY) order by from_Date__c;\r\n" + "", SiteIncome.class);
		List<SiteIncome> lst = query.list();
		System.out.println(lst.size());
		if (lst != null) {
			for (SiteIncome siteIncome : lst) {
				siteIncome.setFromDateString(
						new SimpleDateFormat("MMM d, yyyy h:mm:ss a").format(siteIncome.getFromDate()));
				siteIncome
						.setToDateString(new SimpleDateFormat("MMM d, yyyy h:mm:ss a").format(siteIncome.getToDate()));
			}
		}
		t.commit();
		session.close();
		return lst;
	}
	public List<SiteIncome> getIncomeDetailsOnChartClick(String userId,String facilityId, Date startDate, Date endDate, String monthAndYear){
	String month,year;
	if(monthAndYear.indexOf(" ")>0) {
		String monthArray[] = monthAndYear.split(" ");
		month = monthArray[0];
		year = monthArray[1];
	}else {
		month = monthAndYear;
		year = (startDate.getYear()+1900)+"";
	}
		List<IncomeReportData> expensesList = new ArrayList<IncomeReportData>();
		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
	

		Query query = session.createNativeQuery(
				"select * FROM site_income__c WHERE Account_ID__c ='" +facilityId+ 
				"' and DATE(from_Date__c)>=date_add(\""+new SimpleDateFormat("yyyy-MM-dd").format(startDate)+"\" , INTERVAL 0 DAY)  AND "
						+ "DATE_FORMAT(from_Date__c, '%M') ='"+month+"' and "+"DATE_FORMAT(from_Date__c, '%Y') ='"+year+"' order by from_Date__c",SiteIncome.class);
		List<SiteIncome> incomeList = query.list();
		System.out.println(incomeList.size());
		if (incomeList != null) {
			for (SiteIncome siteIncome : incomeList) {
				siteIncome.setFromDateString(
						new SimpleDateFormat("MMM d, yyyy h:mm:ss a").format(siteIncome.getFromDate()));
				siteIncome
						.setToDateString(new SimpleDateFormat("MMM d, yyyy h:mm:ss a").format(siteIncome.getToDate()));
			}
		}

		t.commit();
		session.close();
		return incomeList;
	}
	public List<SiteExpenses> getExpensesChartCick(String userId, String facilityId, Date startDate,
			Date endDate, String monthAndYear) {
		String month,year;
		if (startDate == null)
			startDate = new Date();
		if (endDate == null)
			endDate = new Date();
		if(monthAndYear.indexOf(" ")>0) {
			String monthArray[] = monthAndYear.split(" ");
			month = monthArray[0];
			year = monthArray[1];
		}else {
			month = monthAndYear;
			year = (startDate.getYear()+1900)+"";
		}
		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery("SELECT * FROM site_expenses__c WHERE Account_ID__c ='" + facilityId
				+ "' and  Created_Date__C >=date_add(\"" + new SimpleDateFormat("yyyy-MM-dd").format(startDate)
				+ "\", INTERVAL 0 DAY) \r\n" + "AND Created_Date__C< date_add(\""
				+ new SimpleDateFormat("yyyy-MM-dd").format(endDate) + "\", INTERVAL 0 DAY)  AND DATE_FORMAT(Date__c, '%M') ='"+month+"' AND DATE_FORMAT(Date__c, '%Y') ='"+year+"' order by Date__C;",
				SiteExpenses.class);
		List<SiteExpenses> lst = query.list();
		System.out.println(lst.size());
		if (lst != null) {
			for (SiteExpenses siteIncome : lst) {
				siteIncome.setDateString(new SimpleDateFormat("MMM d, yyyy h:mm:ss a").format(siteIncome.getDate()));
			}
		}
		t.commit();
		session.close();
		return lst;
	}

	public void saveInventory(List<InventoryReport> inventoryReportList) {
		
		
			for (InventoryReport inventoryReport : inventoryReportList) {
				Session session = HibernateUtil.getSession();
				Transaction trx = session.beginTransaction();
				session.save(inventoryReport);
				trx.commit();
			}
		
	}
	public FacilityReports getFacilityReport(String fid,String reportType) {

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			System.out.println("fid-------" + fid + " ---------" + reportType);
			Query query = session.createNativeQuery("SELECT * FROM facilityReports d where d.fid_C =:fid and d.report_Type_C =:reportType",
					FacilityReports.class);
			query.setString("fid", fid);
			query.setString("reportType", reportType);
			List list = query.list();
			System.out.println("list-------" + list);
			FacilityReports report =null;
			if (list != null && list.size() > 0)
				report = (FacilityReports) list.get(0);
			trx.commit();
			session.close();
			return report;
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred while getFacilityReport: " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally {

		}
	}
	
	public void saveFacilityReport(FacilityReports report) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		session.saveOrUpdate(report);
		trx.commit();
	}
}
