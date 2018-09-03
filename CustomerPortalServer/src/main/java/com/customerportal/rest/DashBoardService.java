package com.customerportal.rest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.customerportal.bean.Company;
import com.customerportal.bean.Fecilities;
import com.customerportal.util.DBUtil;

@Path("/dashboard")
public class DashBoardService {

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response dashboardContent(@QueryParam("userId") String userId) {
		Map<String, Map<String, Integer>> resultMap= new HashMap<String, Map<String,Integer>>();
		//fecilities data
		Map<String, Integer> dashboardMap = new HashMap<String, Integer>();
		List<Fecilities> fecilitiesList = DBUtil.getInstance().fetchFecilities(userId);
		int fecilitiesSigned=0,fecilitiesUnsigned=0;
		String fecilitiesIdString = getFecilitiesIdString(fecilitiesList);
		if(fecilitiesList != null){
		for (Fecilities fecilitiy : fecilitiesList) {
			if(fecilitiy.isTankPaidService())
				fecilitiesSigned++;
			else
				fecilitiesUnsigned++;
			
		}
		}
		if(fecilitiesIdString.endsWith(","))
			fecilitiesIdString = fecilitiesIdString.substring(0, fecilitiesIdString.length()-1);
		dashboardMap.put("signed", fecilitiesSigned);
		dashboardMap.put("unsigned", fecilitiesUnsigned);
		resultMap.put("fecilitiesData", dashboardMap);
		// companiesData
		dashboardMap = new HashMap<String, Integer>();
		List<Company> companiesList = DBUtil.getInstance().fetchCompanies(userId);
		dashboardMap.put("companies", companiesList.size());
		resultMap.put("companiesData", dashboardMap);
		//compliance
		dashboardMap = new HashMap<String, Integer>();
		int fecilitiesCompliancesize = DBUtil.getInstance().fetchComplianceFecilities(userId,fecilitiesIdString,true);
		int fecilitiesNonCompliancesize = DBUtil.getInstance().fetchComplianceFecilities(userId,fecilitiesIdString,false);
		dashboardMap.put("compliance", fecilitiesCompliancesize);
		dashboardMap.put("noncompliance", fecilitiesNonCompliancesize);
		resultMap.put("complianceData", dashboardMap);
		
		//consolidated report
		dashboardMap = new HashMap<String, Integer>();
		dashboardMap.put("regular", 20);
		dashboardMap.put("midgrade", 15);
		dashboardMap.put("premium", 10);
		dashboardMap.put("diesel", 5);
		resultMap.put("consolidateReportData", dashboardMap);

		return Response.status(200).entity(resultMap).build();

	}
	private String getFecilitiesIdString(List<Fecilities> fecilitiesList) {
		String fecilitiesIdString = "";
		if(fecilitiesList != null){
		for (Fecilities fecilitiy : fecilitiesList) {
			fecilitiesIdString += "'"+fecilitiy.getFecilityId()+"',";
		}
		}
		if(fecilitiesIdString.endsWith(","))
			fecilitiesIdString = fecilitiesIdString.substring(0, fecilitiesIdString.length()-1);
		return fecilitiesIdString;
	}
	@Path("/fecilities")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response fecilitiesData(@QueryParam("userId") String userId,@QueryParam("fecilitiesType") String fecilitiesType) {
		List<Fecilities> fecilitiesList = DBUtil.getInstance().getSpecificFecilitiesForUser(userId,fecilitiesType);
		getActualFecilitiesList(fecilitiesList);

		return Response.status(200).entity(fecilitiesList).build();

	}
	private void getActualFecilitiesList(List<Fecilities> fecilitiesList) {
		String fecilitiesIdString = getFecilitiesIdString(fecilitiesList);
		List<Fecilities> notificationFormList = DBUtil.getInstance().fecilityNotificationFormList(fecilitiesIdString);
		List<Fecilities> complianceList = DBUtil.getInstance().fecilityComplianceList(fecilitiesIdString);
		List<Fecilities> certificationList = DBUtil.getInstance().fecilityCertificationList(fecilitiesIdString);
		
		for (Fecilities fecilities : fecilitiesList) {
			if(notificationFormList.contains(fecilities.getFecilityId())){
				fecilities.setNotificationFormButtonEnable(true);
			}else
				fecilities.setNotificationFormButtonEnable(false);
			if(complianceList.contains(fecilities.getFecilityId()))
				fecilities.setComplianceButtonEnable(true);
			else
				fecilities.setCertificationButtonEnable(false);
			if(certificationList.contains(fecilities.getFecilityId()))
				fecilities.setCertificationButtonEnable(true);
			else
				fecilities.setCertificationButtonEnable(false);
			
		}
	}
	@Path("/companies")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response companiesData(@QueryParam("userId") String userId) {
		List<Company> companiesList = DBUtil.getInstance().fetchCompanies(userId);
		for (Company company : companiesList) {
			List<Fecilities> fecilitiesList = DBUtil.getInstance().fetchFecilitiesForCompany(company.getCompanyName(),company.getCompanyOwner());
			getActualFecilitiesList(fecilitiesList);
			company.setFecilities(fecilitiesList);	
		}
		return Response.status(200).entity(companiesList).build();

	}
	
	@Path("/compliance")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response complianceData(@QueryParam("userId") String userId,@QueryParam("fecilitiesType") String fecilitiesType) {
		List<Fecilities> fecilitiesList = DBUtil.getInstance().fetchFecilitiesFCompliance(userId,fecilitiesType);
		getActualFecilitiesList(fecilitiesList);
		return Response.status(200).entity(fecilitiesList).build();

	}


}