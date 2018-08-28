import { environment } from "../../environments/environment";

export class URLConstants {
    public static LOGIN_URL = environment.server+'/CustomerPortalServer/rest/login';
    public static FOLDER_URL = environment.server+'/CustomerPortalServer/rest/folders';
    public static SEARCH_URL = environment.server+'/CustomerPortalServer/rest/folders/search';
    public static DOCUMENT_DETAILS_URL = environment.server+'/CustomerPortalServer/rest/folders/documentdetails';
    public static USERS_URL = environment.server+'/CustomerPortalServer/rest/users';
    public static USERS_SEARCH_URL = environment.server+'/CustomerPortalServer/rest/users/search';
    public static USER_CHANGE_PASSWORD_URL = environment.server+'/CustomerPortalServer/rest/users/changepassword';
    public static IMPORT_DOC_URL = environment.server+'/CustomerPortalServer/rest/import';
    public static BULK_IMPORT_DOC_URL = environment.server+'/CustomerPortalServer/rest/bulkimport';
    public static FOLDER_TABLE_PREFERENCES = environment.server+'/CustomerPortalServer/rest/folders/preferences';
    public static FORGOT_PASSWORD_URL = environment.server+'/CustomerPortalServer/rest/forgotpassword';

    public static DASHBOARD_URL = environment.server+'/CustomerPortalServer/rest/dashboard';
    public static FECILITIES_URL = environment.server+'/CustomerPortalServer/rest/dashboard/fecilities';
    public static COMPANIES_URL = environment.server+'/CustomerPortalServer/rest/dashboard/companies';
    public static COMPLIANCE_URL = environment.server+'/CustomerPortalServer/rest/dashboard/compliance';

}