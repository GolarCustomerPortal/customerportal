package com.customerportal.rest;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.customerportal.bean.KeyValue;
import com.customerportal.util.CustomerPortalFileUpload;
import com.sun.jersey.multipart.FormDataBodyPart;
import com.sun.jersey.multipart.FormDataParam;

@Path("/import")
public class ImportService {

	@POST

	@Consumes(MediaType.MULTIPART_FORM_DATA)
	public Response uploadFile(@FormDataParam("fileUpload") FormDataBodyPart body,
			@FormDataParam("docProperties") String documentProperties,@FormDataParam("fileuploadlabel") String fileuploadlabel,@FormDataParam("facilityId") String facilityId) {
		List<KeyValue> result = new CustomerPortalFileUpload().postFile(body,documentProperties,fileuploadlabel,facilityId);
		
////		if(result!=null){
////			UserSettings keyvalue = new UserSettings();
////			keyvalue.setKey("fileName");
////			keyvalue.setValue(result);
////			return Response.ok(keyvalue).build();
////		}
		return Response.ok(result).build();
	}


}