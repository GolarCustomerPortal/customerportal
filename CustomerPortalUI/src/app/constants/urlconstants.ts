import { environment } from "../../environments/environment";

export class URLConstants {
    public static LOGIN_URL = environment.server+'/CustomerPortalServer/rest/login';
    public static FOLDER_URL = environment.server+'/CustomerPortalServer/rest/folders';
    public static SEARCH_URL = environment.server+'/CustomerPortalServer/rest/dashboard/search';
    public static DOCUMENT_DETAILS_URL = environment.server+'/CustomerPortalServer/rest/folders/documentdetails';
    public static USERS_URL = environment.server+'/CustomerPortalServer/rest/users';
    public static USERS_SEARCH_URL = environment.server+'/CustomerPortalServer/rest/users/search';
    public static USERS_HISTORY_URL = environment.server+'/CustomerPortalServer/rest/users/history';
    public static USER_CHANGE_PASSWORD_URL = environment.server+'/CustomerPortalServer/rest/users/changepassword';
    public static IMPORT_DOC_URL = environment.server+'/CustomerPortalServer/rest/import';
    public static BULK_IMPORT_DOC_URL = environment.server+'/CustomerPortalServer/rest/bulkimport';
    public static FOLDER_TABLE_PREFERENCES = environment.server+'/CustomerPortalServer/rest/folders/preferences';
    public static FORGOT_PASSWORD_URL = environment.server+'/CustomerPortalServer/rest/forgotpassword';

    public static DASHBOARD_URL = environment.server+'/CustomerPortalServer/rest/dashboard';
    public static FACILITIES_URL = environment.server+'/CustomerPortalServer/rest/dashboard/facilities';
    public static FACILITIES_FULL_DETAILS_URL = environment.server+'/CustomerPortalServer/rest/dashboard/facilitiesWithFullDetails';
    public static FACILITY_URL = environment.server+'/CustomerPortalServer/rest/dashboard/facility';
    public static COMPANIES_URL = environment.server+'/CustomerPortalServer/rest/dashboard/companies';
    public static COMPANIES_FACILITIES_URL = environment.server+'/CustomerPortalServer/rest/dashboard/companies/facilities';
    public static COMPLIANCE_URL = environment.server+'/CustomerPortalServer/rest/dashboard/compliance';
    public static  FACILITIES_NOTIFICATION_DETAILS= environment.server+'/CustomerPortalServer/rest/dashboard/notificationdetails';
    public static  FACILITIES_UST_COMPLIANCE_DETAILS= environment.server+'/CustomerPortalServer/rest/dashboard/ustcompliance';
    public static  FACILITIES_OPERATOR_CERTIFICATES_DETAILS= environment.server+'/CustomerPortalServer/rest/dashboard/operatorcertificates';
    public static USSBOA_URL = environment.server+'/CustomerPortalServer/rest/dashboard/ussboa';
    public static TANK_MONITOR_URL = environment.server+'/CustomerPortalServer/rest/dashboard/tankmonitorsignup';
    public static TANK_MONITOR_SEARCH_URL = environment.server+'/CustomerPortalServer/rest/dashboard/tankmonitorsearch';
    public static TANK_ALARM_HISTORY_URL = environment.server+'/CustomerPortalServer/rest/dashboard/tankalarmhistory_new';
    public static USER_PREFERENCES = environment.server+'/CustomerPortalServer/rest/dashboard/preferences';
    public static JOB_SCHEDULE = environment.server+'/CustomerPortalServer/rest/dashboard/jobschedule';
    public static JOB_SCHEDULE_HISTORY = environment.server+'/CustomerPortalServer/rest/dashboard/jobschedulehistory';
    public static GASLEVES_URL = environment.server+'/CustomerPortalServer/rest/dashboard/gaslevel';
    public static GASLEVES_FROM_STATION_URL = environment.server+'/CustomerPortalServer/rest/dashboard/gaslevelFromStation';
    public static TANK_RESULT_FROM_STATION_URL = environment.server+'/CustomerPortalServer/rest/dashboard/facilityReportFromStation';
    public static LEAKTANK_DETAILS = environment.server+'/CustomerPortalServer/rest/dashboard/leaktestDetails';
    public static TANK_STATUS_DETAILS = environment.server+'/CustomerPortalServer/rest/dashboard/tankstatusDetails';
    public static CSLD_TEST_DETAILS = environment.server+'/CustomerPortalServer/rest/dashboard/csldtestDetails';
    public static SITE_INCOME = environment.server+'/CustomerPortalServer/rest/incomeExpenses/income';
    public static SITE_NET_INCOME = environment.server+'/CustomerPortalServer/rest/incomeExpenses/netIncome';
    public static SITE_INCOME_TYPE = environment.server+'/CustomerPortalServer/rest/incomeExpenses/income/type';
    public static SITE_INCOME_MONTHLY_CUSTOM_DATE = environment.server+'/CustomerPortalServer/rest/incomeExpenses/income/detail';
    public static SITE_INCOME_PICKLIST = environment.server+'/CustomerPortalServer/rest/incomeExpenses/income/pickList';
    public static SITE_EXPENDITURE = environment.server+'/CustomerPortalServer/rest/incomeExpenses/expenses';
    public static SITE_EXPENDITURE_CUSTOM_DATE = environment.server+'/CustomerPortalServer/rest/incomeExpenses/expenses/detail';
    public static SITE_INCOME_CHART_DETAIL = environment.server+'/CustomerPortalServer/rest/incomeExpenses/income/chart/detail';
    public static SITE_EXPENSES_CHART_DETAIL = environment.server+'/CustomerPortalServer/rest/incomeExpenses/expenses/chart/detail';
    
}