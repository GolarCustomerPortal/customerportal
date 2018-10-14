import { Component, OnInit } from '@angular/core';
import { DashboardService } from '../services/dashboard.service';
import { CommonService } from '../services/common.service';

@Component({
  selector: 'tank-monitor-signup',
  templateUrl: './tank-monitor-signup.component.html',
  styleUrls: ['./tank-monitor-signup.component.css']
})
export class TankMonitorSignupComponent implements OnInit {

  constructor(private commonService: CommonService,private dashboardService: DashboardService) { }
tankMonitorSignupData;
tankMonitorRegisterData=[];
searchString;
tankSignup;
showAdd=false;
showUpdate = false;
showDelete = false;
showNoResultSearchMessage = false;
updateFailedMessage="";
updateSuccessMessage ="";
showUpdateFailedMessage = false;
showUpdateSuccessMessage = false;
showPathSuccessMessage = false;;
pathSuccessMessage;
tankMonitorPath;
  ngOnInit() {
    this.dashboardService.getUserPreferences()
    .subscribe(
      userPrefList => {
          if(userPrefList != null){
            this.tankMonitorPath = this.commonService.getValueForName(userPrefList,"tankMonitorPath")
          }
      },
      error => {
        console.log(error);
      });

    this.dashboardService.getTankMonitorSignupData()
    .subscribe(
      data => {
        this.tankMonitorSignupData = JSON.parse(JSON.stringify(data));;
          // data.fo
          
      },
      error => {
        console.log(error);
      });
  }
  searchtankMonitorFid(){
   this.resetFlags();
   this.tankMonitorRegisterData=[];
    this.dashboardService.getTankMonitorSearch(this.searchString)
    .subscribe(
      data => {
        if(data == null || data.length == 0){
          this.showNoResultSearchMessage=true;
        }
        this.tankSignup = data;
        this.tankMonitorRegisterData.push(this.tankSignup);
        if(data.ipAddress == null)
        this.showAdd = true;
        else
        {
          this.showUpdate=true;
          this.showDelete=true;
        }
        // if(tankList!=null && tankList.length>20){
        //   this.showMoreResultSearchMessage = true;
        // }
       console.log(data);
      //  this.userList = tankList;
      },
      error => {
        console.log(error);
      });
  }
  addOrUpdateTankMonitorSignup(){
    this.dashboardService.addOrUpdateTankMonitorSignup(this.tankSignup)
    .subscribe(
      data => {
        
        if(data == null || data == 'false'){
          if(this.showAdd)
          this.updateFailedMessage = "Add Tank Monitor is Failed."
          if(!this.showAdd)
          this.updateFailedMessage = "Update Tank Monitor is Failed."
          this.showUpdateFailedMessage=true;
        }else{
          this.showUpdateSuccessMessage=true;
          if(this.showAdd)
          this.updateSuccessMessage = "Tank Monitor Added Successfully."
          if(!this.showAdd)
          this.updateSuccessMessage = "Tank Monitor Updated Successfully."
        }
        this.tankMonitorSignupData = JSON.parse(JSON.stringify(data));;
        // if(tankList!=null && tankList.length>20){
        //   this.showMoreResultSearchMessage = true;
        // }
       console.log(data);
      //  this.userList = tankList;
      },
      error => {
        console.log(error);
      });
  }
 
  deleteTankMonitorSignup(){
    this.resetFlags();
    this.dashboardService.deleteTankMonitorSignup(this.tankSignup.fid)
    .subscribe(
      data => {
        if(data == null || data == 'false'){
          this.updateFailedMessage = "Delete Tank Monitor is Failed."
          this.showUpdateFailedMessage=true;
        }else{
          this.showUpdateSuccessMessage=true;
          this.updateSuccessMessage = "Tank Monitor Deleted Successfully."
        }
        // this.tankSignup = null;
        this.tankMonitorSignupData = JSON.parse(JSON.stringify(data));;
        // if(tankList!=null && tankList.length>20){
        //   this.showMoreResultSearchMessage = true;
        // }
       console.log(data);
      //  this.userList = tankList;
      },
      error => {
        console.log(error);
      });
  }
  saveUserPreferences(){
    this.dashboardService.saveUserPreferences('tankMonitorPath',this.tankMonitorPath)
    .subscribe(
      data => {
          this.showPathSuccessMessage=true;
          this.pathSuccessMessage = "Tank Monitor Path Saved Successfully."
      },
      error => {
        console.log(error);
      });
  }
  resetFlags(){
    this.showAdd = false;
    this.showUpdate=false;
    this.showDelete=false;
    // this.tankSignup = null;
    this.showNoResultSearchMessage = false;
    // this.tankMonitorRegisterData =[];
    this.showNoResultSearchMessage = false;
    this.showUpdateFailedMessage = false;
    this.showUpdateSuccessMessage = false;
  }
}
