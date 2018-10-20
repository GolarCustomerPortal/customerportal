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
  return this.http.get<any>(URLConstants.FACILITIES_NOTIFICATION_DETAILS,this.getDashboardOptions(CRMConstants.FACILITIES_ID,FacilitiesId))
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
getUSSBOAData() {
    return this.http.get<any>(URLConstants.USSBOA_URL)
        .map(ussboaData => {
            
            return ussboaData;
        });
}
getTankMonitorSignupData() {
    return this.http.get<any>(URLConstants.TANK_MONITOR_URL)
        .map(tankMontiorData => {
            
            return tankMontiorData;
        });
}
getTankMonitorSearch(searchString){
    return this.http.get<any>(URLConstants.TANK_MONITOR_SEARCH_URL,this.getDashboardOptions(CRMConstants.FACILITIES_ID,searchString))
    .map(searchTankData => {
        
        return searchTankData;
    });
}
addOrUpdateTankMonitorSignup(tankSignup){
    return this.http.post<any>(URLConstants.TANK_MONITOR_URL, {name: tankSignup.name, fid: tankSignup.fid,
         address: tankSignup.address, ipAddress:tankSignup.ipAddress})
      .map(tankMontiorData => {
          // Registration response 
          return tankMontiorData;
      });
}
deleteTankMonitorSignup(fid){
    return this.http.delete<any>(URLConstants.TANK_MONITOR_URL,this.getDashboardOptions(CRMConstants.FACILITIES_ID,fid))
    .map(tankMontiorData => {
        
        return tankMontiorData;
    });
}
saveUserPreferences(name,value){
    return this.http.post<any>(URLConstants.USER_PREFERENCES, {name: name, value: value})
     .map(preferencesResult => {
         // Registration response 
         return preferencesResult;
     });
}

getUserPreferences(){
    return this.http.get<any>(URLConstants.USER_PREFERENCES)
     .map(preferencesList => {
         // Registration response 
         return preferencesList;
     });
}
getJobScheduleData(userId) {
    return this.http.get<any>(URLConstants.JOB_SCHEDULE,this.getDashboardOptions(CRMConstants.USER_ID,userId))
        .map(jobScheduleData => {
            
            return jobScheduleData;
        });
}
saveJobScheduleData(job) {
    return this.http.post<any>(URLConstants.JOB_SCHEDULE,job)
        .map(jobScheduleData => {
            
            return jobScheduleData;
        });
}
deleteJobScheduleData(jobName) {
    return this.http.delete<any>(URLConstants.JOB_SCHEDULE,this.getDashboardOptions(CRMConstants.JOB_NAME,jobName))
        .map(result => {
            
            return result;
        });
}
getScheduleJobHisotryData(userId) {
    return this.http.get<any>(URLConstants.JOB_SCHEDULE_HISTORY,this.getDashboardOptions(CRMConstants.USER_ID,userId))
        .map(jobScheduleHistoryData => {
            
            return jobScheduleHistoryData;
        });
}
getTankAlarmHistory(userId) {
    return this.http.get<any>(URLConstants.TANK_ALARM_HISTORY_URL,this.getDashboardOptions(CRMConstants.USER_ID,userId))
        .map(tankAlaramList => {
            
            return tankAlaramList;
        });
}
resetTankAlert(tankAlertString){
    return this.http.post<any>(URLConstants.TANK_ALARM_HISTORY_URL, tankAlertString)
     .map(result => {
         // Registration response 
         return result;
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
