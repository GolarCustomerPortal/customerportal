package com.customerportal.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.customerportal.bean.User;
import com.customerportal.util.DBUtil;

@Path("/login")
public class LoginService {

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces({ MediaType.APPLICATION_JSON })
	public Response login(User user) {
		boolean isLoginSuccess = false;
		String username = user.getUsername();
		String password = user.getPassword();
		User response = new User();
		if(username == null || password == null){
			response.setLoginsuccess(isLoginSuccess);
			return Response.status(403).entity(response).build();
		}
		User userRes =  DBUtil.getInstance().login(username, password);
		
		if(userRes !=null){// login successful
			userRes.setFullName(userRes.getFirstName()+" "+userRes.getLastName());
		}
//		response.setLoginsuccess(true);
//
//		response.setAdmin(userRes.isAdmin());
////		response.setNewlyCreated(userRes.isNewlyCreated());
//		response.setImageContent(userRes.getImageContent());
//		response.setUsername(userRes.getUsername());
//		response.setFullName(userRes.getFirstName()+" "+userRes.getLastName());
//		response.setToken(new TokenGenerator().generateToken(username));
//		}else{
//			if(userRes!=null && !userRes.isActive()){
//				response.setActive(false);
//			}
//		}

		return Response.status(200).entity(userRes).build();

	}

}