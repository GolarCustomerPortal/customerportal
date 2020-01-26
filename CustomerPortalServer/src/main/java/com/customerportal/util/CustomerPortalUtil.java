package com.customerportal.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.commons.net.telnet.TelnetClient;
import org.apache.xmlbeans.impl.common.IOUtil;
import org.stringtemplate.v4.compiler.CodeGenerator.list_return;

import com.customerportal.bean.Facilities;
import com.customerportal.bean.Gaslevel;
import com.customerportal.bean.InventoryReport;
import com.customerportal.bean.KeyValue;
import com.customerportal.bean.TankMonitorSignup;
import com.customerportal.bean.User;

public class CustomerPortalUtil {
	static Properties imageProperties = new Properties();

	private static void fetchURLProperties() {
		try {
			imageProperties.load(CustomerPortalFileUpload.class.getResourceAsStream("/imageURL.properties"));
		} catch (Exception e1) {
			System.out.println("url.properties file not found" + e1.getMessage());
		}
	}

	public static void getActualFacilitiesList(List<Facilities> facilitiesList, String userId) {
		User user = DBUtil.getInstance().getSpecificUser(userId);
		String facilitiesIdString = getfacilitiesIdString(facilitiesList);
		List<Facilities> notificationFormList = DBUtil.getInstance().facilityNotificationFormList(facilitiesIdString);
		List<Facilities> complianceList = DBUtil.getInstance().facilityComplianceList(facilitiesIdString);
		List<Facilities> certificationList = DBUtil.getInstance().facilityCertificationList(facilitiesIdString);

		if (facilitiesList != null)
			for (Facilities facility : facilitiesList) {
				if (facility == null)
					continue;
				List<KeyValue> kvList = new ArrayList<KeyValue>();
				if (facilitiesList != null && user != null && !user.isAdmin())
					kvList = DBUtil.getInstance().retrieveSpecifiFacilityConsolidateReport(facility);
				facility.setConsolidateReport(kvList);
				facility.setLeakTankTestButtonStatus(DBUtil.getInstance().getLeakTankTestButtonStatus(facility));
				facility.setLeakTankTestCount(DBUtil.getInstance().getLeakTankTestCount(facility));
				facility.setTankStatusButtonStatus(DBUtil.getInstance().getTankStatusButtonStatus(facility));
				facility.setTankStatusCount(DBUtil.getInstance().getTankStatusCount(facility));
				facility.setCsldButtonStatus(DBUtil.getInstance().getCsldButtonStatus(facility));
				facility.setCsldCount(DBUtil.getInstance().getCsldCount(facility));
				facility.setIncomeExpenseUpdatesButtonEnable(DBUtil.getInstance().getIncomeExpenseUpdates(facility));
				if (notificationFormList.contains(facility.getFacilityId())) {
					facility.setNotificationFormButtonEnable("true");
				} else
					facility.setNotificationFormButtonEnable("false");
				if (complianceList.contains(facility.getFacilityId()))
					facility.setComplianceButtonEnable("true");
				else
					facility.setCertificationButtonEnable("false");
				if (certificationList.contains(facility.getFacilityId()))
					facility.setCertificationButtonEnable("true");
				else
					facility.setCertificationButtonEnable("false");

			}
	}

	public static String getfacilitiesIdString(List<Facilities> facilitiesList) {
		String facilitiesIdString = "";
		if (facilitiesList != null) {
			for (Facilities facilitiy : facilitiesList) {
				if (facilitiy != null && facilitiy.getFacilityId() != null)
					facilitiesIdString += "'" + facilitiy.getFacilityId() + "',";
			}
		}
		if (facilitiesIdString.endsWith(","))
			facilitiesIdString = facilitiesIdString.substring(0, facilitiesIdString.length() - 1);
		return facilitiesIdString;
	}

	public static void fillImageURL(List<Facilities> lst) {
		fetchURLProperties();
		String contextpath = imageProperties.getProperty("contextPath");
		for (Facilities facility : lst) {
			if (facility == null)
				continue;
			String imageURL = "/" + contextpath + "/images/gasstation/not_found_logo.png";
			if (facility.getBrand() != null && !facility.getBrand().equalsIgnoreCase("")) {
				String brand = facility.getBrand().replace(" ", "_");
				String brandURL = imageProperties.getProperty(brand);
				brandURL = brandURL == null ? "not_found_logo.png" : brandURL;
				imageURL = "/" + contextpath + "/images/gasstation/" + imageProperties.getProperty(brand);
			}
			if(facility.getTankPaidService().equalsIgnoreCase("false")){
				facility.setFacilityTankPaidMessage(imageProperties.getProperty("facilityTankPaidMessage"));
			}
			facility.setImageURL(imageURL);
		}

	}

	public static void writeTankMonitorDetailsIntoFile(List<TankMonitorSignup> tankMonitorSignup) {
		try {
			fetchURLProperties();
			String filePath = DBUtil.getInstance().getUserPreferences("tankMonitorPath");
			if (filePath == null)
				filePath = imageProperties.getProperty("defultTankMonitorPath");
			File fout = new File(filePath + "\\" + imageProperties.getProperty("tankMonitorFile"));
			if (!fout.exists())

				fout.createNewFile();

			FileOutputStream fos = new FileOutputStream(fout);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(fos));

			for (int i = 0; i < tankMonitorSignup.size(); i++) {
				bw.write(tankMonitorSignup.get(i).getFid()+ " " + tankMonitorSignup.get(i).getIpAddress() );
				bw.newLine();
			}

			bw.close();
		} catch (IOException exception) {
			System.out.println("Exception occred in getUserPreferences   method --" + exception.getMessage());
		}
	}

	public static List<Facilities> remoteDuplicateRecords(List<Facilities> lst) {
		List<Facilities> result = new ArrayList<Facilities>();
		for (Facilities facilities : lst) {
			boolean found = false;
			for (Facilities resFec : result) {
				if (resFec.getFacilityId().equalsIgnoreCase(facilities.getFacilityId())) {
					found = true;
					break;
				}
			}
			if (!found)
				result.add(facilities);

		}
		return result;
	}
	public static  int getMilliSeconds(String schedule) {
		if (schedule == null || schedule.equalsIgnoreCase("") || schedule.equalsIgnoreCase("0"))
			return 0;
		String[] minArray = schedule.split(":");
		int milliseconds = 0;
		milliseconds = Integer.parseInt(minArray[0]) * 60 * 60;
		milliseconds += Integer.parseInt(minArray[1]) * 60;
		return milliseconds * 1000;

	}

	public static Date atStartOfDay(Date date) {
		LocalDateTime localDateTime = dateToLocalDateTime(date);
		LocalDateTime endOfDay = localDateTime.with(LocalTime.MIN);
		return localDateTimeToDate(endOfDay);
	}
	
	public static Date atEndOfDay(Date date) {
		LocalDateTime localDateTime = dateToLocalDateTime(date);
		LocalDateTime endOfDay = localDateTime.with(LocalTime.MAX);
		return localDateTimeToDate(endOfDay);
	}

	private static LocalDateTime dateToLocalDateTime(Date date) {
		return LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());
	}

	private static Date localDateTimeToDate(LocalDateTime localDateTime) {
		return Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
	}
	public static Facilities getGasLevelsFromStation(String userid, String fid, String facilityId) throws IOException, InterruptedException {
		final String fileName = "InventoryReport_" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+".txt";
		System.out.println("fileName----"+fileName);
		TelnetClient telnet = null;
		Facilities facility =null;
		List<Facilities> facilityList = DBUtil.getInstance().getSpecificFacility(userid, facilityId);
		if(facilityList.size()>0) {
			facility = facilityList.get(0);
			List<KeyValue>  keyvalues = DBUtil.getInstance().retrieveSpecifiFacilityConsolidateReport(facility);
			facility.setConsolidateReport(keyvalues);
		}else {
			return null;
		}
		try {
			String ipaddress = fetchIpaddressUsingFacilityId(fid);
			telnet = new TelnetClient();
//			telnet.connect("23.118.150.22", 10001);
			if(ipaddress == null)
				return null;
			connectToStation(telnet,ipaddress,10001,1);
		} catch (IOException e) {
			System.out.println("There is a problem we need to reconnect "+e.getMessage());
			if(facility == null)
			facility = new Facilities();
			facility.setStationConnectError(true);
			facility.setStationConnectErrorMessage("Unable to connect to sation at this time");
			return facility;
		}
		Writer w = new OutputStreamWriter(telnet.getOutputStream());
		w.write(1);
		w.write("200\r\n");
		w.flush();
		System.out.println("ctrl+A typed");
		int i;
		char c;
		final File file = new File("c:/test/" + fileName);
		if (file.exists())
			file.delete();
		file.deleteOnExit();
		Thread.sleep(500);
		final InputStream inputStream = telnet.getInputStream();
		Thread fileWriter = new Thread() {

			@Override
			public void run() {
				System.out.println("reading ----"+fileName);
				char c = 0;
				int r = 0;
				try {
					while ((r = inputStream.read()) != -1) {
						c = (char) r;
						PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(file, true)));
						out.print(c);
						out.close();
					}
				} catch (IOException ex) {
					Logger.getLogger(IOUtil.class.getName()).log(Level.SEVERE, null, ex);
				}
				System.out.println("writing done----"+fileName);
				
			}
		};
		fileWriter.start();
		Thread.sleep(8000);
		System.out.println("done");

		BufferedReader inputFile = new BufferedReader(new FileReader(file));

		String lineOfText = inputFile.readLine();
		List<String> fileLineList = new ArrayList<>();

		while (lineOfText != null) {
			if (!lineOfText.isEmpty()) {
				fileLineList.add(lineOfText);
			}
			lineOfText = inputFile.readLine();
		}
		System.out.println(fileLineList);
		telnet.disconnect();
		
		String updatedDate= new Date(fileLineList.get(6)).toString();
		List<InventoryReport> inventoryReportList = new ArrayList<>();
		for (int index = 8; index <fileLineList.size(); index++) {
		String dataFirstRow[] =fileLineList.get(index).trim().split("\\s+");
		if(dataFirstRow.length>0 && dataFirstRow.length >= 6) {
			InventoryReport report = new InventoryReport();
			report.setName("InventoryReport");
			report.setDate(updatedDate);
			facility.setGasLevelUpdatedDate(updatedDate);
			int reportIndex = 0;
			report.setTank(dataFirstRow[reportIndex]);
			String productName="";
			if(dataFirstRow.length <= 7) {
				productName = dataFirstRow[++reportIndex];
			}else if(dataFirstRow.length == 8) {
				productName = dataFirstRow[++reportIndex] +" "+dataFirstRow[++reportIndex];
			}else if(dataFirstRow.length == 9) {
				productName = dataFirstRow[++reportIndex] +" "+dataFirstRow[++reportIndex]+" "+dataFirstRow[++reportIndex];
			}
			
			report.setProduct(productName);
			report.setGallons(dataFirstRow[++reportIndex]);
			report.setInches(dataFirstRow[++reportIndex]);
			if(dataFirstRow.length == 6) {
				report.setWater(0+"");
			}else
			report.setWater(dataFirstRow[++reportIndex]);
			report.setDefg(dataFirstRow[++reportIndex]);
			report.setUllage(dataFirstRow[++reportIndex]);
			report.setFid(fid);
			report.setId(facilityId);
			report.setFacility(facilityId);
			inventoryReportList.add(report);
		}	
		}
		DBUtil.getInstance().saveInventory(inventoryReportList);
		List<KeyValue>  keyvalues = DBUtil.getInstance().retrieveSpecifiFacilityConsolidateReport(facility);
		facility.setConsolidateReport(keyvalues);
		return facility;
	}

	private static void connectToStation(TelnetClient telnet, String ipaddress, int port, int tries) throws IOException {
		
			try {
				telnet.connect(ipaddress, 10001);
			}catch (IOException e) {
				System.out.println("There is a problem we need to reconnect "+e.getMessage());
				if(tries == 1) {
					throw e;
				}else {
				connectToStation(telnet, ipaddress, port, ++tries);
				}
		}
		
	}

	private static String fetchIpaddressUsingFacilityId(String facilityId) throws IOException {
		fetchURLProperties();
		String filePath = DBUtil.getInstance().getUserPreferences("tankMonitorPath");
		if (filePath == null)
			filePath = imageProperties.getProperty("defultTankMonitorPath");
		File fout = new File(filePath + "\\" + imageProperties.getProperty("tankMonitorFile"));
		if (fout.exists()) {
			FileInputStream  inputFile = new FileInputStream(fout);
			Properties properties = new Properties();
			properties.load(inputFile);
			System.out.println("the ip address is "+properties.get(facilityId));
			if(properties.get(facilityId) !=null)
			return properties.get(facilityId).toString();
			return null;
//			for(String key : properties.stringPropertyNames()) {
//				  String value = properties.getProperty(key);
//				  if(key.trim().equalsIgnoreCase(facilityId))
//					  return value;
//				}
		}
		return null;
	}
}
