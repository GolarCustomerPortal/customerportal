import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { CommonService } from './services/common.service';
import { AuthenticationService } from './services/authentication.service';
import { DashboardService } from './services/dashboard.service';
import { CRMConstants } from './constants/crmconstants';
import { AccordionTab } from 'primeng/primeng';
declare var $: any;
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit{
  visibleSidebar=false;
  crmConst = CRMConstants;
  alertList;
  alarmHistory;
  activeIndex=0;
  facilityReport=false;
  @ViewChild('tankAccordian') tankAccordian: any; 
  constructor(private router: Router,public commonService: CommonService,public  authService:AuthenticationService,private dashboardService: DashboardService){
  console.log("AppComponent---");
 
  }
  onTabOpen($event){
    for(var i=0;i<this.tankAccordian.tabs.length;i++)
    this.tankAccordian.tabs[i].selected=false;
    this.tankAccordian.tabs[$event.index].selected=true
  }

  searchOptions = [
    {name: 'All', value: 'all'},
    {name: 'Name', value: 'name'},
    {name: 'FID', value: 'fid'},
    {name: 'Address ', value: 'address'}
];
selectedSearchOption = this.searchOptions[0];
  searchString;
  ngOnInit(){
    var self = this;
    $('#tankalert').on('hidden.bs.modal', function (e) {
      self.resetTankAlert();
    })
    this.commonService.removeEditUser();
    if(window.location.href.indexOf("facilityReport")>0){
      this.facilityReport =true;
      return;
    }

    if(!this.commonService.checkValidLogin())
     this.router.navigate(['/login']);
    
  }
  showAll(){
    this.router.navigate(['/dummy']);
  }
  onFacilitiesDataSelect(){
    this.commonService.selectedLeftTab("facilities")
    this.router.navigate(['/']);
  }
  onCompaniesDataSelect(){
    this.commonService.selectedLeftTab("companies")
    this.router.navigate(['/']);
  }
  onComplianceDataSelect(){
    this.commonService.selectedLeftTab("compliance")
    this.router.navigate(['/']);
  }
  editUser(){
    this.commonService.updateUserforEdit(this.commonService.getPrimaryUser());
    setTimeout(() => {
      this.router.navigate(['newuser']);
    }, 50);
  }
  onUSSBOASelect(){
    this.router.navigate(['ussboa']);
  }
  fetchSearchResults(){
    this.commonService.setSearchString(this.searchString);
    console.log(this.searchString+"  ",this.selectedSearchOption)
    this.dashboardService.searchResults(this.selectedSearchOption.value,this.searchString,this.commonService.getUserName(),this.commonService.isAdmin()) .subscribe(
      searchResultList => {
        this.commonService.storeSearchResult(JSON.stringify(searchResultList));
        this.router.navigate(['/#']);
       
      },
      error => {
        console.log(error);
      });
  }
  getAlertData(){
    // this.commonService.removeTankAlert();
    this.alarmHistory=[];
   
    this.dashboardService.getTankAlarmHistory(this.commonService.getUserName()) // retrieve all thd parent folders
      .subscribe(
        tankAlaramList => {
          if (tankAlaramList != null) {
            this.commonService.setTankAlert(tankAlaramList);
            this.alertList = tankAlaramList;
         if(this.alertList != null && this.alertList[0] != null )
           this.alarmHistory = this.alertList[0].alarmHistory;
          }
        },
        error => {
          console.log(error);
        });
  }
  resetTankAlert(){
    if(this.alertList != null && this.alertList.length>0){
      var alertFacilities = this.getAlertFacilities();
      this.dashboardService.resetTankAlert(alertFacilities) .subscribe(
        result => {
          if(result == true)
          this.commonService.removeTankAlert();
        },
        error => {
          console.log(error);
        });
    }
  }
  setAlarmTableValue(alert){
    this.alarmHistory = alert.alarmHistory;
  }
  getAlertFacilities(){
  var idString="";
    for(var i=0;i<this.alertList.length;i++){
      var alrmHistory = this.alertList[i].alarmHistory;
      for(var j=0;j<alrmHistory.length;j++){
        if(alrmHistory[j].viewed ==null || alrmHistory[j].viewed == 'false')
        idString+=alrmHistory[j].id+",";
     } 
      // idString+=this.alertList[i].id+",";
   } 
   if(idString.endsWith(","))
   idString = idString.substring(0,idString.length-1);
   return idString;
  }
}
