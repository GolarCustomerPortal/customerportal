import { Component, OnInit } from '@angular/core';
import { CommonService } from '../services/common.service';
import { DashboardService } from '../services/dashboard.service';

@Component({
  selector: 'app-settings',
  templateUrl: './settings.component.html',
  styleUrls: ['./settings.component.css']
})
export class SettingsComponent implements OnInit {
  incomePicklistCols = [];
  incomePicklist = [];
  incomePicklistValue = "";
  showIncomePicklistFailureMessage = false;
  showIncomePicklistSuccessMessage = false;
  incomePicklistSuccessMessage = ""
  incomePicklistFailureMessage = ""
  constructor(public commonService: CommonService,
    private dashboardService: DashboardService) { }

  ngOnInit() {
    this.incomePicklistCols.push({ field: "Picklist Value", header: "Picklist Value" })
    this.dashboardService.getIncomePicklistValue()
      .subscribe(incomeData => {
        this.incomePicklist = [];
        for (var i = 0; i < incomeData.length; i++) {
          var element = incomeData[i];
          this.incomePicklist.push({ label: element })
        }
      },
        error => {
          console.log(error);
        });
  }
  addToList() {
    var arr = this.incomePicklistValue.split("\n");
    for (var i = 0; i < arr.length; i++) {
      if(arr[i].trim() ==="" )
        continue;
    var elementPresent = false;
    for (var j = 0; j < this.incomePicklist.length; j++) {
      var element = this.incomePicklist[j];
      if (element.label == arr[i]) {
        elementPresent = true;
        break;
      }
    }
    if (!elementPresent)
      this.incomePicklist.push({ label: arr[i]})
  }
  }
  resetMessages(){
    this.showIncomePicklistFailureMessage = false;
    this.showIncomePicklistSuccessMessage = false;
    this.incomePicklistSuccessMessage = ""
    this.incomePicklistFailureMessage = ""
  }
  deleteRowData(tableData) {
    var index 
    = this.incomePicklist.indexOf(tableData);
    this.incomePicklist.splice(index, 1)
  }
  saveIncomePicklistValue() {
    var labelArray = this.incomePicklist.map(a => a.label);
    this.dashboardService.saveIncomePicklistValue(labelArray.join("-@-@-@-@-"))
      .subscribe(incomeData => {
        if(incomeData === true){
          this.showIncomePicklistFailureMessage = false;
          this.showIncomePicklistSuccessMessage = true;
          this.incomePicklistSuccessMessage = "Settings saved Successfully"
          this.incomePicklistFailureMessage = ""
        }
        else{
          this.showIncomePicklistFailureMessage = true;
          this.showIncomePicklistSuccessMessage = false;
          this.incomePicklistSuccessMessage = ""
          this.incomePicklistFailureMessage = "Problem while saving Settings !!!."
        }
      },
        error => {
          console.log(error);
          this.showIncomePicklistFailureMessage = true;
          this.showIncomePicklistSuccessMessage = false;
          this.incomePicklistSuccessMessage = ""
          this.incomePicklistFailureMessage = "Problem while saving Settings !!!."
        });
  }
}
