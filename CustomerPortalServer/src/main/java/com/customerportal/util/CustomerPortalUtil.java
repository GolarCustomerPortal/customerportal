package com.customerportal.util;

import java.util.List;

import com.customerportal.bean.Facilities;
import com.customerportal.bean.KeyValue;

public class CustomerPortalUtil {
	public static void getActualFacilitiesList(List<Facilities> facilitiesList) {
		String facilitiesIdString = getfacilitiesIdString(facilitiesList);
		List<Facilities> notificationFormList = DBUtil.getInstance().facilityNotificationFormList(facilitiesIdString);
		List<Facilities> complianceList = DBUtil.getInstance().facilityComplianceList(facilitiesIdString);
		List<Facilities> certificationList = DBUtil.getInstance().facilityCertificationList(facilitiesIdString);
		if(facilitiesList != null)
		for (Facilities facility : facilitiesList) {
			if(facility == null)continue;
			List<KeyValue> keyValue = DBUtil.getInstance().retrieveSpecifiFacilityConsolidateReport(facility);
			facility.setConsolidateReport(keyValue);
			if(notificationFormList.contains(facility.getFacilityId())){
				facility.setNotificationFormButtonEnable("true");
			}else
				facility.setNotificationFormButtonEnable("false");
			if(complianceList.contains(facility.getFacilityId()))
				facility.setComplianceButtonEnable("true");
			else
				facility.setCertificationButtonEnable("false");
			if(certificationList.contains(facility.getFacilityId()))
				facility.setCertificationButtonEnable("true");
			else
				facility.setCertificationButtonEnable("false");
			
		}
	}
	public static String getfacilitiesIdString(List<Facilities> facilitiesList) {
		String facilitiesIdString = "";
		if(facilitiesList != null){
		for (Facilities facilitiy : facilitiesList) {
			if(facilitiy!=null && facilitiy.getFacilityId()!=null)
			facilitiesIdString += "'"+facilitiy.getFacilityId()+"',";
		}
		}
		if(facilitiesIdString.endsWith(","))
			facilitiesIdString = facilitiesIdString.substring(0, facilitiesIdString.length()-1);
		return facilitiesIdString;
	}
}
