package com.customerportal.util;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.customerportal.bean.Account;
import com.customerportal.bean.ChangePassword;
import com.customerportal.bean.Company;
import com.customerportal.bean.Contact;
import com.customerportal.bean.Facilities;
import com.customerportal.bean.Gaslevel;
import com.customerportal.bean.InventoryReport;
import com.customerportal.bean.JobSchedule;
import com.customerportal.bean.JobScheduleHistory;
import com.customerportal.bean.KeyValue;
import com.customerportal.bean.LoginHistory;
import com.customerportal.bean.SearchResults;
import com.customerportal.bean.TankAarmHistory;
import com.customerportal.bean.TankMonitorSignup;
import com.customerportal.bean.USSBOA;
import com.customerportal.bean.User;
import com.customerportal.bean.Userpreferences;

public class DBUtil {
	private static DBUtil dbObj;

	public DBUtil() {
	}

	public static DBUtil getInstance() {
		if (dbObj == null) {
			dbObj = new DBUtil();
		}
		return dbObj;
	}

	public List<User> getAllUsers() {

		Session session = HibernateUtil.getSession();
		;
		Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery("SELECT * FROM crmuser", User.class);
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
			setGasLevels(lst);
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
			setGasLevels(lst);
			trx.commit();
			session.close();
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
			// Transaction t = session.beginTransaction();
			Query query = session.createNativeQuery(
					"SELECT * "
							+ "FROM Facility_Management__c f where f.Contact__c =:userId and f.Facility__c =:facilityId",
					Facilities.class);
			query.setString("userId", userId);
			query.setString("facilityId", facilityID);
			List lst = query.list();
			trx.commit();
			session.close();
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

	public List<Company> fetchCompany(String userId, String companyID) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			Query query = session.createNativeQuery(
					"SELECT Company_Name__c,Company_Owner__c,Existing_Client__c,External_ID__c,Name,Owner_Name__c FROM affiliate_company__c where Company_Owner__c='"
							+ userId + "' and Company_Name__c ='" + companyID + "'",
					Company.class);
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
			String queryString = "Select count(*) from Account WHERE Compliant__c='" + compliance + "'";
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
			String queryString = "Select id from Account WHERE ((Facility_Operator_POA__c = 'Missing' OR Property_Owner_POA__c = 'Missing' OR "
					+ "UST_Owner_POA__c = 'Missing' OR Operator_Affidevit_of_Lease__c = 'Missing' OR Owner_Affidavit_Of_Lease__c = 'Missing' OR SOS_Status__c = 'Missing' OR Tax_ID_Information__c = 'Missing' or "
					+ "Letter_of_Networth_Certificate_of_INsure__c = 'Missing' or Operator_Lease_Agreement__c = 'Missing')) ";

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
			String queryString = "Select id from Account WHERE ((Line_and_Leak_Detector_Test__c is null AND Is_LnL_Detr_Tst_requrd__c = 'true')"+  
			"OR (Cathodic_Protection__c is null AND Is_CP_required__c = 'true')"  +
			"OR (Tank_Testing_Report__c is null AND Is_Tank_Testing_Report_Required__c = 'true' )" +
			"OR (Repair_Documents__c is null AND Are_Repair_Documents_Required__c = 'true')" +
			"OR (Release_Detection_Report__c is null AND Is_Release_Detection_Report_Required__c = 'true') "+
			"OR (Internal_Lining_Inspection__c is null AND Is_IL_Inspection_Required__c = 'true') )";
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
					+ "OR Operator_C_certificate__c is null)";
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
			Query query = session.createNativeQuery(
					"SELECT * FROM "
							+ "Facility_Management__c where contact__c =:userId",
					Facilities.class);
			// if (compliance.equalsIgnoreCase("compliance")) {
			// query.setString("compliance", "true");
			// query.setString("tankService", "true");
			// } else{
			// query.setString("compliance", "false");
			// query.setString("tankService", "true");
			// }
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

		Session session = HibernateUtil.getSession();
		;
		Transaction t = session.beginTransaction();
		Query query = session.createNativeQuery(
				"SELECT a.Name,a.Is_Active__c,a.BillingStreet,a.BillingCity,a.BillingState,	a.BillingPostalCode,c.name as vendorName,c.email__c,c.Phone,c.mobilephone, a.USSBOA_Documents_Link__c "
						+ "FROM account a, contact c where a.Parent_Name__c = 'USSBOA Approved Vendors' and a.Is_Active__c = 'True' AND a.Company_Contact__c = c.Id and a.vendor_type__c =:vendorType");
		if(vendorType.equalsIgnoreCase("preferred"))
			query.setString("vendorType", "Preferred Vendor");
		else
			query.setString("vendorType", "Associate Vendor");

		List<USSBOA> lst = new ArrayList<USSBOA>();
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

	public Account fetchFacilitiesNotificationData(String facilitiesId) {

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			Query query = session.createNativeQuery(
					"SELECT * FROM Account where id =:facilitiesId",
					Account.class);

			query.setString("facilitiesId", facilitiesId);
			List<Account> lst = query.list();
			trx.commit();
			session.close();
			if (lst.size() > 0) {
				Account account = lst.get(0);
				if (account.getFacilityOperatorPOA() != null
						&& account.getFacilityOperatorPOA().equalsIgnoreCase("Missing"))
					account.setFacilityOperatorPOAEnable(true);
				if (account.getPropertyOwnerPOA() != null && account.getPropertyOwnerPOA().equalsIgnoreCase("Missing"))
					account.setPropertyOwnerPOAEnable(true);
				if (account.getUstOwnerPOA() != null && account.getUstOwnerPOA().equalsIgnoreCase("Missing"))
					account.setUstOwnerPOAEnable(true);
				if (account.getPropertyDeedLandContract() != null
						&& account.getPropertyDeedLandContract().equalsIgnoreCase("0"))
					account.setPropertyDeedLandContractEnable(true);
				if (account.getOperatorAffidevitOfLease() != null
						&& account.getOperatorAffidevitOfLease().equalsIgnoreCase("Missing"))
					account.setOperatorAffidevitOfLeaseEnable(true);
				if (account.getOwnerAffidevitOfLease() != null
						&& account.getOwnerAffidevitOfLease().equalsIgnoreCase("Missing"))
					account.setOwnerAffidevitOfLeaseEnable(true);
				if (account.getSosStatus() != null && account.getSosStatus().equalsIgnoreCase("Missing"))
					account.setSosStatusEnable(true);
				if (account.getTaxIDInformation() != null && account.getTaxIDInformation().equalsIgnoreCase("Missing"))
					account.setTaxIDInformationEnable(true);
				 if(account.getLetterOfNetworthCertification() != null &&
				 account.getLetterOfNetworthCertification().equalsIgnoreCase("Missing"))
				 account.setLetterOfNetworthCertificationEnable(true);
				if (account.getOperatorLeaseAgreement() != null
						&& account.getOperatorLeaseAgreement().equalsIgnoreCase("Missing"))
					account.setOperatorLeaseAgreementEnable(true);
				if (account.getNotificationDueDate() != null && account.getNotificationDueDate().equalsIgnoreCase("0"))
					account.setNotificationDueDateEnable(true);
				// compliance start
				if (account.getLnlDetrTstRequrd() != null && account.getLnlDetrTstRequrd().equalsIgnoreCase("true")
						&& account.getLineAndLeakDetector() == null)
					account.setLnlDetrTstRequrdEnable(true);
				if (account.getCprequired() != null && account.getCprequired().equalsIgnoreCase("true")
						&& account.getCathodicProtection() == null)
					account.setCprequiredEnable(true);
				if (account.getTankTestingReportRequired() != null
						&& account.getTankTestingReportRequired().equalsIgnoreCase("true")
						&& account.getTankTestingReport() == null)
					account.setTankTestingReportRequiredEnable(true);
				if (account.getRepairDocumentRequired() != null
						&& account.getRepairDocumentRequired().equalsIgnoreCase("true")
						&& account.getRepairDocuments() == null)
					account.setRepairDocumentRequiredEnable(true);
				if (account.getReleaseDetectionReportRequired() != null
						&& account.getReleaseDetectionReportRequired().equalsIgnoreCase("true")
						&& account.getReleaseDetectionReport() == null)
					account.setReleaseDetectionReportRequiredEnable(true);
				if (account.getInternalLiningInspectionRequired() != null
						&& account.getInternalLiningInspectionRequired().equalsIgnoreCase("true")
						&& account.getInternalLiningInspection() == null)
					account.setInternalLiningInspectionRequiredEnable(true);
				// compliance end
				// certification start
				if (account.getOperatorAcertificate() == null)
					account.setOperatorAcertificateEnable(true);
				if (account.getOperatorBcertificate() == null)
					account.setOperatorBcertificateEnable(true);
				if (account.getOperatorCcertificate() == null)
					account.setOperatorCcertificateEnable(true);
				// certification end

				// if(account.getNotificationFormSubmitted() == null ||
				// account.getNotificationFormSubmitted().equalsIgnoreCase(null))
				// account.setNotificationFormSubmittedEnable(true);

				return account;
			}
			return null;
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

	public void updateFileLabelMissing(String fileuploadlabel, String facilityId) {

		Session session = null;

		Transaction trx = null;
		try {
			// stub
			session = HibernateUtil.getSession();

			trx = session.beginTransaction();// TODO Auto-generated method
			Query query = null;
			query = session.createNativeQuery(
					"UPDATE Account a SET a." + fileuploadlabel + "='Received' WHERE a.Id =:facilityId");
			query.setString("facilityId", facilityId);
			int result = query.executeUpdate();
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

	public List<KeyValue> retrieveConsolidateReport(List<Facilities> facilitiesList) {
		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
		// Map<String, Object> consolidateMap = new HashMap<String, Object>();
		List<KeyValue> consolidateList = new ArrayList<KeyValue>();
		for (Facilities facilities : facilitiesList) {
			if (facilities == null)
				continue;
			Query query = session.createNativeQuery(
					"SELECT MAX(CAST(Date__c AS DATETIME)) as DATETIME, PRODUCT__c, GALLONS__c, TANK__c FROM inventoryreport__c where Facility__c='"
							+ facilities.getFacilityId()
							+ "' and CAST(Date__c AS DATETIME) = (SELECT MAX(CAST(Date__c AS DATETIME)) FROM inventoryreport__c where Facility__c='"
							+ facilities.getFacilityId()
							+ "' )  group by Tank__C order by CAST(Date__C AS DATETIME) DESC   ;",
					InventoryReport.class);
			List<InventoryReport> lst = query.list();
			System.out.println(lst.size());
			if (lst.size() > 0) {
				for (InventoryReport iReport : lst) {
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
						kv.setKey(iReport.getProduct());
						kv.setName(iReport.getTank());
						kv.setValue(iReport.getGallons());
						consolidateList.add(kv);
					}
					System.out.println(iReport);
				}
			}
		}

		// query.setString("userId", userId);
		t.commit();
		session.close();
		return consolidateList;
	}

	public List<KeyValue> retrieveSpecifiFacilityConsolidateReport(Facilities facilities) {
		Session session = HibernateUtil.getSession();
		Transaction t = session.beginTransaction();
		// Map<String, Object> consolidateMap = new HashMap<String, Object>();
		List<KeyValue> consolidateList = new ArrayList<KeyValue>();

		Query query = session
				.createNativeQuery(
						"SELECT MAX(CAST(Date__c AS DATETIME)) as DATETIME, PRODUCT__c, GALLONS__c, TANK__c FROM inventoryreport__c where Facility__c='"
								+ facilities.getFacilityId()
								+ "' and CAST(Date__c AS DATETIME) = (SELECT MAX(CAST(Date__c AS DATETIME)) FROM inventoryreport__c where Facility__c='"
								+ facilities.getFacilityId()
								+ "' )  group by Tank__C order by CAST(Date__C AS DATETIME) DESC   ;",
						InventoryReport.class);
		List<InventoryReport> lst = query.list();
		System.out.println(lst.size());
		if (lst.size() > 0) {
			for (InventoryReport iReport : lst) {
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
					kv.setKey(iReport.getProduct());
					kv.setValue(iReport.getGallons());
					consolidateList.add(kv);
				}
				System.out.println(iReport);
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
			Query query = session.createNativeQuery(
					"SELECT tnk.FID__c, acc.Name, tnk.OccuredDate__c, tnk.AlarmType__c, tnk.Id FROM tankalarmhistory__c tnk, account acc where tnk.Facility__c = acc.Id  and (tnk.viewed is null or tnk.viewed ='false') "
					+ "and tnk.AlarmType__C !='---' and facility__C in ("
							+ facilitiesIdString + " ) order by tnk.OccuredDate__c desc");

			List<TankAarmHistory> lst = new ArrayList<TankAarmHistory>();
			List<Object[]> rows = query.list();
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

			trx.commit();
			session.close();
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
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred in saveJobScheduleData   method --" + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
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
}
