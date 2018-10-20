import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CommonService } from './services/common.service';
import { AuthenticationService } from './services/authentication.service';
import { DashboardService } from './services/dashboard.service';
import { CRMConstants } from './constants/crmconstants';
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
  constructor(private router: Router,public commonService: CommonService,public  authService:AuthenticationService,private dashboardService: DashboardService){
  console.log("AppComponent---");
 
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
    this.alertList = this.commonService.getTankAlert();
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
  getAlertFacilities(){
  var idString="";
    for(var i=0;i<this.alertList.length;i++){
      idString+=this.alertList[i].id+",";
   } 
   if(idString.endsWith(","))
   idString = idString.substring(0,idString.length-1);
   return idString;
  }
}
