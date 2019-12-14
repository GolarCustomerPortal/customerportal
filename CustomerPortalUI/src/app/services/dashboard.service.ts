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
getNotifictionUSTCertificationUploadData(FacilitiesId){
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

saveSiteIncome(incomeModel){
    return this.http.post(URLConstants.SITE_INCOME, {accountID: incomeModel.accountID, fID: incomeModel.fID
        , fromDate: incomeModel.fromFormatedDate, gallonsSold: incomeModel.gallonsSold, gasAmount: incomeModel.gasAmount, insideSalesAmount: incomeModel.insideSalesAmount
        , lotteryAmount: incomeModel.lotteryAmount, scratchOffSold: incomeModel.scratchOffSold, toDate: incomeModel.toFormatedDate,dataEnteredBy:incomeModel.dataEnteredBy,
        tax:incomeModel.tax,id:incomeModel.id,salesforceId:incomeModel.salesforceId,createdDate:incomeModel.createdDate,modifiedDate:incomeModel.modifiedDate})
     .map(incomeResult => {
         // Registration response 
         return incomeResult;
     });
}
deleteSiteIncome(incomeModel){
    return this.http.delete(URLConstants.SITE_INCOME,this.getIncomeDeleteOptions(incomeModel))
    .map(incomeResult => {
        
        return incomeResult;
    });
}
deleteSiteExpenses(expenseModel){
    return this.http.delete(URLConstants.SITE_EXPENDITURE,this.getExpenseDeleteOptions(expenseModel))
    .map(incomeResult => {
        
        return incomeResult;
    });
}


saveSiteExpenditure(expenditureModel){
    return this.http.post(URLConstants.SITE_EXPENDITURE, {accountID: expenditureModel.accountID, fID: expenditureModel.fID,amount: expenditureModel.amount
        , date: expenditureModel.checkFormateddate,checkNo: expenditureModel.checkNo, vendor: expenditureModel.vendor.value,dataEnteredBy:expenditureModel.dataEnteredBy,
    others:expenditureModel.others,id:expenditureModel.id,salesforceId:expenditureModel.salesforceId,createdDate:expenditureModel.createdDate,modifiedDate:expenditureModel.modifiedDate})
     .map(incomeResult => {
         // Registration response 
         return incomeResult;
     });
}
getIncomeChartDetails(incomeChartModel,month){
    return this.http.get(URLConstants.SITE_INCOME_CHART_DETAIL,this.getIncomeExpenseOptionsChartDetails(incomeChartModel,month))
    .map(expensesData => {
        
        return expensesData;
    });
}
getExpensesChartDetails(incomeChartModel,month){
    return this.http.get(URLConstants.SITE_EXPENSES_CHART_DETAIL,this.getIncomeExpenseOptionsChartDetails(incomeChartModel,month))
    .map(expensesData => {
        
        return expensesData;
    });
}
saveIncomePicklistValue(labels){
    return this.http.post(URLConstants.SITE_INCOME_PICKLIST, {value:labels})
     .map(incomeResult => {
         // Registration response 
         return incomeResult;
     });
}
getIncomePicklistValue(){
    return this.http.get(URLConstants.SITE_INCOME_PICKLIST)
     .map(incomeResult => {
         // Registration response 
         return incomeResult;
     });
}
getExpendatureData(expensesModel){
    return this.http.get(URLConstants.SITE_EXPENDITURE,this.getExpensesOptions(expensesModel))
    .map(expensesData => {
        
        return expensesData;
    });
}
getExpensesForCustomDate(expensesModel){
    return this.http.get(URLConstants.SITE_EXPENDITURE_CUSTOM_DATE,this.getExpensesOptionsForCustomDate(expensesModel))
    .map(expensesData => {
        
        return expensesData;
    });
}
getIncomeForCustomDate(incomeModel){
    return this.http.get(URLConstants.SITE_INCOME_MONTHLY_CUSTOM_DATE,this.getIncomeOptionsCustomDate(incomeModel))
    .map(expensesData => {
        
        return expensesData;
    });
}
getIncomeDataByMonthly(incomeChartModel){
    return this.http.get(URLConstants.SITE_INCOME,this.getIncomeOptions(incomeChartModel))
    .map(expensesData => {
        
        return expensesData;
    });
}
getIncomeDataByType(incomeChartModel){
    return this.http.get(URLConstants.SITE_INCOME_TYPE,this.getIncomeOptions(incomeChartModel))
    .map(expensesData => {
        
        return expensesData;
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
private getExpensesOptions(expensesModel) {
    return {
      params: new HttpParams().set(CRMConstants.USER_ID,expensesModel.id).set(CRMConstants.FACILITY_ID,expensesModel.accountID).set(CRMConstants.STARTDATE,expensesModel.fromFormatedDate)
      .set(CRMConstants.ENDDATE,expensesModel.endFormatedDate)
    };
  }
  private getIncomeOptions(incomeChartModel) {
    return {
      params: new HttpParams().set(CRMConstants.USER_ID,incomeChartModel.id).set(CRMConstants.FACILITY_ID,incomeChartModel.accountID).set(CRMConstants.STARTDATE,incomeChartModel.fromFormatedDate)
      .set(CRMConstants.ENDDATE,incomeChartModel.endFormatedDate).set(CRMConstants.CHARTTYPE,incomeChartModel.chartType)
    };
  }
  private getIncomeExpenseOptionsChartDetails(model,month) {
    return {
      params: new HttpParams().set(CRMConstants.USER_ID,model.id).set(CRMConstants.FACILITY_ID,model.accountID).set(CRMConstants.STARTDATE,model.fromFormatedDate)
      .set(CRMConstants.ENDDATE,model.endFormatedDate).set(CRMConstants.CHARTTYPE,model.chartType).set(CRMConstants.MONTH,month)
    };
  }
  private getIncomeOptionsCustomDate(incomeModel) {
    return {
      params: new HttpParams().set(CRMConstants.USER_ID,incomeModel.accountID).set(CRMConstants.FACILITY_ID,incomeModel.accountID).set(CRMConstants.STARTDATE,incomeModel.fromFormatedDate)
      .set(CRMConstants.ENDDATE,incomeModel.toFormatedDate)
    };
  }
  private getExpensesOptionsForCustomDate(expensesModel) {
    return {
      params: new HttpParams().set(CRMConstants.USER_ID,expensesModel.dataEnteredBy).set(CRMConstants.FACILITY_ID,expensesModel.accountID).set(CRMConstants.STARTDATE,expensesModel.fromCheckdate)
      .set(CRMConstants.ENDDATE,expensesModel.toCheckdate)
    };
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
private getIncomeDeleteOptions(incomeModel) {
    return {
      params: new HttpParams().set(CRMConstants.SITE_INCOME_ID,incomeModel.id).set(CRMConstants.USER_ID,incomeModel.dataEnteredBy).set(CRMConstants.FACILITY_ID,incomeModel.accountID)
    };
  }
  private getExpenseDeleteOptions(expenseModel) {
    return {
      params: new HttpParams().set(CRMConstants.SITE_INCOME_ID,expenseModel.id).set(CRMConstants.USER_ID,expenseModel.dataEnteredBy).set(CRMConstants.FACILITY_ID,expenseModel.accountID)
    };
  }

}
