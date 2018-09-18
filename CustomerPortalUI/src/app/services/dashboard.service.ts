import { Injectable } from '@angular/core';
import 'rxjs/Rx';
import { URLConstants } from '../constants/urlconstants';
import { HttpClient, HttpParams } from '@angular/common/http';
import { CRMConstants } from '../constants/crmconstants';

@Injectable()
export class DashboardService {
  constructor(private http: HttpClient) { }

  getDashboardData(userId) {
      return this.http.get<any>(URLConstants.DASHBOARD_URL,this.getDashboardOptions(CRMConstants.USER_ID,userId))
          .map(dashboardData => {
              
              return dashboardData;
          });
  }
  
  getFecilitiesList(userId,type) {
    return this.http.get<any>(URLConstants.FECILITIES_URL,this.getFecilitiesOptions(userId,type))
        .map(fecilitiesData => {
            
            return fecilitiesData;
        });
}
getCompaniesList(userId) {
  return this.http.get<any>(URLConstants.COMPANIES_URL,this.getDashboardOptions(CRMConstants.USER_ID,userId))
      .map(companiesData => {
          
          return companiesData;
      });
}
getComplianceList(userId,type) {
  return this.http.get<any>(URLConstants.COMPLIANCE_URL,this.getFecilitiesOptions(userId,type))
      .map(facilityNotificationData => {
          
          return facilityNotificationData;
      });
}
getNotifictionUploadData(fecilitiesId){
  return this.http.get<any>(URLConstants.FECILITIES_NOTIFICATION_DETAILS,this.getDashboardOptions(CRMConstants.FECILITIES_ID,fecilitiesId))
      .map(fecilitiesData => {
          
          return fecilitiesData;
      });
}
searchResults(searchType:string,searchString: string,username: string,isadmin:boolean) {
    return this.http.get<any>(URLConstants.SEARCH_URL,this.getSearchOptions(searchType,searchString,username,isadmin))
        .map(folder => {
            
            return folder;
        });
}
private getSearchOptions(searchType,searchString,username,isadmin) {
    return {
      params: new HttpParams().set(CRMConstants.SEARCH_TYPE,searchType).set(CRMConstants.SEARCH_STRING,searchString).set(CRMConstants.USER_ID,username).set(CRMConstants.ISADMIN,isadmin)
    };
  }
  private getDashboardOptions(key,userId) {
    return {
      params: new HttpParams().set(key,userId)
    };
  }  
  private getFecilitiesOptions(userId,type) {
    return {
      params: new HttpParams().set(CRMConstants.USER_ID,userId).set(CRMConstants.FECILITIES_TYPE,type)
    };
  }  
}
