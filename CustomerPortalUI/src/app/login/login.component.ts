import { Injectable, Component, OnInit } from '@angular/core';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs/Rx';
import { Router, ActivatedRoute } from '@angular/router';
import { AuthenticationService } from '../services/authentication.service';
import { CommonService } from '../services/common.service';
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
    private authenticationService: AuthenticationService,private commonService:CommonService) { }
  showResetPasswordMessage = false;
  showResetPasswordFaiedMessage = false;
  resetPasswordFailedMessage = ""
  resetPasswordMessage = "";
  loginErrorMessage = null;
  requestSent = false;
  ngOnInit() {
    if(this.commonService.checkValidLogin()){
      
console.log("login init")
    this.router.navigate(['/']);
    }
  }
  

  login() {
    this.authenticationService.login(this.model.username, this.model.password)
      .subscribe(
        data => {
         this.commonService.validLogin();
         this.commonService.addPrimaryUser(data);
          this.router.navigate(["/"]);
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
 }
