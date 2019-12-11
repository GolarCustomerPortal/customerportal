package com.customerportal.rest;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.customerportal.bean.IncomeReportData;
import com.customerportal.bean.KeyValue;
import com.customerportal.bean.Settings;
import com.customerportal.bean.SiteExpenses;
import com.customerportal.bean.SiteIncome;
import com.customerportal.util.DBUtil;

@Path("/incomeExpenses")
public class IncomeExpensesService {
	
	@Path("/income")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces({ MediaType.APPLICATION_JSON })
	public Response saveIncome(SiteIncome siteIncome) {
		String result =  DBUtil.getInstance().saveSiteIncome(siteIncome);
		
		return Response.status(200).entity(result).build();

	}
	@Path("/income")
	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces({ MediaType.APPLICATION_JSON })
	public Response getIncomeChart(@QueryParam("userId")String userId, @QueryParam("facilityId")String facilityId,
			@QueryParam("startDate") Date startDate, @QueryParam("endDate") Date endDate, @QueryParam("chartType") String chartType) {
		List<KeyValue> result =  DBUtil.getInstance().getIncomeForUserByMonthly(userId,facilityId,startDate,endDate,chartType);
		
		return Response.status(200).entity(result).build();

	}
	@Path("/income")
	@DELETE
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces({ MediaType.APPLICATION_JSON })
	public Response deleteIncomeRecord(@QueryParam("incomeId")int incomeId,@QueryParam("userId")String userId, @QueryParam("facilityId")String facilityId) {
		List<SiteIncome> result =  DBUtil.getInstance().deleteIncomeRecord(incomeId,userId,facilityId);
		return Response.status(200).entity(result).build();

	}
	@Path("/income/type")
	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces({ MediaType.APPLICATION_JSON })
	public Response getIncomeChartByType(@QueryParam("userId")String userId, @QueryParam("facilityId")String facilityId,
			@QueryParam("startDate") Date startDate, @QueryParam("endDate") Date endDate, @QueryParam("chartType") String chartType) {
		List<IncomeReportData> result =  DBUtil.getInstance().getIncomeForUserByType(userId,facilityId,startDate,endDate,chartType);
		
		return Response.status(200).entity(result).build();

	}
	@Path("/income/detail")
	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces({ MediaType.APPLICATION_JSON })
	public Response getIncomeForCustomDate(@QueryParam("userId")String userId, @QueryParam("facilityId")String facilityId,
			@QueryParam("startDate") Date startDate, @QueryParam("endDate") Date endDate) {
		List<SiteIncome> result =  DBUtil.getInstance().getIncomeForUserByCustomDate(userId,facilityId,startDate,endDate);
		
		return Response.status(200).entity(result).build();

	}
	@Path("/income/pickList")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces({ MediaType.APPLICATION_JSON })
	public Response saveIncomePickList(HashMap<String, String> incomePickListValues) {
		boolean result =  DBUtil.getInstance().saveIncomePickList("incomePickList",incomePickListValues.get("value"));
		return Response.status(200).entity(result).build();

	}
	
	@Path("/income/pickList")
	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces({ MediaType.APPLICATION_JSON })
	public Response getIncomePickList() {
		Settings result =  DBUtil.getInstance().retrieveUserPreferences("incomePickList");
		List<String> resultList = new ArrayList<String>();
		if(result.getValue() !=null && result.getValue().length()>0) {
		String str[] = result.getValue().split("-@-@-@-@-");
		resultList = Arrays.asList(str);
		}			
		resultList= new ArrayList<>(resultList);
		resultList.remove("Others");
		resultList.add("Others");
		return Response.status(200).entity(resultList).build();

	}
	@Path("/expenses")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces({ MediaType.APPLICATION_JSON })
	public Response saveExpenses(SiteExpenses siteExpenses) {
		String result =  DBUtil.getInstance().saveSiteExpenses(siteExpenses);
		
		return Response.status(200).entity(result).build();

	}
	
	@Path("/expenses")
	@DELETE
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces({ MediaType.APPLICATION_JSON })
	public Response DeleteExpenses(@QueryParam("incomeId")int incomeId,@QueryParam("userId")String userId, @QueryParam("facilityId")String facilityId) {
		List<SiteExpenses> result =  DBUtil.getInstance().deleteExpensesRecord(incomeId,userId,facilityId);
		return Response.status(200).entity(result).build();

	}

	@Path("/expenses")
	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces({ MediaType.APPLICATION_JSON })
	public Response getExpensesForYear(@QueryParam("userId")String userId, @QueryParam("facilityId")String facilityId,
			@QueryParam("startDate") Date startDate, @QueryParam("endDate") Date endDate) {
		List<KeyValue> result =  new ArrayList<>();
			result = DBUtil.getInstance().getExpensesForUserForYear(userId,facilityId,startDate,endDate);
		return Response.status(200).entity(result).build();

	}
	@Path("/expenses/detail")
	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces({ MediaType.APPLICATION_JSON })
	public Response getExpensesForSpecificDate(@QueryParam("userId")String userId, @QueryParam("facilityId")String facilityId,
			@QueryParam("startDate") Date startDate, @QueryParam("endDate") Date endDate) {
		List<SiteExpenses> result =  new ArrayList<>();
			result = DBUtil.getInstance().getExpensesForUserForCustomDate(userId,facilityId,startDate,endDate);
		return Response.status(200).entity(result).build();

	}

}