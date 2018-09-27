package com.customerportal.util;

import java.util.Base64;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.customerportal.bean.Account;
import com.customerportal.bean.ChangePassword;
import com.customerportal.bean.Company;
import com.customerportal.bean.Contact;
import com.customerportal.bean.Facilities;
import com.customerportal.bean.SearchResults;
import com.customerportal.bean.User;

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
		session.close();
		return lst;
	}

	public User login(String username, String password) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			User user = (User) session.get(User.class, username);
			password = new String(Base64.getEncoder().encode(password.getBytes()));
			if (password.equals(user.getPassword())) {
				trx.commit();
				session.close();
				return user;
			}

		} catch (Exception exception) {
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
			Query query = session.createNativeQuery(
					"SELECT Company__c,Contact__c,External_ID__c,Facility_Address__c,Facility__c,FID__c,GOLARS_Project__c,Golars_Tank_Paid_Service__c,MGT_Project__c,Facility_Name__c,Facility_Brand__c,Operator_Company__c,OwnerId,PERC_Concentration__c,Property_Owner__c,State__c,Street__c,City__c,USSBOA_Paid_Service__c,UST_Owner_Company__c FROM Facility_Management__c where Contact__c= '"
							+ userId + "'",
					Facilities.class);
			List lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (

		Exception exception)

		{
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
								+ "Phone,Phone__c,Profession__c,Salutation,Tax_ID__c,Title F"
								+ "ROM Contact c where c.FirstName LIKE :searchString",
						Contact.class);

			} else if (searchOption.equalsIgnoreCase("lname")) {
				query = session.createNativeQuery(
						"SELECT Email__c,Existing_Client__c,External_ID__c,FirstName,Id,LastName,MailingAddress,MailingCity,MailingCountry"
								+ ",MailingPostalCode,MailingState,MailingStreet,Member_ID__c,MiddleName,MobilePhone,Name,"
								+ "Phone,Phone__c,Profession__c,Salutation,Tax_ID__c,Title F"
								+ "ROM Contact c where c.LastName LIKE :searchString",
						Contact.class);
			}
			if (searchOption.equalsIgnoreCase("email")) {
				query = session.createNativeQuery(
						"SELECT Email__c,Existing_Client__c,External_ID__c,FirstName,Id,LastName,MailingAddress,MailingCity,MailingCountry"
								+ ",MailingPostalCode,MailingState,MailingStreet,Member_ID__c,MiddleName,MobilePhone,Name,"
								+ "Phone,Phone__c,Profession__c,Salutation,Tax_ID__c,Title F"
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
			System.out.println("Exception occred in checkUserPresent for reset password method --" + exception.getMessage());
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
			Query query = session.createNativeQuery(
					"SELECT Company__c,Contact__c,External_ID__c,Facility_Address__c,Facility__c,FID__c,GOLARS_Project__c,Golars_Tank_Paid_Service__c,MGT_Project__c,Facility_Name__c,Facility_Brand__c,"
							+ "Operator_Company__c,OwnerId,PERC_Concentration__c,Property_Owner__c,State__c,Street__c,City__c,USSBOA_Paid_Service__c,UST_Owner_Company__c "
							+ "FROM Facility_Management__c f where f.Contact__c =:userId and f.Golars_Tank_Paid_Service__c =:tankService",
					Facilities.class);
			query.setString("userId", userId);
			if (facilitiesType.equalsIgnoreCase("signed"))
				query.setBoolean("tankService", true);
			else
				query.setBoolean("tankService", false);
			List lst = query.list();
			trx.commit();
			session.close();
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
			Query query = session.createNativeQuery(
					"SELECT Company_Name__c,Company_Owner__c,Existing_Client__c,External_ID__c,Name,Owner_Name__c FROM affiliate_company__c where Company_Owner__c='"
							+ userId + "'",
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

	public int fetchComplianceFacilities(String userId, String facilitiesIdString, boolean compliance) {

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			String queryString = "Select count(*) from Account WHERE Compliant__c=" + compliance;
			if(facilitiesIdString != null && facilitiesIdString.length() >0){
				queryString+= " and id in (" + facilitiesIdString+" )" ;
			}
			Query query = session
					.createNativeQuery(queryString);
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
			String queryString = "Select id from Account WHERE (((Facility_Operator_POA__c = 'Missing' OR "
					+ "Property_Owner_POA__c = 'Missing' OR UST_Owner_POA__c = 'Missing' OR "
					+ "Operator_Affidevit_of_Lease__c = 'Missing' OR Owner_Affidavit_Of_Lease__c = 'Missing' OR "
					+ "SOS_Status__c = 'Missing' or "
					+ "Letter_of_Networth_Certificate_of_INsure__c = 'Missing' or "
					+ "Tax_ID_Information__c = 'Missing' or Operator_Lease_Agreement__c = 'Missing')))";
			
							if(facilitiesIdString != null && facilitiesIdString.length() >0){
								queryString+= "and id in (" + facilitiesIdString+" )" ;
							}
							Query query = session
									.createNativeQuery(queryString);
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
			String queryString = 
					"Select id from Account WHERE ((MGT_Paid_Service__c = true  and Notification_form_Submitted__c = null) OR"
							+ " (((Line_and_Leak_Detector_Test__c = null AND Is_LnL_Detr_Tst_requrd__c = TRUE)  OR "
							+ "(Cathodic_Protection__c = null AND Is_CP_required__c = TRUE)  OR "
							+ "(Tank_Testing_Report__c = null AND Is_Tank_Testing_Report_Required__c = TRUE ) OR "
							+ "(Repair_Documents__c = null AND Are_Repair_Documents_Required__c = TRUE) OR "
							+ "(Release_Detection_Report__c = null AND Is_Release_Detection_Report_Required__c = TRUE) OR "
							+ "(Internal_Lining_Inspection__c = NULL AND Is_IL_Inspection_Required__c = TRUE) ) AND MGT_Paid_Service__c = true and Do_not_Trigger_emails__c = false )) ";
			if(facilitiesIdString != null && facilitiesIdString.length() >0){
				queryString+= "and id in (" + facilitiesIdString+" )" ;
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
			String queryString = "Select id from Account WHERE  MGT_Paid_Service__c = true "
					+ "and (Operator_A_certificate__c = null  OR Operator_B_certificate__c = null  "
					+ "OR Operator_C_certificate__c = null)";
			if(facilitiesIdString != null && facilitiesIdString.length() >0){
				queryString+= "and id in (" + facilitiesIdString+" )" ;
			}
			Query query = session
					.createNativeQuery(queryString);
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
							"SELECT Company__c,Contact__c,External_ID__c,Facility_Address__c,Facility__c,FID__c,GOLARS_Project__c,Golars_Tank_Paid_Service__c,MGT_Project__c,Facility_Name__c,Facility_Brand__c,"
									+ "Operator_Company__c,OwnerId,PERC_Concentration__c,Property_Owner__c,State__c,Street__c,City__c,USSBOA_Paid_Service__c,UST_Owner_Company__c "
									+ "FROM Facility_Management__c f where f.company__c =:companyName",
							Facilities.class);
			// query.setString("userId", companyOwner);

			query.setString("companyName", companyName);
			List lst = query.list();
			trx.commit();
			session.close();
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
					"SELECT Company__c,Contact__c,External_ID__c,Facility_Address__c,Facility__c,FID__c,GOLARS_Project__c,"
							+ "Golars_Tank_Paid_Service__c,MGT_Project__c,Facility_Name__c,Facility_Brand__c,"
							+ "Operator_Company__c,OwnerId,PERC_Concentration__c,Property_Owner__c,State__c,Street__c,City__c,USSBOA_Paid_Service__c,UST_Owner_Company__c FROM "
							+ "Facility_Management__c where Compliant__c =:compliance",
					Facilities.class);
			if (compliance.equalsIgnoreCase("compliance")) {
				query.setBoolean("compliance", true);
			} else
				query.setBoolean("compliance", false);
			List lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (

		Exception exception)

		{
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

	public Account fetchFacilitiesNotificationData(String facilitiesId) {

		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			Query query = session.createNativeQuery(
					"SELECT id, Facility_Operator_POA__c,Property_Owner_POA__c,UST_Owner_POA__c,Notification_form_Submitted__c,Property_Deed_Land_Contract__c,Operator_Affidevit_of_Lease__c,Owner_Affidavit_Of_Lease__c,SOS_Status__c,Tax_ID_Information__c,Letter_of_Networth_Certificate_of_INsure__c,Operator_Lease_Agreement__c,Line_and_Leak_Detector_Test__c,Is_LnL_Detr_Tst_requrd__c,Cathodic_Protection__c,Is_CP_required__c,Operator_A_certificate__c,Operator_B_certificate__c,Operator_C_certificate__c,Tank_Testing_Report__c,Is_Tank_Testing_Report_Required__c,Repair_Documents__c,Are_Repair_Documents_Required__c,Release_Detection_Report__c,Is_Release_Detection_Report_Required__c,Internal_Lining_Inspection__c,Is_IL_Inspection_Required__c,MGT_Paid_Service__c ,( Due_Date__c <= CURDATE()) as due_Date_c FROM customerportaldb.Account WHERE (((Facility_Operator_POA__c = 'Missing' OR Property_Owner_POA__c = 'Missing' OR UST_Owner_POA__c = 'Missing' OR Operator_Affidevit_of_Lease__c = 'Missing' OR Owner_Affidavit_Of_Lease__c = 'Missing' OR SOS_Status__c = 'Missing' OR Tax_ID_Information__c = 'Missing' or Letter_of_Networth_Certificate_of_INsure__c = 'Missing' or Operator_Lease_Agreement__c = 'Missing') AND  MGT_Paid_Service__c = true AND  Due_Date__c <= CURDATE() AND  Notification_form_Submitted__c is NULL) OR (((Line_and_Leak_Detector_Test__c is NULL AND  Is_LnL_Detr_Tst_requrd__c = TRUE) OR (Cathodic_Protection__c is NULL AND  Is_CP_required__c = TRUE)  OR Operator_A_certificate__c is NULL  OR Operator_B_certificate__c is NULL  OR Operator_C_certificate__c is NULL  OR (Tank_Testing_Report__c is NULL AND  Is_Tank_Testing_Report_Required__c = TRUE ) OR (Repair_Documents__c is NULL AND  Are_Repair_Documents_Required__c = TRUE) OR (Release_Detection_Report__c is NULL AND  Is_Release_Detection_Report_Required__c = TRUE) OR (Internal_Lining_Inspection__c is NULL AND  Is_IL_Inspection_Required__c = TRUE) ) AND  MGT_Paid_Service__c = true )) and  id =:facilitiesId",
					Account.class);

			query.setString("facilitiesId", facilitiesId);
			List lst = query.list();
			trx.commit();
			session.close();
			if (lst.size() > 0)
				return (Account) lst.get(0);
			return null;
		} catch (

		Exception exception)

		{
			
			exception.printStackTrace();
			System.out.println("Exception occred in fetchFacilitiesNotificationData method -- " + exception.getMessage());
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
					query = session.createNativeQuery("UPDATE Account a SET a."+fileuploadlabel+"='Received' WHERE a.Id =:facilityId");
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
//		List<String> facilitiesList = fetchFacilityId(username);
		List<Facilities> facilitiesList = fetchFacilities(username);
		List<Company> companiesList = fetchCompanyNames(username);
		for (Company company : companiesList) {
			List<Facilities> facilitiesListLocal = DBUtil.getInstance().fetchFacilitiesForCompany(company.getCompanyName(),company.getCompanyOwner());
			CustomerPortalUtil.getActualFacilitiesList(facilitiesListLocal);
			company.setFacilities(facilitiesListLocal);	
		}
		result.setFacilitiesList(facilitiesList);
		result.setCompaniesList(companiesList);
		return result;
	}
	
	public List<String> fetchFacilityId(String userId) {
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction(); 
		try {
			// Transaction t = session.beginTransaction();
			Query query = session.createNativeQuery(
					"select Facility__c FROM Facility_Management__c where Contact__c= '"
							+ userId + "'");
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
					"SELECT Company_Name__c,Company_Owner__c,Existing_Client__c,External_ID__c,Name,Owner_Name__c FROM affiliate_company__c where Company_Owner__c= '"+ userId + "'",
					Company.class);
			// Transaction t = session.beginTransaction();
//						Query query = session.createNativeQuery(
//								"SELECT Company_Name__c,Company_Owner__c,Existing_Client__c,External_ID__c,Name,Owner_Name__c FROM affiliate_company__c where Company_Owner__c='"
//										+ userId + "'",
//								Company.class);
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

	
	
}
