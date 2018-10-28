import { Injectable } from '@angular/core';
import 'rxjs/Rx';
import { URLConstants } from '../constants/urlconstants';
import { HttpParams } from '@angular/common/http';
import { CRMConstants } from '../constants/crmconstants';
import { HttpService } from './http.service';

@Injectable()
export class UserService {
  constructor(private http: HttpService) { }

  getAllUsers() {
      return this.http.get(URLConstants.USERS_URL)
          .map(users => {
              
              return users;
          });
  }
  getAllUsersWithSearch(key,searchString) {
    return this.http.get(URLConstants.USERS_SEARCH_URL,this.getSearchOptions(key,searchString))
        .map(users => {
            
            return users;
        });
}
  registerUser(modal){
    return this.http.post(URLConstants.USERS_URL, {id: modal.id, firstName: modal.firstName, lastName: modal.lastName, emailAddress:modal.email, active: modal.active,
      edit: modal.edit,permission:this.getPermission(modal),  admin: modal.admin,userManager:modal.userManager,username:modal.username,password:modal.password,newlyCreated:modal.newlyCreated,imageContent:modal.imageContent })
    .map(user => {
        // Registration response 
        return user;
    });

  }
  getUserHistory(username){
    return this.http.get(URLConstants.USERS_HISTORY_URL,this.getLoginHistoryOption(username))
        .map(userloginHistory => {
            
            return userloginHistory;
        });
  }
  getPermission(modal){
    var facilities = true;
    var companies =true;
    var compliance =true;
    var consolidate = true;
    if(modal.edit)
    {
      facilities = modal.facilities == null?false:modal.facilities;
       companies = modal.companies == null ?false:modal.companies;
       compliance = modal.compliance == null ? false: modal.compliance;
       consolidate = modal.consolidate == null ? false: modal.consolidate;
    }
    return "facilities:"+facilities +"__##__companies:"+companies+"__##__compliance:"+ compliance+"__##__consolidate:"+ consolidate
  }
  private getLoginHistoryOption(username){
    return {
      params: new HttpParams().set(CRMConstants.USER_ID,username)
    };
  }
  private getSearchOptions(type,value) {
    return {
      params: new HttpParams().set(CRMConstants.USER_SEARCH_TYPE,type).set(CRMConstants.USER_SEARCH_VALUE,value)
    };
  }   
}
