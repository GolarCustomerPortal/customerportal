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
      .map(fecilitiesData => {
          
          return fecilitiesData;
      });
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
