import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CommonService } from './services/common.service';
import { AuthenticationService } from './services/authentication.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit{
  visibleSidebar=false;
  constructor(private router: Router,public commonService: CommonService,public  authService:AuthenticationService){
  }
  searchOptions = [
    {name: 'All', code: 'all'},
    {name: 'Name', code: 'name'},
    {name: 'FID', code: 'fid'},
    {name: 'Address ', code: 'address'}
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
  onFecilitiesDataSelect(){
    this.commonService.selectedLeftTab("fecilities")
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
  fetchSearchResults(){
    console.log(this.searchString+"  ",this.selectedSearchOption)
  }
}
