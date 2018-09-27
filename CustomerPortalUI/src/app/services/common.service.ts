import { Subject } from "rxjs";


export class CommonService {
  gasStationImages={'bp':'bp.png','shell':'shell.png'}
  loginSuccessful = false;;
  checkValidLogin() {
    if (localStorage.getItem('loginSuccessful') == "true")
      return true;
    return false;
  }
  validLogin() {
    this.loginSuccessful = true;
    localStorage.setItem('loginSuccessful', this.loginSuccessful + "");
  }
  resetLogin() {
    localStorage.setItem('loginSuccessful', false + "");
  }
  getUserName(){
    var user;
    if (localStorage.getItem('secondaryUser')) {
      user = localStorage.getItem('secondaryUser');
      var localuser = JSON.parse(user);
      // return localuser.username;
      if(user.id == null)
      return "0033600000M1YNjAAN";
      return user.id;

    }else
      user = localStorage.getItem('primaryUser');
    if (user != null && user != undefined) {
      var localuser = JSON.parse(user);
      // return localuser.username;
      if(user.id == null)
      return "0033600000M1YNjAAN";
      return user.id;

    }
  }
  addPrimaryUser(user) {
    localStorage.setItem('primaryUser', JSON.stringify(user));
    var permission = user.permission;
    if (permission !== null && permission !== undefined) {
      var permissionArray = permission.split("__##__");
      for (var i = 0; i < permissionArray.length; i++) {
        var indPermission = permissionArray[i];
        var indPermissionArray = indPermission.split(":");
        localStorage.setItem("primary" + indPermissionArray[0], indPermissionArray[1]);
      }
    }
    // localStorage.setItem('primaryusername', user.username);
    // localStorage.setItem('primaryuserfullname', user.username);
    localStorage.setItem('primaryadmin', user.admin);
  }
  getPreferencesOfFacilities() {
    var facilities = null;
    if (this.isSecondaryUserPresent()) {
      if (localStorage.getItem('secondaryfacilities') != null)
        facilities = localStorage.getItem('secondaryfacilities')
    }else  
    if (this.isEditUserPresent()) {
      if (localStorage.getItem('editfacilities') != null)
        facilities = localStorage.getItem('editfacilities')
    } else if (localStorage.getItem('primaryfacilities') != null)
      facilities = localStorage.getItem('primaryfacilities');
    if (facilities != null && facilities === "false")
      return false;
    return true;

  }
  getPreferencesOfCompanies() {
    var Facilities = null;
    if (this.isSecondaryUserPresent()) {
      if (localStorage.getItem('secondarycompanies') != null)
        Facilities = localStorage.getItem('secondarycompanies')
    }else  
    if (this.isEditUserPresent()) {
      if (localStorage.getItem('editcompanies') != null)
        Facilities = localStorage.getItem('editcompanies')
    }  else if (localStorage.getItem('primarycompanies') != null)
      Facilities = localStorage.getItem('primarycompanies');
    if (Facilities != null && Facilities === "false")
      return false;
    return true;

  }
  getPreferencesOfCompliance() {
    var Facilities = null;
    if (this.isSecondaryUserPresent()) {
      if (localStorage.getItem('secondarycompliance') != null)
        Facilities = localStorage.getItem('secondarycompliance')
    }else  
    if (this.isEditUserPresent()) {
      if (localStorage.getItem('editcompliance') != null)
        Facilities = localStorage.getItem('editcompliance')
    }  else if (localStorage.getItem('primarycompliance') != null)
      Facilities = localStorage.getItem('primarycompliance');
    if (Facilities != null && Facilities === "false")
      return false;
    return true;

  }
  getPreferencesOfConsolidate() {
    var Facilities = null;
    if (this.isSecondaryUserPresent()) {
      if (localStorage.getItem('secondaryconsolidate') != null)
        Facilities = localStorage.getItem('secondaryconsolidate')
    }else  
    if (this.isEditUserPresent()) {
      if (localStorage.getItem('editconsolidate') != null)
        Facilities = localStorage.getItem('editconsolidate')
    }   else if (localStorage.getItem('primaryconsolidate') != null)
      Facilities = localStorage.getItem('primaryconsolidate');
    if (Facilities != null && Facilities === "false")
      return false;
    return true;

  }
  addUserPreferences(user,usertype,type) {
    localStorage.setItem(usertype, JSON.stringify(user));
    var permission = user.permission;
    if (permission !== null && permission !== undefined) {
      var permissionArray = permission.split("__##__");
      for (var i = 0; i < permissionArray.length; i++) {
        var indPermission = permissionArray[i];
        var indPermissionArray = indPermission.split(":");
        localStorage.setItem(type + indPermissionArray[0], indPermissionArray[1]);
      }
      // localStorage.setItem('secondaryusername', user.username);
      // localStorage.setItem('secondaryuserfullname', user.firstName+" "+user.lastName);
      // localStorage.setItem('secondaryadmin', user.admin);
    }
  }
  isSecondaryUserPresent() {
    if (localStorage.getItem('secondaryUser') != null)
      return true;
    return false;
  }
  isEditUserPresent() {
    if (localStorage.getItem('editUser') != null)
      return true;
    return false;
  }
  checkForSameUser(user) {
    if (localStorage.getItem('primaryUser')) {
      var localuser = localStorage.getItem('primaryUser');
      if (localuser != null && localuser != undefined) {
        var userObj = JSON.parse(localuser);
        if (userObj.username == user.username)
          return true;
      }
    }
    return false;
  }
  removeEditUser() {
    localStorage.removeItem("editUser");
  }
  updateUser() {
    if (localStorage.getItem('secondaryUser')) {
      localStorage.setItem('editUser', localStorage.getItem('secondaryUser'));
    }
    else if (localStorage.getItem('primaryUser')) {
      localStorage.setItem('editUser', localStorage.getItem('primaryUser'));
    }
  }
  updateUserforEdit(user){
    localStorage.setItem('editUser', JSON.stringify(user));
    this.addUserPreferences(user,'editUser','edit')
  }
  getEditUser() {
    if (localStorage.getItem("editUser") !== null)
      return localStorage.getItem("editUser");
    else
      return null;

  }
  selectedLeftTab(selectedLeftTab) {
    localStorage.setItem('selectedLeftTab', selectedLeftTab);
  }
  resetselectedLeftTab() {
    localStorage.removeItem('selectedLeftTab');
  }
  getSelectedLeftTab() {
    return localStorage.getItem('selectedLeftTab');
  }
  setSearchString(searchString){
    localStorage.setItem('searchString', searchString);
  }
  getSearchString(){
    return localStorage.getItem('searchString');
  }
  storeSearchResult(searchResult){
    localStorage.setItem('searchResult', searchResult);
  }
  getSearchResult(){
    return localStorage.getItem('searchResult');
  }
  resetSearchResult() {
    localStorage.removeItem('searchResult');
  }

  getFullName() {
    var user;
    if (localStorage.getItem('secondaryUser')) {
      user = localStorage.getItem('secondaryUser');
      if (user != null && user != undefined) {
        var localuser = JSON.parse(user);
        return localuser.firstName + " " + localuser.lastName;
      }
    }
    else
      user = localStorage.getItem('primaryUser');
    if (user != null && user != undefined) {
      var localuser = JSON.parse(user);
      return localuser.fullName;

    }

  }
  getImage() {
    var user;
    if (localStorage.getItem('secondaryUser')) {
      user = localStorage.getItem('secondaryUser');
      if (user != null && user != undefined) {
        var localuser = JSON.parse(user);
        return localuser.imageContent;
      }
    }
    else
      user = localStorage.getItem('primaryUser');
    if (user != null && user != undefined) {
      var localuser = JSON.parse(user);
      return localuser.imageContent;

    }
  }
  gasStationImage(gasStation){
    return this.gasStationImages[gasStation.toLowerCase()];
  }

  isAdmin(){
    if (localStorage.getItem('secondaryUser')) {
      return false;
    }
    var user = localStorage.getItem('primaryUser');
    if (user != null && user != undefined) {
      var localuser = JSON.parse(user);
      return localuser.admin;

    }
  }
  getPrimaryUser() {
    if (localStorage.getItem('primaryUser')) {
      var localuser = localStorage.getItem('primaryUser');
      if (localuser != null && localuser != undefined) {
        var userObj = JSON.parse(localuser);
          return userObj;
      }
    }
    return null;
  }
}
