import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CommonService } from './services/common.service';
import { AuthenticationService } from './services/authentication.service';
import { DashboardService } from './services/dashboard.service';
import { CRMConstants } from './constants/crmconstants';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit{
  visibleSidebar=false;
  crmConst = CRMConstants;
  constructor(private router: Router,public commonService: CommonService,public  authService:AuthenticationService,private dashboardService: DashboardService){
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
    this.commonService.removeEditUser();
    if(!this.commonService.checkValidLogin())
     this.router.navigate(['/login']);
    
  }
  showAll(){
    this.router.navigate(['/']);
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
        console.log(searchResultList)
      },
      error => {
        console.log(error);
      });
  }
}
