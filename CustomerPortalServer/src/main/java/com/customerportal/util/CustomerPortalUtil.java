package com.customerportal.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import com.customerportal.bean.Facilities;
import com.customerportal.bean.KeyValue;
import com.customerportal.bean.TankMonitorSignup;
import com.customerportal.bean.User;

public class CustomerPortalUtil {
	static Properties imageProperties = new Properties();

	private static void fetchURLProperties() {
		if (imageProperties != null && imageProperties.size() > 0)
			return;
		try {
			imageProperties.load(CustomerPortalFileUpload.class.getResourceAsStream("/imageURL.properties"));
		} catch (Exception e1) {
			System.out.println("url.properties file not found" + e1.getMessage());
		}
	}

	public static void getActualFacilitiesList(List<Facilities> facilitiesList, String userId) {
		User user = DBUtil.getInstance().getSpecificUser(userId);
		String facilitiesIdString = getfacilitiesIdString(facilitiesList);
		List<Facilities> notificationFormList = DBUtil.getInstance().facilityNotificationFormList(facilitiesIdString);
		List<Facilities> complianceList = DBUtil.getInstance().facilityComplianceList(facilitiesIdString);
		List<Facilities> certificationList = DBUtil.getInstance().facilityCertificationList(facilitiesIdString);
		if (facilitiesList != null)
			for (Facilities facility : facilitiesList) {
				if (facility == null)
					continue;
				List<KeyValue> kvList = new ArrayList<KeyValue>();
				if (facilitiesList != null && user != null && !user.isAdmin())
					kvList = DBUtil.getInstance().retrieveSpecifiFacilityConsolidateReport(facility);
				facility.setConsolidateReport(kvList);
				if (notificationFormList.contains(facility.getFacilityId())) {
					facility.setNotificationFormButtonEnable("true");
				} else
					facility.setNotificationFormButtonEnable("false");
				if (complianceList.contains(facility.getFacilityId()))
					facility.setComplianceButtonEnable("true");
				else
					facility.setCertificationButtonEnable("false");
				if (certificationList.contains(facility.getFacilityId()))
					facility.setCertificationButtonEnable("true");
				else
					facility.setCertificationButtonEnable("false");

			}
	}

	public static String getfacilitiesIdString(List<Facilities> facilitiesList) {
		String facilitiesIdString = "";
		if (facilitiesList != null) {
			for (Facilities facilitiy : facilitiesList) {
				if (facilitiy != null && facilitiy.getFacilityId() != null)
					facilitiesIdString += "'" + facilitiy.getFacilityId() + "',";
			}
		}
		if (facilitiesIdString.endsWith(","))
			facilitiesIdString = facilitiesIdString.substring(0, facilitiesIdString.length() - 1);
		return facilitiesIdString;
	}

	public static void fillImageURL(List<Facilities> lst) {
		fetchURLProperties();
		String contextpath = imageProperties.getProperty("contextPath");
		for (Facilities facility : lst) {
			if (facility == null)
				continue;
			String imageURL = "/" + contextpath + "/images/gasstation/not_found_logo.png";
			if (facility.getBrand() != null) {
				String brand = facility.getBrand().replace(" ", "_");
				String brandURL = imageProperties.getProperty(brand);
				brandURL = brandURL == null ? "not_found_logo.png" : brandURL;
				imageURL = "/" + contextpath + "/images/gasstation/" + imageProperties.getProperty(brand);
			}
			if(facility.getTankPaidService().equalsIgnoreCase("false")){
				facility.setFacilityTankPaidMessage(imageProperties.getProperty("facilityTankPaidMessage"));
			}
			facility.setImageURL(imageURL);
		}

	}

	public static void writeTankMonitorDetailsIntoFile(List<TankMonitorSignup> tankMonitorSignup) {
		try {
			fetchURLProperties();
			String filePath = DBUtil.getInstance().getUserPreferences("tankMonitorPath");
			if (filePath == null)
				filePath = imageProperties.getProperty("defultTankMonitorPath");
			File fout = new File(filePath + "\\" + imageProperties.getProperty("tankMonitorFile"));
			if (!fout.exists())

				fout.createNewFile();

			FileOutputStream fos = new FileOutputStream(fout);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(fos));

			for (int i = 0; i < tankMonitorSignup.size(); i++) {
				bw.write(tankMonitorSignup.get(i).getIpAddress() + " " + tankMonitorSignup.get(i).getFid());
				bw.newLine();
			}

			bw.close();
		} catch (IOException exception) {
			System.out.println("Exception occred in getUserPreferences   method --" + exception.getMessage());
		}
	}

	public static List<Facilities> remoteDuplicateRecords(List<Facilities> lst) {
		List<Facilities> result = new ArrayList<Facilities>();
		for (Facilities facilities : lst) {
			boolean found = false;
			for (Facilities resFec : result) {
				if (resFec.getFacilityId().equalsIgnoreCase(facilities.getFacilityId())) {
					found = true;
					break;
				}
			}
			if (!found)
				result.add(facilities);

		}
		return result;
	}
	public static  int getMilliSeconds(String schedule) {
		if (schedule == null || schedule.equalsIgnoreCase("") || schedule.equalsIgnoreCase("0"))
			return 0;
		String[] minArray = schedule.split(":");
		int milliseconds = 0;
		milliseconds = Integer.parseInt(minArray[0]) * 60 * 60;
		milliseconds += Integer.parseInt(minArray[1]) * 60;
		return milliseconds * 1000;

	}

	public static Date atStartOfDay(Date date) {
		LocalDateTime localDateTime = dateToLocalDateTime(date);
		LocalDateTime endOfDay = localDateTime.with(LocalTime.MIN);
		return localDateTimeToDate(endOfDay);
	}
	
	public static Date atEndOfDay(Date date) {
		LocalDateTime localDateTime = dateToLocalDateTime(date);
		LocalDateTime endOfDay = localDateTime.with(LocalTime.MAX);
		return localDateTimeToDate(endOfDay);
	}

	private static LocalDateTime dateToLocalDateTime(Date date) {
		return LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());
	}

	private static Date localDateTimeToDate(LocalDateTime localDateTime) {
		return Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
	}

}
