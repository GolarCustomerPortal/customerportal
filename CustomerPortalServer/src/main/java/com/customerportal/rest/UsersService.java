package com.customerportal.rest;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.customerportal.bean.User;
import com.customerportal.util.DBUtil;

@Path("/users")
public class UsersService {

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response retrieveAllUsers() {

		List<User> userList = DBUtil.getInstance().getAllUsers();
		return Response.status(201).entity(userList).build();
	}
	@GET
	@Path("/search")
	@Produces(MediaType.APPLICATION_JSON)
	public Response retrieveAllUsersWIthSearch(@QueryParam("searchOption") String searchOption,@QueryParam("searchString") String searchString) {

		List<User> userList = DBUtil.getInstance().getAllUsers(searchOption,searchString);
		return Response.status(201).entity(userList).build();
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	public Response registerUser(User user) {
		boolean result =false;
		User userobj = null; 
		if(user.isEdit()){
			userobj	=DBUtil.getInstance().editUser(user);
		}else{
			userobj = DBUtil.getInstance().register(user);
		}
//		if(userobj!=null){
			result=true;
			if(userobj!=null){
				userobj.setFullName(userobj.getFirstName()+" "+userobj.getLastName());
			}
//			new MailUtil().sendEmail(userobj,user.isEdit());
//		}
		return Response.status(201).entity(userobj).build();
	}
	
		

}