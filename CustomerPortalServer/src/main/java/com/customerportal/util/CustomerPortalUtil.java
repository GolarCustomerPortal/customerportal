package com.customerportal.util;

import java.util.List;

import com.customerportal.bean.Facilities;

public class CustomerPortalUtil {
	public static void getActualFacilitiesList(List<Facilities> facilitiesList) {
		String facilitiesIdString = getfacilitiesIdString(facilitiesList);
		List<Facilities> notificationFormList = DBUtil.getInstance().facilityNotificationFormList(facilitiesIdString);
		List<Facilities> complianceList = DBUtil.getInstance().facilityComplianceList(facilitiesIdString);
		List<Facilities> certificationList = DBUtil.getInstance().facilityCertificationList(facilitiesIdString);
		if(facilitiesList != null)
		for (Facilities facilities : facilitiesList) {
			if(notificationFormList.contains(facilities.getFacilityId())){
				facilities.setNotificationFormButtonEnable(true);
			}else
				facilities.setNotificationFormButtonEnable(false);
			if(complianceList.contains(facilities.getFacilityId()))
				facilities.setComplianceButtonEnable(true);
			else
				facilities.setCertificationButtonEnable(false);
			if(certificationList.contains(facilities.getFacilityId()))
				facilities.setCertificationButtonEnable(true);
			else
				facilities.setCertificationButtonEnable(false);
			
		}
	}
	public static String getfacilitiesIdString(List<Facilities> facilitiesList) {
		String facilitiesIdString = "";
		if(facilitiesList != null){
		for (Facilities facilitiy : facilitiesList) {
			facilitiesIdString += "'"+facilitiy.getFacilityId()+"',";
		}
		}
		if(facilitiesIdString.endsWith(","))
			facilitiesIdString = facilitiesIdString.substring(0, facilitiesIdString.length()-1);
		return facilitiesIdString;
	}
}
