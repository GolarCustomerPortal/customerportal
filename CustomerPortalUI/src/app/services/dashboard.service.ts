import { Injectable } from '@angular/core';
import 'rxjs/Rx';
import { URLConstants } from '../constants/urlconstants';
import { HttpParams } from '@angular/common/http';
import { CRMConstants } from '../constants/crmconstants';
import { CommonService } from './common.service';
import { HttpService } from './http.service';

@Injectable()
export class DashboardService {
  constructor(private http: HttpService,private commonService: CommonService) { }

  getDashboardData(userId) {
   
      return this.http.get(URLConstants.DASHBOARD_URL,this.getDashboardOptions(CRMConstants.USER_ID,userId))
          .map(dashboardData => {
              
              return dashboardData;
          });
  }
  
  getFacilitiesList(userId,type) {
    return this.http.get(URLConstants.FACILITIES_URL,this.getFacilitiesOptions(userId,type))
        .map(FacilitiesData => {
            
            return FacilitiesData;
        });
}
getCompaniesList(userId) {
  return this.http.get(URLConstants.COMPANIES_URL,this.getDashboardOptions(CRMConstants.USER_ID,userId))
      .map(companiesData => {
          
          return companiesData;
      });
}
getComplianceList(userId,type) {
  return this.http.get(URLConstants.COMPLIANCE_URL,this.getFacilitiesOptions(userId,type))
      .map(facilityNotificationData => {
          
          return facilityNotificationData;
      });
}
getNotifictionUploadData(FacilitiesId){
  return this.http.get(URLConstants.FACILITIES_NOTIFICATION_DETAILS,this.getDashboardOptions(CRMConstants.FACILITIES_ID,FacilitiesId))
      .map(FacilitiesData => {
          
          return FacilitiesData;
      });
}
getUSTComplianceData(FacilitiesId){
    return this.http.get(URLConstants.FACILITIES_UST_COMPLIANCE_DETAILS,this.getDashboardOptions(CRMConstants.FACILITIES_ID,FacilitiesId))
        .map(FacilitiesData => {
            
            return FacilitiesData;
        });
  }
  getOperatorCertificatesData(FacilitiesId){
    return this.http.get(URLConstants.FACILITIES_OPERATOR_CERTIFICATES_DETAILS,this.getDashboardOptions(CRMConstants.FACILITIES_ID,FacilitiesId))
        .map(FacilitiesData => {
            
            return FacilitiesData;
        });
  }
searchResults(searchType:string,searchString: string,username: string,isadmin:boolean) {
    return this.http.get(URLConstants.SEARCH_URL,this.getSearchOptions(searchType,searchString,username,isadmin))
        .map(folder => {
            
            return folder;
        });
}
getUSSBOAData(vendorType) {
    return this.http.get(URLConstants.USSBOA_URL,this.getDashboardOptions(CRMConstants.VENDOR_TYPE,vendorType))
        .map(ussboaData => {
            
            return ussboaData;
        });
}
getTankMonitorSignupData() {
    return this.http.get(URLConstants.TANK_MONITOR_URL)
        .map(tankMontiorData => {
            
            return tankMontiorData;
        });
}
getTankMonitorSearch(searchString){
    return this.http.get(URLConstants.TANK_MONITOR_SEARCH_URL,this.getDashboardOptions(CRMConstants.FACILITIES_ID,searchString))
    .map(searchTankData => {
        
        return searchTankData;
    });
}
addOrUpdateTankMonitorSignup(tankSignup){
    return this.http.post(URLConstants.TANK_MONITOR_URL, {name: tankSignup.name, fid: tankSignup.fid,
         address: tankSignup.address, ipAddress:tankSignup.ipAddress})
      .map(tankMontiorData => {
          // Registration response 
          return tankMontiorData;
      });
}
deleteTankMonitorSignup(fid){
    return this.http.delete(URLConstants.TANK_MONITOR_URL,this.getDashboardOptions(CRMConstants.FACILITIES_ID,fid))
    .map(tankMontiorData => {
        
        return tankMontiorData;
    });
}
saveUserPreferences(name,value){
    return this.http.post(URLConstants.USER_PREFERENCES, {name: name, value: value})
     .map(preferencesResult => {
         // Registration response 
         return preferencesResult;
     });
}

getUserPreferences(){
    return this.http.get(URLConstants.USER_PREFERENCES)
     .map(preferencesList => {
         // Registration response 
         return preferencesList;
     });
}
getJobScheduleData(userId) {
    return this.http.get(URLConstants.JOB_SCHEDULE,this.getDashboardOptions(CRMConstants.USER_ID,userId))
        .map(jobScheduleData => {
            
            return jobScheduleData;
        });
}
saveJobScheduleData(job) {
    return this.http.post(URLConstants.JOB_SCHEDULE,job)
        .map(jobScheduleData => {
            
            return jobScheduleData;
        });
}
deleteJobScheduleData(jobName) {
    return this.http.delete(URLConstants.JOB_SCHEDULE,this.getDashboardOptions(CRMConstants.JOB_NAME,jobName))
        .map(result => {
            
            return result;
        });
}
getScheduleJobHisotryData(userId) {
    return this.http.get(URLConstants.JOB_SCHEDULE_HISTORY,this.getDashboardOptions(CRMConstants.USER_ID,userId))
        .map(jobScheduleHistoryData => {
            
            return jobScheduleHistoryData;
        });
}
getTankAlarmHistory(userId) {
    return this.http.get(URLConstants.TANK_ALARM_HISTORY_URL,this.getDashboardOptions(CRMConstants.USER_ID,userId))
        .map(tankAlaramList => {
            
            return tankAlaramList;
        });
}
resetTankAlert(tankAlertString){
    return this.http.post(URLConstants.TANK_ALARM_HISTORY_URL, tankAlertString)
     .map(result => {
         // Registration response 
         return result;
     });
}
getGasLevelsForFacility(FacilitiesId) {
    return this.http.get(URLConstants.GASLEVES_URL,this.getDashboardOptions(CRMConstants.FACILITY_ID,FacilitiesId))
        .map(gaslevelData => {
            
            return gaslevelData;
        });
}
saveGasLevelsForFacility(facilitiesId,gasLevelModal){
    var gasLevel = this.gasLevels(gasLevelModal);
    return this.http.post(URLConstants.GASLEVES_URL, {facilityId: facilitiesId, gaslevels: gasLevel})
     .map(tankMontiorData => {
         // Registration response 
         return tankMontiorData;
     });
}
gasLevels(gasLevelModal){
    var gaslevelString="";
    for(var i=0;i<gasLevelModal.length;i++){
        gaslevelString+=gasLevelModal[i].key+"="+gasLevelModal[i].value+",";
    }
    if(gaslevelString.endsWith(','))
    gaslevelString = gaslevelString.substring(0,gaslevelString.length-1)
return gaslevelString;
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
  private getLeakTankOptions(userId,facilitiesId) {
    return {
      params: new HttpParams().set(CRMConstants.USER_ID,userId).set(CRMConstants.FACILITIES_ID,facilitiesId)
    };
  }   

  getLeakTankDetails(userId,facilitiesId) {
    return this.http.get(URLConstants.LEAKTANK_DETAILS,this.getLeakTankOptions(userId,facilitiesId))
        .map(result => {
            
            return result;
        });
}
getTankStatusDetails(userId,facilitiesId) {
    return this.http.get(URLConstants.TANK_STATUS_DETAILS,this.getLeakTankOptions(userId,facilitiesId))
        .map(result => {
            
            return result;
        });
}
getCSLDTestDetails(userId,facilitiesId) {
    return this.http.get(URLConstants.CSLD_TEST_DETAILS,this.getLeakTankOptions(userId,facilitiesId))
        .map(result => {
            
            return result;
        });
}
resetLeakTankDetails(facilitiesId){
    return this.http.post(URLConstants.LEAKTANK_DETAILS, facilitiesId)
     .map(result => {
         // Registration response 
         return result;
     });
}
resetTankStatusDetails(facilitiesId){
    return this.http.post(URLConstants.TANK_STATUS_DETAILS, facilitiesId)
     .map(result => {
         // Registration response 
         return result;
     });
}
resetCSLDTestDetails(facilitiesId){
    return this.http.post(URLConstants.CSLD_TEST_DETAILS, facilitiesId)
     .map(result => {
         // Registration response 
         return result;
     });
}
}
