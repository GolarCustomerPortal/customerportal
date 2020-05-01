package com.customerportal.rest;

import java.io.IOException;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.customerportal.util.CustomerPortalUtil;

public class MonthlyReportService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static long ONCE_PER_DAY = 1000 * 60 * 60 * 24;

	// private final static int ONE_DAY = 1;
	@Override
	public void init() throws ServletException {
		super.init();
//		startFacilityReportThread();
		try {
			CustomerPortalUtil.startSalesForceFacilityReports();
		} catch (IOException e) {
		} catch (InterruptedException e) {
		}
	}

	private void startFacilityReportThread() {
		long delay = CustomerPortalUtil.millisecondsTill430();
		long millseco = System.currentTimeMillis() + delay;
		System.out.println("The FacilityReportThread will start at " + new Date(millseco));
		new Timer().scheduleAtFixedRate(new TimerTask() {
			@Override
			public void run() {
				try {
					System.out.println("FacilityReportThread scheduled at " + new Date());
					CustomerPortalUtil.sendFacilityReports("inventory");
					CustomerPortalUtil.startSalesForceFacilityReports();
				} catch (Exception e) {
					System.out.println("Unable to start the startFacilityReportThread" + e.getMessage());
					e.printStackTrace();
				}

			}

		}, delay, ONCE_PER_DAY);
//		}, 600000, ONCE_PER_DAY);
		long delayTillMidNight = CustomerPortalUtil.millisecondsTillMidnight();
		long millsecoTillMidNight = System.currentTimeMillis() + delayTillMidNight;
		System.out.println("The Alert Thread will start at " + new Date(millsecoTillMidNight));
		new Timer().scheduleAtFixedRate(new TimerTask() {
			@Override
			public void run() {
				try {
					System.out.println("Alert Thread scheduled at " + new Date());
					CustomerPortalUtil.sendFacilityReports("tankAlarm");
				} catch (Exception e) {
					System.out.println("Unable to start the startFacilityReportThread" + e.getMessage());
					e.printStackTrace();
				}

			}

		}, millsecoTillMidNight, ONCE_PER_DAY);

	}

}
