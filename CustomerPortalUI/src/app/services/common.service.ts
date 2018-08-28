import { Subject } from "rxjs";


export class CommonService {
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
      if (user != null && user != undefined) {
        var localuser = JSON.parse(user);
        return localuser.username;
      }
    }
    else
      user = localStorage.getItem('primaryUser');
    if (user != null && user != undefined) {
      var localuser = JSON.parse(user);
      // return localuser.username;
      return "0033600000M1YNjAAN";

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
  getPreferencesOfFecilities() {
    var fecilities = null;
    if (this.isSecondaryUserPresent()) {
      if (localStorage.getItem('secondaryfecilities') != null)
        fecilities = localStorage.getItem('secondaryfecilities')
    } else if (localStorage.getItem('primaryfecilities') != null)
      fecilities = localStorage.getItem('primaryfecilities');
    if (fecilities != null && fecilities === "false")
      return false;
    return true;

  }
  getPreferencesOfCompanies() {
    var fecilities = null;
    if (this.isSecondaryUserPresent()) {
      if (localStorage.getItem('secondarycompanies') != null)
        fecilities = localStorage.getItem('secondarycompanies')
    } else if (localStorage.getItem('primarycompanies') != null)
      fecilities = localStorage.getItem('primarycompanies');
    if (fecilities != null && fecilities === "false")
      return false;
    return true;

  }
  getPreferencesOfCompliance() {
    var fecilities = null;
    if (this.isSecondaryUserPresent()) {
      if (localStorage.getItem('secondarycompliance') != null)
        fecilities = localStorage.getItem('secondarycompliance')
    } else if (localStorage.getItem('primarycompliance') != null)
      fecilities = localStorage.getItem('primarycompliance');
    if (fecilities != null && fecilities === "false")
      return false;
    return true;

  }
  getPreferencesOfConsolidate() {
    var fecilities = null;
    if (this.isSecondaryUserPresent()) {
      if (localStorage.getItem('secondaryconsolidate') != null)
        fecilities = localStorage.getItem('secondaryconsolidate')
    } else if (localStorage.getItem('primaryconsolidate') != null)
      fecilities = localStorage.getItem('primaryconsolidate');
    if (fecilities != null && fecilities === "false")
      return false;
    return true;

  }
  addSecondaryUser(user) {
    localStorage.setItem('secondaryUser', JSON.stringify(user));
    var permission = user.permission;
    if (permission !== null && permission !== undefined) {
      var permissionArray = permission.split("__##__");
      for (var i = 0; i < permissionArray.length; i++) {
        var indPermission = permissionArray[i];
        var indPermissionArray = indPermission.split(":");
        localStorage.setItem("secondary" + indPermissionArray[0], indPermissionArray[1]);
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
    return "bp.png"
  }

}
