package com.customerportal.rest;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.customerportal.bean.ChangePassword;
import com.customerportal.bean.LoginHistory;
import com.customerportal.bean.User;
import com.customerportal.util.DBUtil;
import com.customerportal.util.MailUtil;

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
	public Response retrieveAllUsersWIthSearch(@QueryParam("userSearchOption") String searchOption,
			@QueryParam("userSearchString") String searchString) {

		List<User> userList = DBUtil.getInstance().getAllUsers(searchOption, searchString);
		return Response.status(201).entity(userList).build();
	}

	@GET
	@Path("/history")
	@Produces(MediaType.APPLICATION_JSON)
	public Response retrieveUserLoginHistory(@QueryParam("userId") String userId) {

		List<LoginHistory> userList = DBUtil.getInstance().getLoginHistory(userId);
		return Response.status(201).entity(userList).build();
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	public Response registerUser(User user) {
		User userobj = null;
		if (user.isEdit()) {
			userobj = DBUtil.getInstance().editUser(user);
		} else {
			userobj = DBUtil.getInstance().register(user);
		}
		if (userobj != null) {
			userobj.setFullName(userobj.getFirstName() + " " + userobj.getLastName());
			new MailUtil().sendEmail(userobj, user.isEdit());
		}
		return Response.status(201).entity(userobj).build();
	}

	@POST
	@Path("/changepassword")
	@Produces(MediaType.APPLICATION_JSON)

	public Response changePassword(ChangePassword changePasswordObj) {
		boolean result;
		if (changePasswordObj.isReset())
			result = DBUtil.getInstance().resetPassword(changePasswordObj);
		else
			result = DBUtil.getInstance().changePassword(changePasswordObj);

		return Response.status(201).entity(result).build();
	}

}