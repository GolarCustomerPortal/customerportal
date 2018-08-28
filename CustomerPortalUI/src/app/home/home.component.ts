import { Component, OnInit } from '@angular/core';
import { CommonService } from '../services/common.service';
import { DashboardService } from '../services/dashboard.service';
declare var $: any;
@Component({
  selector: 'crm-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {


  ngOnInit() {
    var self = this;
    $('#notificationFormModal').on('hidden.bs.modal', function (e) {
      $(this).find('form')[0].reset();
    })
    if(this.commonService.getSelectedLeftTab() != null && this.commonService.getSelectedLeftTab() == 'fecilities'){
      this.onFecilitiesDataSelect(null);
      this.commonService.resetselectedLeftTab();
    }else if(this.commonService.getSelectedLeftTab() != null && this.commonService.getSelectedLeftTab() == 'companies'){
      this.onCompaniesDataSelect(null);
      this.commonService.resetselectedLeftTab();
    }else if(this.commonService.getSelectedLeftTab() != null && this.commonService.getSelectedLeftTab() == 'compliance'){
      this.onComplianceDataSelect(null);
      this.commonService.resetselectedLeftTab();
    }else if(this.commonService.getSelectedLeftTab() != null && this.commonService.getSelectedLeftTab() == 'ussboa'){
      // this.onFecilitiesDataSelect(null);
      this.commonService.resetselectedLeftTab();
    }

  }

  //left properties start
  items;
  //left properties end
  //common properties start
  showBack = false;
  newsFeedVisible=true;
  notificationForm;
  uploadLabel = "Browse"
  fOperatorFile=[];
  // fOperatorFileName;
  // commom properties end

  //search start
  searchString;
  //search end

// notification fileupload start
fOperatorFileName;
ownerFileName;
usetOwnerFileName;
operatorLeaseFileName;
notificationDueDateFileName;
operatoraffidavitFileName;
ownerAffidavitFileName;
deedLandFileName;
taxIdFileName;
notificationFormSubmittedFileName;
notificationFormApprovedFileName;

// notification file upload end

  //rightside panel variables start
  rightPanelTitle;
  showRightContent = false;
  showRightDetailContent = false;
  rightDetailsContent: any = {};
  rightPaneDetailslTitle = "";
  middlePaneClass = "ui-g-6";
  visibleSidebar = false;
  //right side panel variables end


  //app component code start
  area = {
    left: 50,
    center: 50,
    right: 0,
    leftVisible: true,
    centerVisible: true,
    rightVisible: true,
    useTransition: true,
  }
  //app component code end

  // left panel code start
  // loadLeftPanelData() {
  //   this.items = [
  //     {
  //       label: 'User Name',
  //       items: [{ label: 'Edit Profile', icon: 'fa fa-edit' },
  //       { separator: true },
  //       { label: 'Logout', icon: 'fa fa-sign-out' }
  //       ]
  //     }
  //   ];
  // }
  // left panel code end

  // middlepanel code start
  constructor(public commonService:CommonService,private dashboardService:DashboardService) {
    // this.loadLeftPanelData();

    this.fetchDashboardValues();
}
  fetchDashboardValues(){
    this.dashboardService.getDashboardData(this.commonService.getUserName()) // retrieve all thd parent folders
    .subscribe(
        dashboardData => {
          this.getFecilitiesData(dashboardData.fecilitiesData);
          this.getCompanies(dashboardData.companiesData);
          this.getConsolidateReport(dashboardData.consolidateReportData);
          this.getComplianceData(dashboardData.complianceData); 
        },
        error => {
            console.log(error);
        });

  }
  // fecilities
  showFecilities = this.commonService.getPreferencesOfFecilities();
  fecilitiesClass = "ui-g-6"
  fecilitiesdata: any;
  fecilitiesArray = [];
  fecilitiesLabel = [];
  totalFecilities;
  fecilitiesRightdata = [];
  getFecilitiesData(fecData) {
    this.fecilitiesdata = {
      labels: [],
      datasets: [
        {
          data: [],
          backgroundColor: [
            "#89DF93",
            "#cfb337"
          ],
          hoverBackgroundColor: [
            "#89DF93",
            "#cfb337"
          ]
        }]
    };

    this.fecilitiesArray.push(fecData.signed);
    this.fecilitiesArray.push(fecData.unsigned);
    this.fecilitiesdata.datasets[0].data.push(this.fecilitiesArray[0]);
    this.fecilitiesdata.datasets[0].data.push(this.fecilitiesArray[1]);
    this.fecilitiesLabel.push("Signed");
    this.fecilitiesLabel.push("Un signed");
    this.fecilitiesdata.labels.push(this.fecilitiesLabel[0] + '-- ' + this.constructPercentage(this.fecilitiesArray[0], this.fecilitiesArray[1]));
    this.fecilitiesdata.labels.push(this.fecilitiesLabel[1] + '-- ' + this.constructPercentage(this.fecilitiesArray[1], this.fecilitiesArray[0]))
    this.totalFecilities = this.fecilitiesArray[1] + this.fecilitiesArray[0];

  }
  onFecilitiesDataSelect($event) {
    var event ;
    if($event == null || $event == undefined)
      event =0;// left overlaypanel clicked
    else
      event = $event.element._index
   
    this.resetrightSideData();
    console.log("onFecilitiesDataSelect", this.fecilitiesLabel[event]);
    this.rightPanelTitle = "Fecilities -- " + this.fecilitiesLabel[event] + " (" + this.fecilitiesArray[event] + ")"
    this.showCompanies = false;
    this.showCompliance = false;
    this.showConsolidateReport = false;
    this.fecilitiesClass = "ui-g-12";
    this.showBack = true;
    this.showRightContent = true;
    
    this.dashboardService.getFecilitiesList(this.commonService.getUserName(),this.fecilitiesLabel[event]) // retrieve all thd parent folders
    .subscribe(
        fecilitiesList => {
          for(var i=0;i<fecilitiesList.length;i++){
            var feciData =  fecilitiesList[i];
           var image =  this.commonService.gasStationImage(feciData.gasStation)
           feciData.img = image;
            this.fecilitiesRightdata.push(feciData);
          }
          
        },
        error => {
            console.log(error);
        });

  }
  showSpecificFecilityDetails(fdata) {
    console.log(fdata);
    this.showRightDetailPanel();
    // this.showRightContent = false;
    this.showRightDetailContent = true;
    this.rightPaneDetailslTitle = fdata.name;
    this.rightDetailsContent.name = fdata.name;
    this.rightDetailsContent.fid = fdata.fid;
    this.rightDetailsContent.img = fdata.img;
    this.rightDetailsContent.address = fdata.address;
    this.rightDetailsContent.compliance = fdata.compliance;
    this.rightDetailsContent.storeManager = fdata.storeManager;
    this.rightDetailsContent.tankPm = fdata.tankPm;
  }

  //fecilities End

  //companies start
  companiesdata: any;
  totalCompanies;
  showCompanies = this.commonService.getPreferencesOfCompanies();
  companiesArray = [];
  companiesRightdata=[]
  companiesClass = "ui-g-6"
  getCompanies(compData) {
    this.companiesdata = {
      labels: [],
      datasets: [
        {
          data: [],
          backgroundColor: [
            "#89DF93"
          ],
          hoverBackgroundColor: [
            "#89DF93"
          ]
        }]
    };
    this.totalCompanies = compData.companies;
    this.companiesdata.datasets[0].data.push(this.totalCompanies);
    this.companiesdata.labels.push('Total -- ' + this.totalCompanies)
  }
  onCompaniesDataSelect($event) {
    var event ;
    if($event == null || event == undefined)
      event =0;// left overlaypanel clicked
    else
      event = $event.element._index
      this.resetrightSideData();
    console.log("onCompaniesDataSelect", event);
    this.showFecilities = false;
    this.showCompliance = false;
    this.showConsolidateReport = false;
    this.companiesClass = "ui-g-12";
    this.showBack = true;
    this.showRightContent=true;
    this.rightPanelTitle = "Companies -- " + " (" + this.totalCompanies + ")";
       // construction of fecilitiesRightdata need to get from server
      //  for (var i = 0; i < this.companiesArray[event]; i++) {
      //   let compObj: any = {};
      //   compObj.name = "Gas Station name " + "_" + i;
      //   compObj.img = 'bp.png';
      //   compObj.fid = "FID_" + i;
      //   compObj.address = "Gas Station Address";
      //   if (i % 3 == 0)
      //     compObj.compliance = true;
      //   else
      //     compObj.compliance = false;
      //   this.companiesRightdata.push(compObj);
      // }
      this.dashboardService.getCompaniesList(this.commonService.getUserName()) // retrieve all thd parent folders
      .subscribe(
          companiesList => {
            for(var i=0;i<companiesList.length;i++){
              var feciData =  companiesList[i];
            for(var j=0;j<feciData.fecilities.length;j++){
              var image =  this.commonService.gasStationImage(feciData.fecilities[j].gasStation)
              feciData.fecilities[j].img = image;
            }
              this.companiesRightdata.push(feciData);
            }
            
          },
          error => {
              console.log(error);
          });
  }
  // companies end

  //compliance start
  complianceData: any;
  complianceArray = [];
  complianceLabel = [];
  // compliance;
  // nonCompliance;
  totalCompliance;
  showCompliance = this.commonService.getPreferencesOfCompliance();
  complianceClass = "ui-g-6";
  complianceRightdata = [];

  getComplianceData(compliData) {
    this.complianceData = {
      labels: [],
      datasets: [
        {
          data: [],
          backgroundColor: [
            "#89DF93",
            "#EF3F36"
          ],
          hoverBackgroundColor: [
            "#89DF93",
            "#EF3F36"
          ]
        }]
    };
    // this.compliance = 11;
    this.complianceArray.push(compliData.compliance);
    this.complianceArray.push(compliData.noncompliance);
    this.complianceLabel.push("Compliance");
    this.complianceLabel.push("Non Compliance");
    // this.nonCompliance = 9;
    this.complianceData.labels.push('Compliance ' + this.constructPercentage(this.complianceArray[0], this.complianceArray[1]));
    this.complianceData.labels.push('Non Compliance' + this.constructPercentage(this.complianceArray[1], this.complianceArray[0]));
    this.complianceData.datasets[0].data.push(this.complianceArray[0]);
    this.complianceData.datasets[0].data.push(this.complianceArray[1]);
    this.totalCompliance = this.complianceArray[1] + this.complianceArray[0];
  }

  onComplianceDataSelect($event) {
    var event ;
    if($event == null || event == undefined)
      event =0;// left overlaypanel clicked
    else
      event = $event.element._index
    this.resetrightSideData();
    console.log("onComplianceDataSelect" + event)
    this.showFecilities = false;
    this.showCompanies = false;
    this.showConsolidateReport = false;
    this.complianceClass = "ui-g-12";
    this.showBack = true;
    this.rightPanelTitle = "Compliance -- " + this.complianceLabel[event] + " (" + this.complianceArray[event] + ")";
    this.showRightContent = true;
     // construction of fecilitiesRightdata need to get from server
    //  for (var i = 0; i < this.complianceArray[event]; i++) {
    //   let complianceObj: any = {};
    //   complianceObj.name = "Compliance name " + "_" + i;
    //   complianceObj.img = 'bp.png';
    //   complianceObj.fid = "FID_" + i;
    //   complianceObj.address = "Compliance";
    //   if (i % 3 == 0)
    //     complianceObj.compliance = true;
    //   else
    //     complianceObj.compliance = false;
    //     this.complianceRightdata.push(complianceObj);
    // }
    this.dashboardService.getComplianceList(this.commonService.getUserName(),this.fecilitiesLabel[event]) // retrieve all thd parent folders
    .subscribe(
      complianceList => {
          for(var i=0;i<complianceList.length;i++){
            var feciData =  complianceList[i];
           var image =  this.commonService.gasStationImage(feciData.gasStation)
           feciData.img = image;
            this.complianceRightdata.push(feciData);
          }
          
        },
        error => {
            console.log(error);
        });
  }

  showSpecificComplianceDetails(fdata) {
    console.log(fdata);
    this.showRightDetailPanel();
    // this.showRightContent = false;
    this.showRightDetailContent = true;
    this.rightPaneDetailslTitle = fdata.name;
    this.rightDetailsContent.name = fdata.name;
    this.rightDetailsContent.fid = fdata.fid;
    this.rightDetailsContent.img = fdata.img;
    this.rightDetailsContent.address = fdata.address;
    this.rightDetailsContent.compliance = fdata.compliance;
    this.rightDetailsContent.storeManager = fdata.storeManager;
    this.rightDetailsContent.tankPm = fdata.tankPm;
  }
  // compliance end


  //consolidateReport start
  consolidateReportdata: any;
  showConsolidateReport = this.commonService.getPreferencesOfConsolidate();
  reportClass = "ui-g-6"
  regular;
  midGrade;
  premium;
  diesel;

  getConsolidateReport(consolidateData) {
    this.consolidateReportdata = {
      labels: [],
      datasets: [
        {
          data: [],
          backgroundColor: [
            "#89DF93",
            "#36A2EB",
            "#89DF93",
            "#36A2EB"
          ],
          hoverBackgroundColor: [
            "#89DF93",
            "#36A2EB",
            "#89DF93",
            "#36A2EB"
          ] 
        }]
    };

    this.regular = consolidateData.regular;
    this.midGrade = consolidateData.midgrade;
    this.premium = consolidateData.premium;
    this.diesel = consolidateData.diesel;
    this.consolidateReportdata.datasets[0].data.push(this.regular);
    this.consolidateReportdata.datasets[0].data.push(this.midGrade);
    this.consolidateReportdata.datasets[0].data.push(this.premium);
    this.consolidateReportdata.datasets[0].data.push(this.diesel);
    this.consolidateReportdata.labels.push('Regular')
    this.consolidateReportdata.labels.push('Mid Grade');
    this.consolidateReportdata.labels.push('Premium');
    this.consolidateReportdata.labels.push('diesel');
  }
  onConsolidateDataSelect($event) {
    console.log("onConsolidateDataSelect" + $event.element._index)
    this.showFecilities = false;
    this.showCompanies = false;
    this.showCompliance = false;
    this.reportClass = "ui-g-12";
    this.showBack = true;
  }
  //consolidateReport end
  constructPercentage(value1, value2) {
    var value ="0";
    if(value1 == 0 && value1 == 0){
      value = "0";
    }else 
        value = ((value1 / (value1 + value2)) * 100).toFixed(2);
    value = value.replace(".00", '');
    value = '(' + value + "%)";
    return value;
  }




  private options: any = {
    legend: { position: 'bottom' }
  }
  private noLegendtOptions = {
    legend: { display: false }
  }
  private noLegendtRightOptions = {
    legend: { display: false },
    responsive: false,
    maintainAspectRatio: false
  }
  showAll() {
    this.showBack = false;
    this.showRightContent = false;
    this.showRightDetailContent = false;
    this.resetView();
  }
  resetView() {
    this.showFecilities = this.commonService.getPreferencesOfFecilities();
    this.showCompanies = this.commonService.getPreferencesOfCompanies();;
    this.showConsolidateReport = this.commonService.getPreferencesOfConsolidate();;
    this.showCompliance = this.commonService.getPreferencesOfCompliance();
    this.newsFeedVisible = true;
    this.fecilitiesClass = "ui-g-6";
    this.companiesClass = "ui-g-6";
    this.reportClass = "ui-g-6";
    this.complianceClass = "ui-g-6";
    this.area.left = 50;
    this.area.center = 50;
    this.area.right = 0;
  }
  resetrightSideData() {
    this.fecilitiesRightdata = [];
    this.complianceRightdata = [];
    this.companiesRightdata = [];
    this.middlePaneClass = "ui-g-6"
    this.showRightDetailContent = false;
    this.newsFeedVisible = false;
    this.area.left = 20;
    this.area.center = 80;
    this.area.right = 0;
  }
  getImage(fdata) {
    return "assets/images/" + fdata.img;
  }
  showRightDetailPanel() {
    this.middlePaneClass = "ui-g-12";
    this.area.center = 40;
    this.area.right = 40;
  }
  hideRightContentDetails(rightDetailsContent) {
    rightDetailsContent = [];
    this.area.left = 20;
    this.area.center = 80;
    this.area.right = 0;
    this.middlePaneClass = "ui-g-6"
  }
  showMainDashBoard() {
    console.log("showDashBoard");
  }
 
  getFileName(fileArray){
    if(fileArray != null && fileArray[0] != null)
    return fileArray[0];
    return "";
  }
  fileSelected($event,fileupdateName) {
    // var files = $event.files;
    // var file = files[0];
    // this.fOperatorFileName = file.name;
  }

}
