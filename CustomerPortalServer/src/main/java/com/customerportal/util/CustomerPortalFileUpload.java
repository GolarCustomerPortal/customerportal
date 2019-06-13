package com.customerportal.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.ws.rs.core.MediaType;

import com.customerportal.bean.Facilities;
import com.customerportal.bean.KeyValue;
import com.google.gson.Gson;
import com.sforce.soap.enterprise.Connector;
import com.sforce.soap.enterprise.EnterpriseConnection;
import com.sforce.soap.enterprise.SaveResult;
import com.sforce.soap.enterprise.sobject.Customer_Portal_Attachments__c;
import com.sforce.ws.ConnectionException;
import com.sforce.ws.ConnectorConfig;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.json.JSONConfiguration;
import com.sun.jersey.core.header.ContentDisposition;
import com.sun.jersey.multipart.BodyPart;
import com.sun.jersey.multipart.FormDataBodyPart;
import com.sun.jersey.multipart.FormDataMultiPart;

public class CustomerPortalFileUpload {
	static Properties urlProperties = new Properties();
	Properties notificationProperties = new Properties();
	Properties complianceandcertification = new Properties();
	private static String USERNAME;
	private static String PASSWORD;
	static EnterpriseConnection connection;

	void fetchURLProperties() {

		try {
			urlProperties.load(CustomerPortalFileUpload.class.getResourceAsStream("/customerportal.properties"));
			complianceandcertification.load(CustomerPortalFileUpload.class.getResourceAsStream("/certificationandcompliance.properties"));
			notificationProperties.load(CustomerPortalFileUpload.class.getResourceAsStream("/notificationForm.properties"));
		} catch (Exception e1) {
			System.out.println("url.properties file not found" + e1.getMessage());
		}
	}

	public List<KeyValue> postFile(FormDataBodyPart body, String documentProperties, String fileuploadlabel,
			String facilityId) {
		fetchURLProperties();
		String url = urlProperties.getProperty("golar360URL");
		USERNAME = urlProperties.getProperty("username");
		PASSWORD = urlProperties.getProperty("password");
		KeyValue keyValue[] = new Gson().fromJson(fileuploadlabel, KeyValue[].class);
		List<KeyValue> resultList = new ArrayList<KeyValue>();
		Facilities facilities = new Gson().fromJson(documentProperties,Facilities.class);
		try {
			for (BodyPart part : body.getParent().getBodyParts()) {

				// InputStream is = part.getEntityAs(InputStream.class);
				ContentDisposition meta = part.getContentDisposition();
				if (meta.getFileName() != null) {
					ClientConfig clientConfig = new DefaultClientConfig();
					clientConfig.getFeatures().put(JSONConfiguration.FEATURE_POJO_MAPPING, Boolean.TRUE);
					Client client = Client.create(clientConfig);

					// Jersey client POST example

					WebResource webResourcePost = client.resource(url);
					final FormDataMultiPart multiPart = new FormDataMultiPart();
					multiPart.bodyPart(part);
					multiPart.bodyPart(new FormDataBodyPart("docProperties", documentProperties));

					final ClientResponse clientResp = webResourcePost.type(MediaType.MULTIPART_FORM_DATA_TYPE)
							.accept(MediaType.APPLICATION_JSON).post(ClientResponse.class, multiPart);
					// ClientResponse response =
					// webResourcePost.type("application/json").accept(MediaType.APPLICATION_JSON).post(ClientResponse.class);
					KeyValue result = new KeyValue();
					resultList.add(result);
					String label = getFieldLabel(keyValue, meta.getFileName());
					result.setKey(label);
					String salesForceLabel = getFieldLabelFromPropertiesFile(label);
//					String salesForceLabel = null;
//					if(fieldlabel.indexOf("__")>0){
//						salesForceLabel = fieldlabel.substring(0,fieldlabel.indexOf("__"));
//						salesForceLabel = salesForceLabel.replaceAll("_", " ");	
//					}
					KeyValue responseEntity = clientResp.getEntity(KeyValue.class);
					if (responseEntity ==null) {
						result.setValue("false");
						continue;
					}
					ConnectorConfig config = new ConnectorConfig();
					config.setUsername(USERNAME);
					config.setPassword(PASSWORD);
					connection = Connector.newConnection(config);
					Customer_Portal_Attachments__c[] contact = new Customer_Portal_Attachments__c[1];
					
					contact[0] = new Customer_Portal_Attachments__c();
					contact[0].setName(keyValue[0].getValue());
					contact[0].setFacility__c(facilities.getFacilityId());
					contact[0].setType__c(salesForceLabel);
					contact[0].setApproval_Status__c("Pending");
					contact[0].setG360_URL__c(url + "/" + responseEntity.getValue());
					SaveResult[] saveResults = connection.create(contact);
					System.out.println(saveResults.length);
					result.setKey(label);
					if (saveResults[0].getErrors().length > 0) {
						result.setValue("false");
						continue;
					}
					
					DBUtil.getInstance().insertCustomPortalAttachment(facilityId,gen(),getFieldLabelFromPropertiesFile(label));
					result.setValue("true");
					

				}
			}

			// String jsonInput =
			// "{\"custmer\":\"Java2novice\",\"address\":\"Bangalore\","+
			// "\"bill-amount\":\"$2000\"}";
			// final ClientConfig config = new DefaultClientConfig();
			// final Client client = Client.create(config);
			//
			// final WebResource resource = client.resource(url);
			//
			// final FormDataMultiPart multiPart = new FormDataMultiPart();
			// multiPart.bodyPart(body);
			// multiPart.bodyPart(new FormDataBodyPart("docProperties",
			// documentProperties));
			//
			// final ClientResponse clientResp = resource.type(
			// MediaType.MULTIPART_FORM_DATA_TYPE).accept(MediaType.APPLICATION_JSON).post(ClientResponse.class,
			// multiPart);
			// clientResp.bufferEntity();
			// String x = clientResp.getEntity(String.class);
			// JsonObject json = clientResp.getEntity(JsonObject.class);
			// System.out.println("Response: " +
			// clientResp.getClientResponseStatus());
			//
			// client.destroy();

			// Create Jersey client

		} catch (ConnectionException ce) {
			System.out.println("error in post file method " + ce.getLocalizedMessage());

			ce.printStackTrace();
		}

		return resultList;
	}

	private String getFieldLabelFromPropertiesFile(String label) {
		String fieldlabel = complianceandcertification.getProperty(label);
		if(fieldlabel != null)
			return fieldlabel;
		fieldlabel = notificationProperties.getProperty(label);
		if(fieldlabel != null)
			return fieldlabel;
		return label;
	}

	private String getFieldLabel(KeyValue[] keyValueArray, String fileName) {
		for (KeyValue keyValue : keyValueArray) {
			if (keyValue.getValue().equalsIgnoreCase(fileName))
				return keyValue.getKey();
		}
		return fileName;
	}

	public int gen() {
		Random r = new Random(System.currentTimeMillis());
		return 100000 + r.nextInt(200000);
	}

}
