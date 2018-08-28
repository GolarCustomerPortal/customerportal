import { Component, OnInit, ViewChild } from '@angular/core';
import { UserService } from '../services/user.service';
import { FormGroup, NgForm } from '@angular/forms';
import { TreeNode, TreeModule, Tree } from 'primeng/primeng';
import { CommonService } from '../services/common.service';
import { Router } from '@angular/router';

@Component({
  selector: 'golars-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {
  model: any = {};
  isEdit;
  showSuccessMessage = false;
  showFailureMessage = false;
  successMessage = null;
  failureMessage = null;
  disableRegisterButton = false;
  selectedDropdownOption;
  searchString;
  showSearch = true;
  showRegister=false;
  dropdownSearch  = [
    {name: 'First Name', value: 'fname'},
    {name: 'Last Name', value: 'lName'},
    {name: 'Email Address', value: 'email'},
];
  user;
  userList =[];
  constructor(private router: Router,private userService: UserService, private commonService: CommonService){

  }
  ngOnInit(){
    this.user = this.commonService.getEditUser();
    if (this.user !== null && this.user !== undefined) {
      this.user = JSON.parse(this.user);
      this.isEdit = true;
      this.populateFields();
     setTimeout(() => {
      this.router.navigate(['newuser']);
     }, 10);
    }
  }
  populateFields() {
    this.model.firstName = this.user.firstName;
    this.model.lastName = this.user.lastName;
    this.model.email = this.user.emailAddress;
    this.model.admin = this.user.admin;
    // this.model.active = this.user.active;
    this.model.username = this.user.username;
    this.model.password = this.user.password;
    this.model.fecilities = this.commonService.getPreferencesOfFecilities();
    this.model.companies = this.commonService.getPreferencesOfCompanies();
    this.model.compliance = this.commonService.getPreferencesOfCompliance();
    this.model.consolidate = this.commonService.getPreferencesOfConsolidate();
  }
  resetSuccessAndFailureMessages() {
    this.showSuccessMessage = false;
    this.showFailureMessage = false;
    this.successMessage = null;
    this.failureMessage = null;
    this.disableRegisterButton = false;
  }
  handleInputChange(event){
    var image = event.target.files[0];

    var pattern = /image-*/;
    var reader = new FileReader();

    if (!image.type.match(pattern)) {
        console.error('File is not an image');
        //of course you can show an alert message here
        return;
    }
    
    var reader = new FileReader();
var self=this;
    reader.onload = function(e) {
      self.model.imageContent = reader.result;
  console.log(self.model.imageContent)
    };

    reader.readAsDataURL(image);
}
  register() {
    this.resetSuccessAndFailureMessages();
    if(this.isEdit){
      this.model.edit = this.isEdit;
    }
    this.model.newlyCreated = true;
    this.userService.registerUser(this.model)
      .subscribe(
        user => {
          if (user != null && user != undefined) {

            // this.model=[];
            this.showSuccessMessage = true;
            if(this.isEdit){
              this.successMessage = "User Updated Successfully.";
              // if(this.commonService.isSecondaryUserPresent())
              // this.commonService.addSecondaryUser(user)
              // else
              this.commonService.addPrimaryUser(user);
              this.commonService.removeEditUser();
            }else

            this.successMessage = "User Created Successfully.";
            this.disableRegisterButton = true;
            //   this.model=[];
            //   this.formElem.form.reset();
            //   Object.keys(this.formElem.controls).forEach(control => {
            //     this.formElem.controls[control].setErrors(null);
            //     this.formElem.controls[control].markAsPristine();

            // });
          } else {
            this.showFailureMessage = true;
            this.failureMessage = "User Already Exists.";
          }
          // console.log(result)
        },
        error => {
          console.log(error)
        });
  }
  setUser(user)
  {
    this.user = user;
  }
  searchUsers(){
    this.userService.getAllUsersWithSearch(this.selectedDropdownOption.value,this.searchString)
    .subscribe(
      userList => {
       console.log(userList);
       this.userList = userList;
      },
      error => {
        console.log(error);
      });
  }
  cancelClick(){
    this.commonService.removeEditUser();
    this.router.navigate(['/login']);
  }
  
}
