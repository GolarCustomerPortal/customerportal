import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map'
import { URLConstants } from '../constants/urlconstants';
import { CommonService } from './common.service';
import { Router } from '@angular/router';

@Injectable()
export class AuthenticationService {

    constructor(private http: HttpClient,private commonService:CommonService,private router: Router) { }

    login(username: string, password: string) {
        return this.http.post<any>(URLConstants.LOGIN_URL, { username: username, password: password })
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
   
}