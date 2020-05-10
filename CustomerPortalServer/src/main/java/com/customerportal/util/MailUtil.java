package com.customerportal.util;

import java.io.FileInputStream;
import java.text.DateFormat;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.io.IOUtils;

import com.customerportal.bean.User;

public class MailUtil {
	public static void main(String[] args) {

		User user = new User();
		user.setFirstName("Srinivasa");
		user.setLastName("Reddy");
		user.setUsername("test");
		user.setPassword("test");
		user.setEmailAddress("avsrinivasa3@gmail.com,avsrinivasa@gmail.com");
		new MailUtil().sendEmailWithContent("avsrinivasa@gmail.com","c:\\test\\InventoryReport_20200427211532.txt","I20100","inventory",null);

	}

	static Properties emailProperties = new Properties();
	private static final String MAIL_SPLIT="golars+";

	Message fetchEmailProperties(boolean isAddCC) {

		try {
			Class<MailUtil> cl = MailUtil.class;

			emailProperties.load(cl.getResourceAsStream("/emailconfig.properties"));
		} catch (Exception e1) {
			System.out.println("Email Configuration fiele not found" + e1.getMessage());
		}
		final String username = emailProperties.getProperty("username");
		final String password = new String(Base64.getDecoder().decode(emailProperties.getProperty("password").getBytes())).replace(MAIL_SPLIT, "");
		
		String fromAddress = emailProperties.getProperty("from.address");

		Properties props = new Properties();
		props.put("mail.smtp.auth", emailProperties.get("mail.smtp.auth"));
		props.put("mail.smtp.starttls.enable", emailProperties.get("mail.smtp.starttls.enable"));
		props.put("mail.smtp.host", emailProperties.getProperty("mail.smtp.host"));
		props.put("mail.smtp.port", emailProperties.getProperty("mail.smtp.port"));
		props.put("mail.debug", emailProperties.getProperty("mail.debug"));

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		Message message = new MimeMessage(session);
		try {

			message.setFrom(new InternetAddress(fromAddress));
			if(isAddCC)
				message.setRecipients(Message.RecipientType.CC, InternetAddress.parse(fromAddress));
		} catch (MessagingException e) {
			System.out.println("Exception occured during mail send --" + e.getMessage());
		}
		return message;
	}

	public void sendEmail(User userobj, boolean isEdit) {

		try {
			Message message = fetchEmailProperties(false);
			if(emailProperties.getProperty("sendEmail").equalsIgnoreCase("false")){
				System.out.println("Sending Email is disabled. To enable change 'sendEmail' property value to true in emailconfig.properties and restart the server");
				return;
			}
			
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userobj.getEmailAddress()));
			String messageText = "";
//			if (isEdit)
//				messageText = emailProperties.getProperty("editEmail")+"<p>Please use <a href='"
//						+ emailProperties.get("baseURL") + "'>link</a> to login. </p>";
//			else
				messageText = MessageFormat.format(emailProperties.getProperty("registerEmail"),new Object[] {userobj.getFirstName()+" "+userobj.getLastName(),emailProperties.getProperty("baseURL"),userobj.getUsername(),new String(Base64.getDecoder().decode(userobj.getPassword().getBytes())) });;

//			messageText += "<p>Below are the login details: </p>" + "<p>username: " + userobj.getUsername() + "</p>"
//					+ "<p>password: " + new String(Base64.getDecoder().decode(userobj.getPassword().getBytes()))
//					+ "</p>";
			message.setContent(messageText, "text/html");
			message.setSubject(emailProperties.getProperty("mailsubject", "Welcome to Golars Tank"));

			Transport.send(message);

			System.out.println("Mail sent succesfully to : " + userobj.getEmailAddress());

		} catch (MessagingException e) {
			System.out.println("Exception occured during mail send --" + e.getMessage());
		}
	}

	public void sendforgotPasswordEmail(String toAddress, String username, String link) {
		try {
			Message message = fetchEmailProperties(false);

			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toAddress));
			String messageText = "<h4> Golars 360 </h4>Reset Password <p>Please use the <a href=" + link + "?username="
					+ username + ">link</a> to reset password ";
			message.setContent(messageText, "text/html; charset=utf-8");
			message.setSubject("Golars 360 Reset Password");

			Transport.send(message);

			System.out.println("Mail sent succesfully to : " + toAddress);

		} catch (MessagingException e) {
			System.out.println("Exception occured during mail send --" + e.getMessage());
		}

	}
	private Date yesterday() {
	    final Calendar cal = Calendar.getInstance();
	    cal.add(Calendar.DATE, -1);
	    return cal.getTime();
	}
	public void sendEmailWithContent(String toAddress, String filename,String keycode, String type, User user) {
		try {
			Message message = fetchEmailProperties(true);

			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toAddress));
			
			FileInputStream fileContnt;
			try {
				fileContnt = new FileInputStream(filename);
				String fileContntString = IOUtils.toString(fileContnt, "UTF-8");
				if(fileContntString !=null && fileContntString.length()>0 && keycode !=null)
				fileContntString = fileContntString.replaceAll(keycode, "");
				String messageText = "<html><body style='font-size:6px;'><pre>"+fileContntString+"</pre></body></html>";
				DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
				if (type.equalsIgnoreCase("inventory"))
					message.setSubject("Inventory Report for the date "+dateFormat.format(yesterday()));
				else
					message.setSubject("Tank Alarm (Priority) for the date "+dateFormat.format(yesterday()));
					
				message.setContent(messageText, "text/html; charset=utf-8");
				Transport.send(message);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("sendEmailWithAttachment failure "+e.getMessage());
				return;
			} 
			System.out.println("Mail sent succesfully to : " + toAddress);

		} catch (MessagingException e) {
			System.out.println("Exception occured during mail send --" + e.getMessage());
		}

	}

	public void bulkImportEmail(User userobj, int totalURLCount) {
		try {
			Message message = fetchEmailProperties(false);

			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userobj.getEmailAddress()));
			String messageText = "";

			messageText = "<p>Bulk documents import completed successfully. Total documents imported are :"
					+ totalURLCount + " </p>";

			message.setContent(messageText, "text/html");
			message.setSubject("Bulk documents import completed successfully");

			Transport.send(message);

			System.out.println("Mail sent succesfully to : " + userobj.getEmailAddress());

		} catch (MessagingException e) {
			System.out.println("Exception occured during mail send --" + e.getMessage());
		}

	}
}
