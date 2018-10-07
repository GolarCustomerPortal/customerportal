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

import com.customerportal.bean.Account;
import com.customerportal.bean.Company;
import com.customerportal.bean.Facilities;
import com.customerportal.bean.KeyValue;
import com.customerportal.bean.SearchResults;
import com.customerportal.util.CustomerPortalUtil;
import com.customerportal.util.DBUtil;

@Path("/dashboard")
public class DashBoardService {

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response dashboardContent(@QueryParam("userId") String userId) {
		Map<String, Object> resultMap= new HashMap<String,Object>();
		Map<String, Object> dashboardMap = new HashMap<String, Object>();
		List<Facilities> facilitiesList = DBUtil.getInstance().fetchFacilities(userId);
		int facilitiesSigned=0,facilitiesUnsigned=0;
		String facilitiesIdString = CustomerPortalUtil.getfacilitiesIdString(facilitiesList);
		if(facilitiesList != null){
		for (Facilities facilitiy : facilitiesList) {
			if(facilitiy!=null && facilitiy.getPaidService()!= null && facilitiy.getPaidService().equalsIgnoreCase("true"))
				facilitiesSigned++;
			else
				facilitiesUnsigned++;
			
		}
		}
		if(facilitiesIdString.endsWith(","))
			facilitiesIdString = facilitiesIdString.substring(0, facilitiesIdString.length()-1);
		dashboardMap.put("signed", facilitiesSigned);
		dashboardMap.put("unsigned", facilitiesUnsigned);
		resultMap.put("facilitiesData", dashboardMap);
		// companiesData
		dashboardMap = new HashMap<String, Object>();
		List<Company> companiesList = DBUtil.getInstance().fetchCompanies(userId);
		dashboardMap.put("companies", companiesList.size());
		resultMap.put("companiesData", dashboardMap);
		//compliance
		dashboardMap = new HashMap<String, Object>();
		int facilitiesCompliancesize = DBUtil.getInstance().fetchComplianceFacilities(userId,facilitiesIdString,"true");
		int facilitiesNonCompliancesize = DBUtil.getInstance().fetchComplianceFacilities(userId,facilitiesIdString,"false");
		dashboardMap.put("compliance", facilitiesCompliancesize);
		dashboardMap.put("noncompliance", facilitiesNonCompliancesize);
		resultMap.put("complianceData", dashboardMap);
		
		//consolidated report
		dashboardMap = new HashMap<String, Object>();
		
//		dashboardMap.put("midgrade", 150);
//		dashboardMap.put("premium", 310);
//		dashboardMap.put("diesel", 500);
		List<KeyValue> kvList  = new ArrayList<KeyValue>();
		if(facilitiesList != null)
		 kvList = DBUtil.getInstance().retrieveConsolidateReport(facilitiesList);
		
		resultMap.put("consolidateReportData", kvList);

		return Response.status(200).entity(resultMap).build();

	}
	
	@Path("facilitiesAndCompanies")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response getFacilitiesAndCompanies(@QueryParam("userId") String userId) {
		Map<String,  Object> resultMap= new HashMap<String,  Object>();
		Map<String, Object> dashboardMap = new HashMap<String, Object>();
		List<Facilities> facilitiesList = DBUtil.getInstance().fetchFacilities(userId);
		List<Facilities> signedFacilitiesList =  new ArrayList<Facilities>();
		List<Facilities> unSignedFacilitiesList =  new ArrayList<Facilities>();
		String facilitiesIdString = CustomerPortalUtil.getfacilitiesIdString(facilitiesList);
		if(facilitiesList != null){
		for (Facilities facilitiy : facilitiesList) {
			if(facilitiy.getPaidService()!= null && facilitiy.getPaidService().equalsIgnoreCase("true"))
				signedFacilitiesList.add(facilitiy);
			else
				unSignedFacilitiesList.add(facilitiy);
			
		}
		}
		if(facilitiesIdString.endsWith(","))
			facilitiesIdString = facilitiesIdString.substring(0, facilitiesIdString.length()-1);
		dashboardMap.put("signedList", signedFacilitiesList);
		dashboardMap.put("unsignedList", unSignedFacilitiesList);
		resultMap.put("facilitiesData", dashboardMap);
		// companiesData
		dashboardMap = new HashMap<String, Object>();
		List<Company> companiesList = DBUtil.getInstance().fetchCompanies(userId);
		dashboardMap.put("companiesList", companiesList);
		resultMap.put("companiesData", dashboardMap);
		//compliance
		dashboardMap = new HashMap<String, Object>();
		List<Facilities> complianceFacilitiesList = DBUtil.getInstance().fetchFacilitiesFCompliance(userId,"compliance");
		List<Facilities> nonComplianceFacilitiesList = DBUtil.getInstance().fetchFacilitiesFCompliance(userId,"noncompliance");
		dashboardMap.put("complianceList", complianceFacilitiesList);
		dashboardMap.put("noncomplianceList", nonComplianceFacilitiesList);
		resultMap.put("complianceData", dashboardMap);
		
		//consolidated report
		dashboardMap = new HashMap<String, Object>();
		 List<KeyValue> kvList  = DBUtil.getInstance().retrieveConsolidateReport(facilitiesList);
//		dashboardMap.put("regular", 200);
//		dashboardMap.put("midgrade", 150);
//		dashboardMap.put("premium", 310);
//		dashboardMap.put("diesel", 500);
		resultMap.put("consolidateReportData", kvList);

		return Response.status(200).entity(resultMap).build();

	}
	
	@Path("/facilities")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response facilitiesData(@QueryParam("userId") String userId,@QueryParam("facilitiesType") String facilitiesType) {
		List<Facilities> facilitiesList = DBUtil.getInstance().getSpecificFacilitiesForUser(userId,facilitiesType);
		if(facilitiesType.equalsIgnoreCase("signed"))
		CustomerPortalUtil.getActualFacilitiesList(facilitiesList);
		

		return Response.status(200).entity(facilitiesList).build();

	}
	@Path("/facility")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response facilityData(@QueryParam("userId") String userId,@QueryParam("facilityID") String facilityID) {
		List<Facilities> facilitiesList = DBUtil.getInstance().getSpecificFacility(userId,facilityID);
		CustomerPortalUtil.getActualFacilitiesList(facilitiesList);

		return Response.status(200).entity(facilitiesList).build();

	}
	
	@Path("/companies")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response companiesData(@QueryParam("userId") String userId) {
		List<Company> companiesList = DBUtil.getInstance().fetchCompanies(userId);
		for (Company company : companiesList) {
			List<Facilities> facilitiesList = DBUtil.getInstance().fetchFacilitiesForCompany(company.getCompanyName(),company.getCompanyOwner());
			CustomerPortalUtil.getActualFacilitiesList(facilitiesList);
			company.setFacilities(facilitiesList);	
		}
		return Response.status(200).entity(companiesList).build();

	}
	@Path("/company")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response companyData(@QueryParam("userId") String userId,@QueryParam("companyID") String companyID) {
		List<Company> companiesList = DBUtil.getInstance().fetchCompany(userId,companyID);
		for (Company company : companiesList) {
			List<Facilities> facilitiesList = DBUtil.getInstance().fetchFacilitiesForCompany(company.getCompanyName(),company.getCompanyOwner());
			CustomerPortalUtil.getActualFacilitiesList(facilitiesList);
			company.setFacilities(facilitiesList);	
		}
		return Response.status(200).entity(companiesList).build();

	}
	
	@Path("/compliance")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response complianceData(@QueryParam("userId") String userId,@QueryParam("facilitiesType") String facilitiesType) {
		List<Facilities> facilitiesList = DBUtil.getInstance().fetchFacilitiesFCompliance(userId,facilitiesType);
		CustomerPortalUtil.getActualFacilitiesList(facilitiesList);
		return Response.status(200).entity(facilitiesList).build();

	}
	
	@Path("/notificationdetails")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response complianceData(@QueryParam("facilitiesId") String facilitiesId) {
		Account account = DBUtil.getInstance().fetchFacilitiesNotificationData(facilitiesId);
		return Response.status(200).entity(account).build();

	}
	@GET
	@Path("/search")
	@Produces(MediaType.APPLICATION_JSON)
	public Response fetchSearchResults(@QueryParam("searchType") String searchType,@QueryParam("searchString") String searchString, @QueryParam("userId") String username,
			@QueryParam("isAdmin") boolean isadmin) {
			SearchResults result = DBUtil.getInstance().retrieveSearchResults(searchType,searchString,username, isadmin);

		return Response.status(200).entity(result).build();
	}


}