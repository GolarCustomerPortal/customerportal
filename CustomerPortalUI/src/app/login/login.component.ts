import { Injectable, Component, OnInit, ViewChild } from '@angular/core';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs/Rx';
import { Router, ActivatedRoute } from '@angular/router';
import { AuthenticationService } from '../services/authentication.service';
import { CommonService } from '../services/common.service';
import { FormGroup } from '@angular/forms';
declare var $: any;
@Component({
  selector: 'customerportal-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  model: any = {};
  cols;
  loginData: string = ""

  returnUrl: string;
  forgotemail;
  constructor(private router: Router, 
    public authenticationService: AuthenticationService,private commonService:CommonService) { }
  showResetPasswordMessage = false;
  showResetPasswordFaiedMessage = false;
  resetPasswordFailedMessage = ""
  resetPasswordMessage = "";
  loginErrorMessage = null;
  requestSent = false;
  newlyCretedUser = false;
  //reset password start
  showSuccessMessage=false;
  showresetErrorMessage = false;
  @ViewChild('f') formGroup: FormGroup; 
  username; 
  passwordDoesnotmatch=false; 
  //reset password end
  ngOnInit() {
    if(this.commonService.checkValidLogin()){
      
console.log("login init")
    this.router.navigate(['/']);
    }
  }
  

  login() {
    this.authenticationService.login(this.model.username, this.model.password,false)
      .subscribe(
        data => {
          if(data == null){
            this.loginErrorMessage = "Invalid Username or Password";
            return;
          }
          if(data.newlyCreated != null && data.newlyCreated === true){
          this.newlyCretedUser = true;
          this.username = data.username;
        }else{
         this.commonService.validLogin();
         this.commonService.addPrimaryUser(data);
          this.router.navigate(["/"]);
        }
        },
        error => {
          this.loginErrorMessage = "Invalid Username or Password";
          console.log(error);
        });
  }
  
  private handleError(error: any) {
    console.log(error)
    return Observable.throw(error);
  }
  resetSuccessAndFailureMessages() {
    this.showResetPasswordMessage = false;
    this.showResetPasswordFaiedMessage = false;
    this.resetPasswordFailedMessage = ""
    this.resetPasswordMessage = "";
  }
  //reset password start
  changePassword(){
    this.model.username = this.username;
    this.model.reset = false;
  if(this.model != null && this.model.newPassword!=null &&  this.model.confirmPassword != null  && this.model.newPassword !== this.model.confirmPassword){
  this.formGroup.controls['confirmPassword'].setErrors({'mismatch': true});
  this.passwordDoesnotmatch=true;
  }else{
this.authenticationService.changePassword(this.model) .subscribe(
  data => {
     // console.log(message)
     if(data === true){
  this.showSuccessMessage=true;
  // this.authenticationService.logout();
  
    //  console.log(data)
    }else{
     this.showresetErrorMessage =true; 
    }
  },
  error => {
    console.log(error)
  });
  }
}
  logout(){
    this.authenticationService.logout();
  }
  // reset password end
 }
