import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map'
import { URLConstants } from '../constants/urlconstants';
import { CommonService } from './common.service';
import { Router } from '@angular/router';
import { CRMConstants } from '../constants/crmconstants';

@Injectable()
export class AuthenticationService {

    constructor(private http: HttpClient,private commonService:CommonService,private router: Router) { }

    login(username: string, password: string,fromApp: boolean) {
        return this.http.post<any>(URLConstants.LOGIN_URL, { username: username, password: password,fromApp:fromApp })
            .map(user => {
                // login successful if there's a token in the response
                if (user && user.token) {
                    // store user details and token in local storage to keep user logged in between page refreshes
                    this.commonService.addPrimaryUser(JSON.stringify(user))
              }

                return user;
            });
    }

    logout() {
        // remove user from local storage to log user out
        if(localStorage.getItem('secondaryUser')!=null){
            localStorage.removeItem('secondaryUser'); 
            // localStorage.removeItem('secondaryusername');
            // localStorage.removeItem('secondaryadmin');
            // localStorage.removeItem('secondaryuserfullname');
            location.reload();
        }else{
            localStorage.removeItem('currentUser');
            // localStorage.removeItem('primaryusername');
            // localStorage.removeItem('primaryadmin');
            // localStorage.removeItem('primaryuserfullname');
            localStorage.clear();
            this.commonService.resetLogin();
            location.reload();
        }
    }
    changePassword(modal){
        return this.http.post<any>(URLConstants.USER_CHANGE_PASSWORD_URL, { username: modal.username, password: modal.password, updatedPassword:modal.confirmPassword,reset:modal.reset })
        .map(successMessage => {
            // Change password response
            return successMessage;
        });
    
      }
      private getDeleteUserOptions(username) {
        return {
          params: new HttpParams().set(CRMConstants.USER_ID,username)
        };
      }
   
}