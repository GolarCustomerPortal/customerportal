package com.customerportal.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.ws.rs.core.MediaType;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.customerportal.bean.KeyValue;
import com.google.gson.JsonObject;
import com.sforce.soap.enterprise.Connector;
import com.sforce.soap.enterprise.EnterpriseConnection;
import com.sforce.soap.enterprise.sobject.Attachment;
import com.sforce.soap.enterprise.sobject.SObject;
import com.sforce.ws.ConnectorConfig;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.json.JSONConfiguration;
import com.sun.jersey.multipart.FormDataBodyPart;
import com.sun.jersey.multipart.FormDataMultiPart;
import com.sun.jersey.multipart.file.FileDataBodyPart;

public class SalesforceToGolars {
	static Properties urlProperties = new Properties();
	private static String USERNAME;
	private static String PASSWORD,golars360URL,hostAddress,urlMappintFile,urlMappintFileResult,tempFileDir;
	static EnterpriseConnection connection;
	static void fetchURLProperties() {

		try {
			urlProperties.load(CustomerPortalFileUpload.class.getResourceAsStream("/customerportal.properties"));
		} catch (Exception e1) {
			System.out.println("url.properties file not found" + e1.getMessage());
		}
	}
	public static void main(String[] args) throws Exception {
		System.out.println("Started import-----------");
		fetchURLProperties();
		USERNAME = urlProperties.getProperty("username");
		PASSWORD = urlProperties.getProperty("password");
		golars360URL = urlProperties.getProperty("golar360URL");
		hostAddress = urlProperties.getProperty("golars360BaseURL");
		urlMappintFile = urlProperties.getProperty("sourceImportFile");
		urlMappintFileResult =urlProperties.getProperty("sourceResultFile");
		tempFileDir =urlProperties.getProperty("tempFileDir");
		ConnectorConfig config = new ConnectorConfig();
		config.setUsername(USERNAME);
		config.setPassword(PASSWORD);
		System.out.println("connecting to salesforce -----------");
		connection = Connector.newConnection(config);
		System.out.println("connected to salesforce -----------");
		SObject [] contact = new SObject[1];
		
		List<String> idList= new ArrayList<String>();

//		String hostAddress = "http://golars360.com:8080/";
		
		File urlMappintFileResultFile = new File(urlMappintFileResult);
		if (!urlMappintFileResultFile.exists())
			urlMappintFileResultFile.createNewFile();
		System.out.println("urlMappintFileResultFile created-----------");
		SXSSFWorkbook resultworkbook = new SXSSFWorkbook(1);
		System.out.println("Workbook created -----------");
		Sheet resultsheet = resultworkbook .createSheet();
		System.out.println("resultsheet created -----------");
		Object[] bookHeader = { "Attachment__c",	"Facility__c",	"FID__c"	,"Description__c"	,"Id",	"Name",	"Report_Date__c"	,"Type__c",	"G360_URL__c" };
		Row headerRow = resultsheet.createRow(0);
		System.out.println("excel sheet created -----------");
		for (int i = 0; i < bookHeader.length; i++) {
			Cell cell = headerRow.createCell(i);
			cell.setCellValue((String) bookHeader[i]);
			System.out.println("excel columns created -----------");
		}
		System.out.println("Actual import started-----------");
		try {

			FileInputStream file = new FileInputStream(new File(urlMappintFile));

			// Create Workbook instance holding reference to .xlsx file
			XSSFWorkbook workbook = new XSSFWorkbook(file);

			// Get first/desired sheet from the workbook
			XSSFSheet sheet = workbook.getSheetAt(0);

			// Iterate through each rows one by one

			Iterator<Row> rowIterator = sheet.iterator();
			rowIterator.next();
int count = 0;
			while (rowIterator.hasNext()) {
				try {
					System.out.println("excel read started-----------");
					Row row = rowIterator.next();
					// For each row, iterate through all the columns
					JsonObject bean = new JsonObject();
					Cell cell = row.getCell(0);
					idList.add(getCellValue(cell));
					bean.addProperty("Attachment__c", getCellValue(cell));
					System.out.println("import started for -----------"+getCellValue(cell));
					cell = row.getCell(1);
					if (cell != null)
						bean.addProperty("Facility__c", getCellValue(cell));
					cell = row.getCell(2);
					if (cell != null)
						bean.addProperty("FID__c", getCellValue(cell) + "");
					
					cell = row.getCell(3);
					if (cell != null)
						bean.addProperty("Description__c", getCellValue(cell) + "");
					cell = row.getCell(4);
					if (cell != null)
						bean.addProperty("Id", getCellValue(cell));
					cell = row.getCell(5);
					if (cell != null)
						bean.addProperty("Name", getCellValue(cell));
					cell = row.getCell(6);
					java.util.Date dateValue = null;
					if (cell != null)
						dateValue = cell.getDateCellValue();
					if (dateValue != null) {
						Date date = new Date(dateValue.getTime());
						bean.addProperty("Report_Date__c",
								(date.getMonth() + 1) + "/" + date.getDate() + "/" + (date.getYear() + 1900));
					}
					cell = row.getCell(7);
					if (cell != null)
						bean.addProperty("Type__c", getCellValue(cell));
					String attachment = bean.get("Attachment__c").toString().substring(1,bean.get("Attachment__c").toString().lastIndexOf("\""));
					contact  = connection.retrieve("Name, Body,BodyLength,ContentType,Id", "Attachment", new String[]{attachment});
					File Localfile = new File(tempFileDir+((Attachment)contact[0]).getName());
					OutputStream outputStream = new FileOutputStream(Localfile);
					if(!Localfile.exists()){
						Localfile.createNewFile();
						Localfile.deleteOnExit();
					}
					
					outputStream.write(((Attachment)contact[0]).getBody());
					outputStream.close();
					 String docProperties = "{\"facilityRelated\":true,\"compliaceDocumentType\":"+bean.get("Type__c")+",\"description\":"+bean.get("Description__c")+",\"docUpdateDate\":"+bean.get("Report_Date__c")+",\"fid\":"+bean.get("FID__c")+"}";
						
//					if(true)
//						continue;
					ClientConfig clientConfig = new DefaultClientConfig();
					clientConfig.getFeatures().put(JSONConfiguration.FEATURE_POJO_MAPPING, Boolean.TRUE);
					Client client = Client.create(clientConfig);

					// Jersey client POST example

					WebResource webResourcePost = client.resource(golars360URL);
					final FormDataMultiPart multiPart = new FormDataMultiPart();
					 final FileDataBodyPart filePart = new FileDataBodyPart("fileUpload", new File(tempFileDir+((Attachment)contact[0]).getName()));
					 multiPart.bodyPart(filePart);
					multiPart.bodyPart(new FormDataBodyPart("docProperties", docProperties));
					final ClientResponse clientResp = webResourcePost.type(MediaType.MULTIPART_FORM_DATA_TYPE)
							.accept(MediaType.APPLICATION_JSON).post(ClientResponse.class, multiPart);
					System.out.println(clientResp);
					KeyValue responseEntity = clientResp.getEntity(KeyValue.class);
					
					bean.addProperty("G360_URL__c", hostAddress + "golars/rest/import/" + responseEntity.getValue());
					writeEntriesIntoFile(bean,resultsheet);
					System.out.println("import completed for -----------"+bean.get("Attachment__c").toString());
					count++;
					System.out.println("The number of documents imported are "+count);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("Skip file import " + e.getMessage());
				}

			}
			FileOutputStream outputStream = new FileOutputStream(urlMappintFileResult);
			resultworkbook.write(outputStream);
			outputStream.close();
			file.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	private static void writeEntriesIntoFile(JsonObject bean, Sheet resultsheet) {
		int rowCount = resultsheet.getLastRowNum();
		Row row = resultsheet.createRow(++rowCount);
		Cell cell = row.createCell(0);
		cell.setCellValue(bean.get("Attachment__c")!=null ?bean.get("Attachment__c").toString().substring(1,bean.get("Attachment__c").toString().lastIndexOf("\"")):"");
		cell = row.createCell(1);
		cell.setCellValue(bean.get("Facility__c")!=null ?bean.get("Facility__c").toString().toString().substring(1,bean.get("Facility__c").toString().lastIndexOf("\"")):"");
		cell = row.createCell(2);
		cell.setCellValue(bean.get("FID__c")!=null ?bean.get("FID__c").toString().toString().substring(1,bean.get("FID__c").toString().lastIndexOf("\"")):"");
		cell = row.createCell(3);
		cell.setCellValue(bean.get("Description__c")!=null ?bean.get("Description__c").toString().toString().substring(1,bean.get("Description__c").toString().lastIndexOf("\"")):"");
		cell = row.createCell(4);
		cell.setCellValue(bean.get("Id")!=null ?bean.get("Id").toString().toString().substring(1,bean.get("Id").toString().lastIndexOf("\"")):"");
		cell = row.createCell(5);
		cell.setCellValue(bean.get("Name")!=null ?bean.get("Name").toString().toString().substring(1,bean.get("Name").toString().lastIndexOf("\"")):"");
		cell = row.createCell(6);
		cell.setCellValue(bean.get("Report_Date__c")!=null ?bean.get("Report_Date__c").toString().substring(1,bean.get("Report_Date__c").toString().lastIndexOf("\"")).toString():"");
		cell = row.createCell(7);
		cell.setCellValue(bean.get("Type__c")!=null ?bean.get("Type__c").toString().substring(1,bean.get("Type__c").toString().lastIndexOf("\"")).toString():"");
		cell = row.createCell(8);
		cell.setCellValue(bean.get("G360_URL__c")!=null ?bean.get("G360_URL__c").toString().substring(1,bean.get("G360_URL__c").toString().lastIndexOf("\"")).toString():"");
		
		
	}

	private static String getCellValue(Cell cell) {
		if(cell==null)
			return " ";
		if (cell.getCellType() == XSSFCell.CELL_TYPE_STRING) {
			return cell.getStringCellValue() + "";
		} else if (cell.getCellType() == XSSFCell.CELL_TYPE_BOOLEAN) {
			return cell.getBooleanCellValue() + "";
		} else if (cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC) {
			String value =cell.getNumericCellValue() + "";
			return value.substring(0,(value.length()-2));
		} else if (cell.getCellType() == XSSFCell.CELL_TYPE_BLANK) {
			return "";
		} else if (cell.getCellType() == XSSFCell.CELL_TYPE_ERROR) {
			return "";
		} else if (cell.getCellType() == XSSFCell.CELL_TYPE_FORMULA) {
			return " ";
		}
		return " ";
	}
}
