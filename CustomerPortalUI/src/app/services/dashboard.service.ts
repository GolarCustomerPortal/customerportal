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
  
  getFacilitiesList(userId,type) {
    return this.http.get<any>(URLConstants.FaCILITIES_URL,this.getFacilitiesOptions(userId,type))
        .map(FacilitiesData => {
            
            return FacilitiesData;
        });
}
getCompaniesList(userId) {
  return this.http.get<any>(URLConstants.COMPANIES_URL,this.getDashboardOptions(CRMConstants.USER_ID,userId))
      .map(companiesData => {
          
          return companiesData;
      });
}
getComplianceList(userId,type) {
  return this.http.get<any>(URLConstants.COMPLIANCE_URL,this.getFacilitiesOptions(userId,type))
      .map(facilityNotificationData => {
          
          return facilityNotificationData;
      });
}
getNotifictionUploadData(FacilitiesId){
  return this.http.get<any>(URLConstants.FaCILITIES_NOTIFICATION_DETAILS,this.getDashboardOptions(CRMConstants.FACILITIES_ID,FacilitiesId))
      .map(FacilitiesData => {
          
          return FacilitiesData;
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
  private getFacilitiesOptions(userId,type) {
    return {
      params: new HttpParams().set(CRMConstants.USER_ID,userId).set(CRMConstants.FACILITIES_TYPE,type)
    };
  }  
}
