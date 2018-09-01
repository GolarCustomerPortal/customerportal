package com.customerportal.util;

import java.util.Base64;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.customerportal.bean.ChangePassword;
import com.customerportal.bean.Company;
import com.customerportal.bean.Contact;
import com.customerportal.bean.Fecilities;
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
			System.out.println("Exception occred while login: " + exception.getMessage());
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
			System.out.println("Exception occred while register: " + exception.getMessage());
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
			System.out.println("Exception occred while update: " + exception.getMessage());
			exception.printStackTrace();
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		}
	}

	public List<Fecilities> fetchFecilities(String userId) {
		// List<Fecilities> fecilitiesList = new ArrayList<Fecilities>();
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			Query query = session.createNativeQuery(
					"SELECT Company__c,Contact__c,External_ID__c,Facility_Address__c,Facility__c,FID__c,GOLARS_Project__c,Golars_Tank_Paid_Service__c,MGT_Project__c,Name,Operator_Company__c,OwnerId,PERC_Concentration__c,Property_Owner__c,State__c,Street__c,USSBOA_Paid_Service__c,UST_Owner_Company__c FROM Facility_Management__c where Contact__c= '"
							+ userId + "'",
					Fecilities.class);
			List lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (

		Exception exception)

		{
			System.out.println("Exception occred while fetchFecilities: " + exception.getMessage());
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
				query = session
						.createNativeQuery(
								"SELECT Email__c,Existing_Client__c,External_ID__c,FirstName,Id,LastName,MailingAddress,MailingCity,MailingCountry"
										+ ",MailingPostalCode,MailingState,MailingStreet,Member_ID__c,MiddleName,MobilePhone,Name,"
										+ "Phone,Phone__c,Profession__c,Salutation,Tax_ID__c,Title F"
										+ "ROM golarsdev.Contact c where c.FirstName LIKE :searchString",
								Contact.class);

			} else if (searchOption.equalsIgnoreCase("lname")) {
				query = session.createNativeQuery(
						"SELECT Email__c,Existing_Client__c,External_ID__c,FirstName,Id,LastName,MailingAddress,MailingCity,MailingCountry"
								+ ",MailingPostalCode,MailingState,MailingStreet,Member_ID__c,MiddleName,MobilePhone,Name,"
								+ "Phone,Phone__c,Profession__c,Salutation,Tax_ID__c,Title F"
								+ "ROM golarsdev.Contact c where c.LastName LIKE :searchString",
						Contact.class);
			}
			if (searchOption.equalsIgnoreCase("email")) {
				query = session.createNativeQuery(
						"SELECT Email__c,Existing_Client__c,External_ID__c,FirstName,Id,LastName,MailingAddress,MailingCity,MailingCountry"
								+ ",MailingPostalCode,MailingState,MailingStreet,Member_ID__c,MiddleName,MobilePhone,Name,"
								+ "Phone,Phone__c,Profession__c,Salutation,Tax_ID__c,Title F"
								+ "ROM golarsdev.Contact c where c.Email__c LIKE :searchString",
						Contact.class);
			}
			query.setString("searchString", "%" + searchString + "%");
			List<User> lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (Exception exception) {
			exception.printStackTrace();
			System.out.println("Exception occred while checkUserPresent for reset password: " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally {

		}
	}

	public List<Fecilities> getSpecificFecilitiesForUser(String userId, String fecilitiesType) {

		// List<Fecilities> fecilitiesList = new ArrayList<Fecilities>();
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			Query query = session.createNativeQuery(
					"SELECT Company__c,Contact__c,External_ID__c,Facility_Address__c,Facility__c,FID__c,GOLARS_Project__c,Golars_Tank_Paid_Service__c,MGT_Project__c,Name,"
							+ "Operator_Company__c,OwnerId,PERC_Concentration__c,Property_Owner__c,State__c,Street__c,USSBOA_Paid_Service__c,UST_Owner_Company__c "
							+ "FROM Facility_Management__c f where f.Contact__c =:userId and f.Golars_Tank_Paid_Service__c =:tankService",
					Fecilities.class);
			query.setString("userId", userId);
			if (fecilitiesType.equalsIgnoreCase("signed"))
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
			System.out.println("Exception occred while fetchFecilities: " + exception.getMessage());
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
		// List<Fecilities> fecilitiesList = new ArrayList<Fecilities>();
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			Query query = session.createNativeQuery(
					"SELECT Company_Name__c,Company_Owner__c,Existing_Client__c,External_ID__c,Name,Owner_Name__c FROM golarsdev.affiliate_company__c where Company_Owner__c= '0033600000M1YNjAAN'",
					Company.class);
//			query.setString("contactId", userId);
			List lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (

		Exception exception)

		{
			System.out.println("Exception occred while fetchCompanies: " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return null;
		} finally

		{

		}

	}

	public List<Fecilities> fetchComplianceFecilities(String userId) {

		// List<Fecilities> fecilitiesList = new ArrayList<Fecilities>();
		Session session = HibernateUtil.getSession();
		Transaction trx = session.beginTransaction();
		try {
			// Transaction t = session.beginTransaction();
			Query query = session.createNativeQuery(
					"SELECT Company__c,Contact__c,External_ID__c,Facility_Address__c,Facility__c,FID__c,GOLARS_Project__c,Golars_Tank_Paid_Service__c,MGT_Project__c,Name,Operator_Company__c,OwnerId,PERC_Concentration__c,Property_Owner__c,State__c,Street__c,USSBOA_Paid_Service__c,UST_Owner_Company__c FROM Facility_Management__c where Contact__c= '"
							+ userId + "'",
					Fecilities.class);
			List lst = query.list();
			trx.commit();
			session.close();
			return lst;
		} catch (

		Exception exception)

		{
			System.out.println("Exception occred while fetchFecilities: " + exception.getMessage());
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
			System.out.println("Exception occred while changePassword: " + exception.getMessage());
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
			System.out.println("Exception occred while changePassword: " + exception.getMessage());
			if (trx != null)
				trx.rollback();
			if (session != null)
				session.close();
			return false;
		}
	}

	public List<Fecilities> fetchFecilitiesForCompany(String companyName, String companyOwner) {
		// List<Fecilities> fecilitiesList = new ArrayList<Fecilities>();
				Session session = HibernateUtil.getSession();
				Transaction trx = session.beginTransaction();
				try {
					// Transaction t = session.beginTransaction();
					Query query = session.createNativeQuery(
							"SELECT Company__c,Contact__c,External_ID__c,Facility_Address__c,Facility__c,FID__c,GOLARS_Project__c,Golars_Tank_Paid_Service__c,MGT_Project__c,Name,"
									+ "Operator_Company__c,OwnerId,PERC_Concentration__c,Property_Owner__c,State__c,Street__c,USSBOA_Paid_Service__c,UST_Owner_Company__c "
									+ "FROM Facility_Management__c f where f.company__c =:companyName",
							Fecilities.class);
//					query.setString("userId", companyOwner);
					
						query.setString("companyName", companyName);
					List lst = query.list();
					trx.commit();
					session.close();
					return lst;
				} catch (

				Exception exception)

				{
					exception.printStackTrace();
					System.out.println("Exception occred while fetchFecilities: " + exception.getMessage());
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
