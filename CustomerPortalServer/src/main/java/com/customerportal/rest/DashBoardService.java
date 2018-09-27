package com.customerportal.rest;

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
import com.customerportal.bean.SearchResults;
import com.customerportal.util.CustomerPortalUtil;
import com.customerportal.util.DBUtil;

@Path("/dashboard")
public class DashBoardService {

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response dashboardContent(@QueryParam("userId") String userId) {
		Map<String, Map<String, Integer>> resultMap= new HashMap<String, Map<String,Integer>>();
		Map<String, Integer> dashboardMap = new HashMap<String, Integer>();
		List<Facilities> facilitiesList = DBUtil.getInstance().fetchFacilities(userId);
		int facilitiesSigned=0,facilitiesUnsigned=0;
		String facilitiesIdString = CustomerPortalUtil.getfacilitiesIdString(facilitiesList);
		if(facilitiesList != null){
		for (Facilities facilitiy : facilitiesList) {
			if(facilitiy.isTankPaidService())
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
		dashboardMap = new HashMap<String, Integer>();
		List<Company> companiesList = DBUtil.getInstance().fetchCompanies(userId);
		dashboardMap.put("companies", companiesList.size());
		resultMap.put("companiesData", dashboardMap);
		//compliance
		dashboardMap = new HashMap<String, Integer>();
		int facilitiesCompliancesize = DBUtil.getInstance().fetchComplianceFacilities(userId,facilitiesIdString,true);
		int facilitiesNonCompliancesize = DBUtil.getInstance().fetchComplianceFacilities(userId,facilitiesIdString,false);
		dashboardMap.put("compliance", facilitiesCompliancesize);
		dashboardMap.put("noncompliance", facilitiesNonCompliancesize);
		resultMap.put("complianceData", dashboardMap);
		
		//consolidated report
		dashboardMap = new HashMap<String, Integer>();
		dashboardMap.put("regular", 200);
		dashboardMap.put("midgrade", 150);
		dashboardMap.put("premium", 310);
		dashboardMap.put("diesel", 500);
		resultMap.put("consolidateReportData", dashboardMap);

		return Response.status(200).entity(resultMap).build();

	}
	
	@Path("/facilities")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response facilitiesData(@QueryParam("userId") String userId,@QueryParam("facilitiesType") String facilitiesType) {
		List<Facilities> facilitiesList = DBUtil.getInstance().getSpecificFacilitiesForUser(userId,facilitiesType);
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