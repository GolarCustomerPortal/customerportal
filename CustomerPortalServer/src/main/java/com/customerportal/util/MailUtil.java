package com.customerportal.util;

import java.text.MessageFormat;
import java.util.Base64;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.customerportal.bean.User;

public class MailUtil {
	public static void main(String[] args) {

		User user = new User();
		user.setFirstName("Srinivasa");
		user.setLastName("Reddy");
		user.setUsername("test");
		user.setPassword("test");
		user.setEmailAddress("avsrinivasa3@gmail.com,avsrinivasa@gmail.com");
		new MailUtil().sendEmail(user, false);

	}

	static Properties emailProperties = new Properties();

	Message fetchEmailProperties() {

		try {
			Class<MailUtil> cl = MailUtil.class;

			emailProperties.load(cl.getResourceAsStream("/emailconfig.properties"));
		} catch (Exception e1) {
			System.out.println("Email Configuration fiele not found" + e1.getMessage());
		}
		final String username = emailProperties.getProperty("username");
		final String password = emailProperties.getProperty("password");
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
		} catch (MessagingException e) {
			System.out.println("Exception occured during mail send --" + e.getMessage());
		}
		return message;
	}

	public void sendEmail(User userobj, boolean isEdit) {

		try {
			Message message = fetchEmailProperties();
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
			Message message = fetchEmailProperties();

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

	public void bulkImportEmail(User userobj, int totalURLCount) {
		try {
			Message message = fetchEmailProperties();

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
