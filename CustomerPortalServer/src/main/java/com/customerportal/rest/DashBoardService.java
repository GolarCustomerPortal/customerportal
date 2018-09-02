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

import com.customerportal.bean.Companies;
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
		String fecilitiesIdString = "";
		if(fecilitiesList != null){
		for (Fecilities fecilitiy : fecilitiesList) {
			fecilitiesIdString += "'"+fecilitiy.getFecilityId()+"',";
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
	@Path("/fecilities")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response fecilitiesData(@QueryParam("userId") String userId,@QueryParam("fecilitiesType") String fecilitiesType) {
		List<Fecilities> fecilitiesList = DBUtil.getInstance().getSpecificFecilitiesForUser(userId,fecilitiesType);
//		List<Fecilities> fecilitiesList = new ArrayList<Fecilities>();
//		for (int i = 0; i < 10; i++) {
//			Fecilities fecilities = new Fecilities();
//			fecilities.setName("Fecilities Name "+i);
//			fecilities.setCompany("company "+i);
//			fecilities.setAddress("address "+i);
//			fecilities.setContact(" contact "+i);
//			fecilities.setFid("fid "+i);
//			fecilities.setTankPaidService(false);
//			fecilities.setState("state "+i);
//			fecilities.setStreet("street "+i);
//			fecilities.setZip("zip "+i);
//			fecilities.setPaidService(true);
//			fecilitiesList.add(fecilities);
//		}

		return Response.status(200).entity(fecilitiesList).build();

	}
	@Path("/companies")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response companiesData(@QueryParam("userId") String userId) {
/*		List<Companies> companiesList = new ArrayList<Companies>();
		for (int index = 0; index < 10; index++) {
			Companies companies = new Companies();
			companies.setName("companies "+index);
		
		List<Fecilities> fecilitiesList = new ArrayList<Fecilities>();
		for (int i = 0; i < 10; i++) {
			Fecilities fecilities = new Fecilities();
			fecilities.setName("Fecilities Name "+i);
			fecilities.setCompany("company "+i);
			fecilities.setAddress("address "+i);
			fecilities.setContact(" contact "+i);
			fecilities.setFid("fid "+i);
			fecilities.setTankPaidService(false);
			fecilities.setState("state "+i);
			fecilities.setStreet("street "+i);
			fecilities.setZip("zip "+i);
			fecilities.setPaidService(true);
			fecilitiesList.add(fecilities);
		}
		companies.setFecilities(fecilitiesList);
		companiesList.add(companies);
		}*/
		List<Company> companiesList = DBUtil.getInstance().fetchCompanies(userId);
		for (Company company : companiesList) {
			
			List<Fecilities> fecilitiesList = DBUtil.getInstance().fetchFecilitiesForCompany(company.getCompanyName(),company.getCompanyOwner());
			company.setFecilities(fecilitiesList);	
			
		}
		return Response.status(200).entity(companiesList).build();

	}
	
	@Path("/compliance")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response complianceData(@QueryParam("userId") String userId,@QueryParam("fecilitiesType") String fecilitiesType) {
		List<Fecilities> fecilitiesList = new ArrayList<Fecilities>();
		for (int i = 0; i < 30; i++) {
			Fecilities fecilities = new Fecilities();
			fecilities.setName("Fecilities Name "+i);
			fecilities.setCompany("company "+i);
			fecilities.setAddress("address "+i);
			fecilities.setContact(" contact "+i);
			fecilities.setFid("fid "+i);
			fecilities.setTankPaidService(false);
			fecilities.setState("state "+i);
			fecilities.setStreet("street "+i);
			fecilities.setZip("zip "+i);
			fecilities.setPaidService(true);
			fecilitiesList.add(fecilities);
		}

		return Response.status(200).entity(fecilitiesList).build();

	}


}