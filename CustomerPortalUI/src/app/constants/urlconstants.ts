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
    public static FaCILITIES_URL = environment.server+'/CustomerPortalServer/rest/dashboard/facilities';
    public static COMPANIES_URL = environment.server+'/CustomerPortalServer/rest/dashboard/companies';
    public static COMPLIANCE_URL = environment.server+'/CustomerPortalServer/rest/dashboard/compliance';
    public static  FACILITIES_NOTIFICATION_DETAILS= environment.server+'/CustomerPortalServer/rest/dashboard/notificationdetails';
    public static USSBOA_URL = environment.server+'/CustomerPortalServer/rest/dashboard/ussboa';
    public static TANK_MONITOR_URL = environment.server+'/CustomerPortalServer/rest/dashboard/tankmonitorsignup';
    public static TANK_MONITOR_SEARCH_URL = environment.server+'/CustomerPortalServer/rest/dashboard/tankmonitorsearch';
    public static TANK_ALARM_HISTORY_URL = environment.server+'/CustomerPortalServer/rest/dashboard/tankalarmhistory';
    public static USER_PREFERENCES = environment.server+'/CustomerPortalServer/rest/dashboard/preferences';
    public static JOB_SCHEDULE = environment.server+'/CustomerPortalServer/rest/dashboard/jobschedule';
}