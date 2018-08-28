import { Injectable } from '@angular/core';
import 'rxjs/Rx';
import { URLConstants } from '../constants/urlconstants';
import { HttpClient, HttpParams } from '@angular/common/http';
import { CRMConstants } from '../constants/crmconstants';

@Injectable()
export class UserService {
  constructor(private http: HttpClient) { }

  getAllUsers() {
      return this.http.get<any>(URLConstants.USERS_URL)
          .map(users => {
              
              return users;
          });
  }
  getAllUsersWithSearch(key,searchString) {
    return this.http.get<any>(URLConstants.USERS_SEARCH_URL,this.getSearchOptions(key,searchString))
        .map(users => {
            
            return users;
        });
}
  registerUser(modal){
    return this.http.post<any>(URLConstants.USERS_URL, { firstName: modal.firstName, lastName: modal.lastName, emailAddress:modal.email, active: modal.active,
      edit: modal.edit,permission:this.getPermission(modal),  admin: modal.admin,username:modal.username,password:modal.password,newlyCreated:modal.newlyCreated,imageContent:modal.imageContent })
    .map(user => {
        // Registration response 
        return user;
    });

  }
  getPermission(modal){
    var fecilities = true;
    var companies =true;
    var compliance =true;
    var consolidate = true;
    if(modal.edit)
    {
      fecilities = modal.fecilities == null?false:modal.fecilities;
       companies = modal.companies == null ?false:modal.companies;
       compliance = modal.compliance == null ? false: modal.compliance;
       consolidate = modal.consolidate == null ? false: modal.consolidate;
    }
    return "fecilities:"+fecilities +"__##__companies:"+companies+"__##__compliance:"+ compliance+"__##__consolidate:"+ consolidate
  }
  private getSearchOptions(type,value) {
    return {
      params: new HttpParams().set(CRMConstants.USER_SEARCH_TYPE,type).set(CRMConstants.USER_SEARCH_Value,value)
    };
  }   
}
