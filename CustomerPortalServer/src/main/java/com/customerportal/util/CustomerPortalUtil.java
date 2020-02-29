package com.customerportal.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.commons.io.IOUtils;
import org.apache.commons.net.telnet.TelnetClient;
import org.apache.xmlbeans.impl.common.IOUtil;

import com.customerportal.bean.Facilities;
import com.customerportal.bean.FacilityReports;
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
				facility.setTankMonitorLabelsAndValues(DBUtil.getInstance().fetchTankMonitorLabels(facility));
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
			if (facility.getTankPaidService().equalsIgnoreCase("false")) {
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
				bw.write(tankMonitorSignup.get(i).getFid() + " " + tankMonitorSignup.get(i).getIpAddress());
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

	public static int getMilliSeconds(String schedule) {
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

	public static Facilities getGasLevelsFromStation(String userid, String fid, String facilityId, String reportType,
			String fileName, boolean append) throws IOException, InterruptedException {

		System.out.println("fileName----" + fileName);
		final TelnetClient telnet = new TelnetClient();
		Facilities facility = null;
		
		try {
			// get the tank report id
			Class<GolarsUtil> cl = GolarsUtil.class;
			Properties tankProperties = new Properties();
			tankProperties.load(cl.getResourceAsStream("/customerportal.properties"));
			tankReportId = tankProperties.getProperty(reportType);
		} catch (Exception e1) {
			// setting default id
			tankReportId = "I20100";
		}
		List<Facilities> facilityList = DBUtil.getInstance().getSpecificFacility(userid, facilityId);
		if (facilityList.size() > 0) {
			facility = facilityList.get(0);
			List<KeyValue> keyvalues = DBUtil.getInstance().retrieveSpecifiFacilityConsolidateReport(facility);
			facility.setConsolidateReport(keyvalues);
		} else {
			return null;
		}
		try {
			String ipaddress = facility.getTankMonitorStaticIP();
//			telnet = new TelnetClient();
//			telnet.connect("23.118.150.22", 10001);
			if (ipaddress == null)
				return null;
			connectToStation(telnet, ipaddress, 10001, 1);
		} catch (IOException e) {
			System.out.println("There is a problem we need to reconnect " + e.getMessage());
			if (facility == null)
				facility = new Facilities();
			facility.setStationConnectError(true);
			facility.setStationConnectErrorMessage(
					"Could not make connection with the site at this time!! Please try again later.");
			return facility;
		}
		Writer w = new OutputStreamWriter(telnet.getOutputStream());
		w.write(1);
		w.write(tankReportId + "\r\n");
		w.flush();
		File file;
		System.out.println("ctrl+A typed");
		if (append)
			Thread.sleep(1000);
		String fileNameTemp;
		if (reportType.equalsIgnoreCase("inventory"))
			fileNameTemp = "InventoryReport_" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + ".txt";
		else
			fileNameTemp = "tankAlarm_" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + ".txt";

		if (append) {
			file = new File("c:/test/" + fileNameTemp);
		} else
			file = new File("c:/test/" + fileName);
		if (!append && file.exists())
			file.delete();
		file.deleteOnExit();
		endOfThInventoryFile = false;
		final OutputStream os = new FileOutputStream(file);
		Thread fileWriter = new Thread() {

			@Override
			public void run() {
				try {
					byte[] tmp = new byte[1024];
					while (true) {
						if (endOfThInventoryFile)
							break;

						int i = telnet.getInputStream().read(tmp, 0, 1);
						if (new String(tmp, 0, i).equalsIgnoreCase(String.valueOf((char) 1))
								|| new String(tmp, 0, i).equalsIgnoreCase(tankReportId + "\r\n")) {
							continue;
						}

						if (new String(tmp, 0, i).equalsIgnoreCase(String.valueOf((char) 3))) {
							telnet.disconnect();
							endOfThInventoryFile = true;
							break;
						}
						os.write(new String(tmp, 0, i).getBytes());
						System.out.print(new String(tmp, 0, i));
					}

				} catch (Exception ex) {
					Logger.getLogger(IOUtil.class.getName()).log(Level.SEVERE, null, ex);
				} finally {
					try {
						if (os != null)
							os.close();
					} catch (Exception e) {
					}
				}
				System.out.println("done");
			}

		};
		fileWriter.start();
		int counter = 0;
		while (true) {
			if (counter == 60 || endOfThInventoryFile)
				break;
			else
				Thread.sleep(1000);
		}
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
		if(reportType.equalsIgnoreCase("inventory")) {
		List<InventoryReport> inventoryReportList = saveInventoryDataInDb(fid, facilityId, facility, fileLineList);
		DBUtil.getInstance().saveInventory(inventoryReportList);
		List<KeyValue> keyvalues = DBUtil.getInstance().retrieveSpecifiFacilityConsolidateReport(facility);
		facility.setConsolidateReport(keyvalues);
		}else {
			reportType="Tank Alarm (Priority)";
			FacilityReports report = DBUtil.getInstance().getFacilityReport(fid, reportType);
			saveReportAsWhole(userid, fid, reportType, tankReportId, report, file);
	
		}
// append two files
		if (append) {
			PrintWriter pw = new PrintWriter(new FileOutputStream(new File("c:/test/" + fileName), append));
			inputFile = new BufferedReader(new FileReader(file));
			pw.println("");
			lineOfText = inputFile.readLine();
			fileLineList = new ArrayList<>();

			while (lineOfText != null) {
				if (!lineOfText.isEmpty()) {
					pw.println(lineOfText);
				}
				lineOfText = inputFile.readLine();
			}
			pw.println("");
			pw.println("----------------------------------------------------------------------");
			pw.close();
			file.delete();
		}
		return facility;
	}

	private static List<InventoryReport> saveInventoryDataInDb(String fid, String facilityId, Facilities facility,
			List<String> fileLineList) {
		List<InventoryReport> inventoryReportList = new ArrayList<>();
		if(fileLineList ==null || fileLineList.size() <= 1)
			return inventoryReportList;
		String updatedDate = fileLineList.get(1).toString();
		
		for (int index = 8; index < fileLineList.size(); index++) {
			String dataFirstRow[] = fileLineList.get(index).trim().split("\\s+");
			if (dataFirstRow.length > 0 && dataFirstRow.length >= 6) {
				InventoryReport report = new InventoryReport();
				report.setName("InventoryReport");
				report.setDate(updatedDate);
				facility.setGasLevelUpdatedDate(updatedDate);
				int reportIndex = 0;
				report.setTank(dataFirstRow[reportIndex]);
				String productName = "";
				if (dataFirstRow.length <= 7) {
					productName += dataFirstRow[++reportIndex] + " ";
				} else {
					for (int i = 7; i < dataFirstRow.length; i++) {
						productName += dataFirstRow[++reportIndex] + " ";
					}
					productName = productName.trim();
				}

				report.setProduct(productName);
				report.setGallons(dataFirstRow[++reportIndex]);
				report.setInches(dataFirstRow[++reportIndex]);
				if (dataFirstRow.length == 6) {
					report.setWater(0 + "");
				} else
					report.setWater(dataFirstRow[++reportIndex]);
				report.setDefg(dataFirstRow[++reportIndex]);
				report.setUllage(dataFirstRow[++reportIndex]);
				report.setFid(fid);
				report.setId(facilityId);
				report.setFacility(facilityId);
				inventoryReportList.add(report);
			}
		}
		return inventoryReportList;
	}

	private static void connectToStation(TelnetClient telnet, String ipaddress, int port, int tries)
			throws IOException {

		try {
			telnet.connect(ipaddress, 10001);
		} catch (IOException e) {
			System.out.println("There is a problem we need to reconnect " + e.getMessage());
			if (tries == 1) {
				throw e;
			} else {
				connectToStation(telnet, ipaddress, port, ++tries);
			}
		}

	}

	static boolean endOfTheFile = false;
	static boolean endOfThInventoryFile = false;
	static String tankReportId = "I20100";

	public static FacilityReports getTankTestFromStation(String userId, String fid, String facilityId,
			String reportType, String keyCode) throws IOException, InterruptedException {

		final String fileName = "reportTest_" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + ".txt";
		System.out.println("fileName----" + fileName);
		final TelnetClient telnet = new TelnetClient();
		Facilities facility = null;
		String tankReportId = "I20700";
		if (keyCode != null)
			tankReportId = keyCode;
		System.out.println("The telnet code is ----" + tankReportId);
		List<Facilities> facilityList = DBUtil.getInstance().getSpecificFacility(userId, facilityId);
		FacilityReports report = DBUtil.getInstance().getFacilityReport(fid, reportType);
		if (facilityList.size() > 0) {
			facility = facilityList.get(0);
			List<KeyValue> keyvalues = DBUtil.getInstance().retrieveSpecifiFacilityConsolidateReport(facility);
			facility.setConsolidateReport(keyvalues);
		} else {
			return null;
		}
		try {
			String ipaddress = facility.getTankMonitorStaticIP();
			if (ipaddress == null)
				return null;
			connectToStation(telnet, ipaddress, 10001, 1);
		} catch (IOException e) {
			System.out.println("There is a problem we need to reconnect " + e.getMessage());
			if (report == null)
				report = new FacilityReports();
			report.setStationConnectError(true);
			report.setStationConnectErrorMessage(
					"Could not make connection with the site at this time!! Please try again later.");
			if (report.getContent() != null)
				report.setContentAsText(new String(report.getContent()));
			return report;
		}
		Writer w = new OutputStreamWriter(telnet.getOutputStream());
		w.write(1);
		w.write(tankReportId + "\r\n");
		w.flush();
		System.out.println("ctrl+A typed");
		final File file = new File("c:/test/" + fileName);
		if (file.exists())
			file.delete();
		file.deleteOnExit();
		endOfTheFile = false;
		final OutputStream os = new FileOutputStream(file);
		Thread fileWriter = new Thread() {

			@Override
			public void run() {
				try {
					byte[] tmp = new byte[1024];
					while (true) {
						if (endOfTheFile)
							break;
						int i = telnet.getInputStream().read(tmp, 0, 1);
						if (new String(tmp, 0, i).equalsIgnoreCase(String.valueOf((char) 1))
								|| new String(tmp, 0, i).equalsIgnoreCase("I37300\r\n")) {
							continue;
						}
						if (new String(tmp, 0, i).equalsIgnoreCase(String.valueOf((char) 3))) {
							telnet.disconnect();
							endOfTheFile = true;
							break;
						}
						os.write(new String(tmp, 0, i).getBytes());
						System.out.print(new String(tmp, 0, i));
					}

				} catch (IOException ex) {
					Logger.getLogger(IOUtil.class.getName()).log(Level.SEVERE, null, ex);
				} finally {
					try {
						if (os != null)
							os.close();
					} catch (Exception e) {
					}
				}
				System.out.println("done");
			}

		};
		fileWriter.start();
		int counter = 0;
		while (true) {
			if (counter == 60 || endOfTheFile)
				break;
			else
				Thread.sleep(1000);
		}
		report = saveReportAsWhole(userId, fid, reportType, tankReportId, report, file);
		return report;

	}

	private static FacilityReports saveReportAsWhole(String userId, String fid, String reportType, String tankReportId,
			FacilityReports report, final File file) throws FileNotFoundException, IOException {
		FileInputStream fileContnt = new FileInputStream(file);

		String fileContntString = IOUtils.toString(fileContnt, "UTF-8");
		if (fileContntString.indexOf(tankReportId) == -1) {
			fileContntString = tankReportId + "\n" + fileContntString;
		}
		fileContntString = fileContntString.replace(tankReportId, "\t\t\t\t" + reportType + "\n");
		if (report == null) {
			report = new FacilityReports();
			report.setId(userId);
			report.setFid(fid);
			report.setReportType(reportType);
			report.setCreatedBy(userId);
			report.setCreatedDate(new Date() + "");
		}
		report.setContent(fileContntString.getBytes());
		report.setUpdatedDate(new Date() + "");
		report.setUpdatedBy(userId);
		DBUtil.getInstance().saveFacilityReport(report);
		report.setContentAsText(new String(report.getContent()));
		report.setContent(null);
		return report;
	}

	public static long millisecondsTill430() {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, 0);
		c.set(Calendar.HOUR_OF_DAY, 16);
		c.set(Calendar.MINUTE, 30);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);
		long howMany = (c.getTimeInMillis() - System.currentTimeMillis());
		if(howMany<0) {
			c.add(Calendar.DAY_OF_MONTH, 1);
			howMany = (c.getTimeInMillis() - System.currentTimeMillis());
		}
		return howMany;
	}

	public static long millisecondsTillMidnight() {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, 1);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 30);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);
		long howMany = (c.getTimeInMillis() - System.currentTimeMillis());
		return howMany;
	}

	public static void main(String[] args) {
		System.out.println(new Date());
		System.out.println(new Date(System.currentTimeMillis()+millisecondsTill430()));
	}

	public static void sendFacilityReports(String type) throws IOException, InterruptedException {
		List<User> usersList = DBUtil.getInstance().getAllUsers();
		for (User user : usersList) {
			String fileName;
			if (type.equalsIgnoreCase("inventory"))
				fileName = "InventoryReport_" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + ".txt";
			else
				fileName = "tankAlarm_" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + ".txt";

			List<Facilities> facilityList = DBUtil.getInstance().fetchFacilitiesWithIpAddress(user.getId());
			System.out.println("retrieving reports from " + facilityList.size());
			for (Facilities facility : facilityList) {
				getGasLevelsFromStation(user.getId(), facility.getFid(), facility.getFacilityId(), type, fileName,
						true);
			}
			fileName = "c:/test/" + fileName;
			File file = new File(fileName);
			String localTankReportId = "I20100";
			if (file.exists()) {
				try {
					// get the tank report id
					Class<CustomerPortalUtil> cl = CustomerPortalUtil.class;
					Properties tankProperties = new Properties();
					tankProperties.load(cl.getResourceAsStream("/customerportal.properties"));
					localTankReportId = tankProperties.getProperty(type);
				} catch (Exception e1) {
					// setting default id
					localTankReportId = "I20100";
				}
//				new MailUtil().sendEmailWithContent(user.getEmailAddress(), fileName, localTankReportId,type);
				new MailUtil().sendEmailWithContent(user.getEmailAddress(), fileName, localTankReportId,type,user);
			}
		}

	}
}
