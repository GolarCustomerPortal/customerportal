import { Component, OnInit } from '@angular/core';
import { CommonService } from '../services/common.service';
import { DashboardService } from '../services/dashboard.service';
import { ImportService } from '../services/import.service';
import { AppComponent } from '../app.component';
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
      self.resetNotificationForm(true);
    })
    $('#complianceFormModal').on('hidden.bs.modal', function (e) {
      $(this).find('form')[0].reset();
      self.resetComplianceForm(true);
    })
    $('#certificationFormModal').on('hidden.bs.modal', function (e) {
      $(this).find('form')[0].reset();
      self.resetCertificationForm(true);
    })
//searchResults
  if (this.commonService.getSearchResult() != null) {
    var resultObj = JSON.parse(this.commonService.getSearchResult())
    this.handleSearchResults(resultObj);
    this.commonService.resetSearchResult();
  }
//searchRestults

    if (this.commonService.getSelectedLeftTab() != null && this.commonService.getSelectedLeftTab() == 'facilities') {
      this.onFacilitiesDataSelect(null);
      this.commonService.resetselectedLeftTab();
    } else if (this.commonService.getSelectedLeftTab() != null && this.commonService.getSelectedLeftTab() == 'companies') {
      this.onCompaniesDataSelect(null);
      this.commonService.resetselectedLeftTab();
    } else if (this.commonService.getSelectedLeftTab() != null && this.commonService.getSelectedLeftTab() == 'compliance') {
      this.onComplianceDataSelect(null);
      this.commonService.resetselectedLeftTab();
    } else if (this.commonService.getSelectedLeftTab() != null && this.commonService.getSelectedLeftTab() == 'ussboa') {
      // this.onFacilitiesDataSelect(null);
      this.commonService.resetselectedLeftTab();
    }

  }

  //left properties start
  items;
  //left properties end
  //common properties start
  showBack = false;
  newsFeedVisible = true;
  notificationForm;
  uploadLabel = "Browse"
  FILL_COLOR="#2c347E";
  NON_FILL_COLOR="#ef4136";
  GUTTER_COLOR ="#d3e8c8"; 
  showSearchResults=false;
  SIGNED = "Signed";
  UNSIGNED = "Un Signed"
  selectedChart = 'facilities';
  // fOperatorFileName;
  // commom properties end

  //search start
  searchString;
  searchResult={};
  //search end

  // notification fileupload start
  fOperatorFileName;
  fOperatorfile;
  fOperatorfileSuccess = "false";
  ownerFileName;
  ownerFile;
  ownerFileSuccess = "false";
  ustOwnerFileName;
  ustOwnerFile;
  ustOwnerFileSuccess = "false";
  operatorLeaseFileName;
  operatorLeaseFile;
  operatorLeaseFileSuccess = "false";
  notificationDueDateFileName;
  notificationDueDateFile;
  notificationDueDateFileSuccess = "false";
  operatoraffidavitFileName;
  operatoraffidavitFile;
  operatoraffidavitFileSuccess = "false";
  ownerAffidavitFileName;
  ownerAffidavitFile;
  ownerAffidavitFileSuccess = "false";
  deedLandFileName;
  deedLandFile;
  deedLandFileSuccess = "false";
  taxIdFileName;
  taxIdFile;
  taxIdFileSuccess = "false";
  notificationFormSubmittedFileName;
  notificationFormSubmittedFile;
  notificationFormSubmittedFileSuccess = "false";
  enableNotificationuploadButton = false;
  notificationResultList = [];

  // notification file upload end
  //certification file upload start
  operatorAcertificateFileName;
  operatorAcertificateFile;
  operatorAcertificateFileSuccess = "false";
  operatorBcertificateFileName;
  operatorBcertificateFile;
  operatorBcertificateFileSuccess = "false";
  operatorCcertificateFileName;
  operatorCcertificateFile;
  operatorCcertificateFileSuccess = "false";
  enableCertificationuploadButton = false;
  certificationResultList = [];
  //certification file upload end

  // compliance fileupload start
  lineLeakFileName;
  lineLeakFile;
  lineLeakFileSuccess = "false";
  cathodicProtectionFileName;
  cathodicProtectionFile;
  cathodicProtectionFileSuccess = "false";
  tankTestingReportFileName;
  tankTestingReportFile;
  tankTestingReportFileSuccess = "false";
  repairDocumentsFileName;
  repairDocumentsFile;
  repairDocumentsFileSuccess = "false";
  releaseDetectionFileName;
  releaseDetectionFile;
  releaseDetectionFileSuccess = "false";
  internalLiningFileName;
  internalLiningFile;
  internalLiningFileSuccess = "false";
  enableComplianceuploadButton = false;
  complianceResultList = [];

  // compliance fileupload end

  //rightside panel variables start
  rightPanelTitle;
  showRightContent = false;
  showRightDetailContent = false;
  rightDetailsContent: any = {};
  actualServerData: any = {};
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
    rightVisible: false,
    useTransition: true,
  }
  //app component code end

  // middlepanel code start
  constructor(public appcomponent: AppComponent, public commonService: CommonService, private dashboardService: DashboardService, private importService: ImportService) {
    // this.loadLeftPanelData();
    if (this.commonService.getSearchResult() == null)
    this.fetchDashboardValues();
  }
  fetchDashboardValues() {
    this.dashboardService.getDashboardData(this.commonService.getUserName()) // retrieve all thd parent folders
      .subscribe(
        dashboardData => {
          this.resetLeftSideData();
          this.getFacilitiesData(dashboardData.facilitiesData);
          this.getCompanies(dashboardData.companiesData);
          this.getConsolidateReport(dashboardData.consolidateReportData);
          this.getComplianceData(dashboardData.complianceData);
        },
        error => {
          console.log(error);
        });

  }
  // Facilities
  showFacilities = this.commonService.getPreferencesOfFacilities();
  facilitiesClass = "ui-g-6"
  facilitiesdata: any;
  facilitiesArray = [];
  facilitiesLabel = [];
  totalFacilities;
  facilitiesRightdata = [];
  getFacilitiesData(fecData) {
    this.facilitiesdata = {
      labels: [],
      datasets: [
        {
          data: [],
          backgroundColor: [
            this.FILL_COLOR,
            this.NON_FILL_COLOR
          ],
          hoverBackgroundColor: [
            this.FILL_COLOR,
            this.NON_FILL_COLOR
          ]
        }]
    };

    this.facilitiesArray.push(fecData.signed);
    this.facilitiesArray.push(fecData.unsigned);
    this.facilitiesdata.datasets[0].data.push(this.facilitiesArray[0]);
    this.facilitiesdata.datasets[0].data.push(this.facilitiesArray[1]);
    this.facilitiesLabel.push(this.SIGNED);
    this.facilitiesLabel.push(this.UNSIGNED);
    this.facilitiesdata.labels.push(this.facilitiesLabel[0] + '-- ' + this.constructPercentage(this.facilitiesArray[0], this.facilitiesArray[1]));
    this.facilitiesdata.labels.push(this.facilitiesLabel[1] + '-- ' + this.constructPercentage(this.facilitiesArray[1], this.facilitiesArray[0]))
    this.totalFacilities = this.facilitiesArray[1] + this.facilitiesArray[0];

  }
  onFacilitiesDataSelect($event) {
    var event;
    if ($event == null || $event == undefined)
      event = 0;// left overlaypanel clicked
    else
      event = $event.element._index
      this.selectedChart = "facilities";
    this.hideSearchPanel();
    this.resetrightSideData();
    console.log("onFacilitiesDataSelect", this.facilitiesLabel[event]);
    this.rightPanelTitle = "Facilities -- " + this.facilitiesLabel[event] + " (" + this.facilitiesArray[event] + ")"
    this.showCompanies = false;
    this.showCompliance = false;
    this.showConsolidateReport = false;
    this.facilitiesClass = "ui-g-12";
    this.showBack = true;
    this.showRightContent = true;

    this.dashboardService.getFacilitiesList(this.commonService.getUserName(), this.facilitiesLabel[event]) // retrieve all thd parent folders
      .subscribe(
        facilitiesList => {
          for (var i = 0; i < facilitiesList.length; i++) {
            var faciData = facilitiesList[i];
            if(this.facilitiesLabel[event] == this.UNSIGNED)
            faciData.compliance =false;
            else if(faciData.compliance != null)
            faciData.compliance = faciData.compliance == "true";
            var image = this.commonService.gasStationImage(faciData.brand)
            faciData.image = "assets/images/gasstation/"+image;
            // this.getFacilityConsolidateReport(faciData.consolidateReport);
            this.facilitiesRightdata.push(faciData);
          }

        },
        error => {
          console.log(error);
        });

  }
  compliance=true;
  showSpecificfacilityDetails(fdata) {
    console.log(fdata);
    this.showRightDetailPanel();
    // this.showRightContent = false;
    this.showRightDetailContent = true;
    this.rightDetailsContent.facilityId = fdata.facilityId;
    this.rightPaneDetailslTitle = fdata.name;
    this.rightDetailsContent.image = fdata.image;
    this.rightDetailsContent.facilityName = fdata.name;
    this.rightDetailsContent.docUpdateDate = new Date();
    this.rightDetailsContent.city = fdata.city;
    this.rightDetailsContent.fid = fdata.fid;
    this.rightDetailsContent.img = fdata.img;
    this.rightDetailsContent.notificationFormButtonEnable = fdata.notificationFormButtonEnable;
    this.rightDetailsContent.complianceButtonEnable = fdata.complianceButtonEnable;
    this.rightDetailsContent.certificationButtonEnable = fdata.certificationButtonEnable;
    this.rightDetailsContent.address = fdata.address;
    this.rightDetailsContent.tankPaidService = fdata.tankPaidService;
    this.rightDetailsContent.storeManager = fdata.storeManager;
    this.rightDetailsContent.tankPm = fdata.tankPm;
    this.rightDetailsContent.compliance = fdata.compliance;
    this.rightDetailsContent.consolidateReport  = fdata.consolidateReport;
    this.getFacilityConsolidateReport(this.rightDetailsContent.consolidateReport);
    //actualServerData details.
    this.actualServerData.docUpdateDate = new Date();
    this.actualServerData.facilityName = fdata.name;
    this.actualServerData.facilityId = fdata.facilityId;
    this.actualServerData.fid = fdata.fid;
    this.actualServerData.street = fdata.street;
    this.actualServerData.city = fdata.city;


  }

  //Facilities End

  //companies start
  companiesdata: any;
  totalCompanies;
  showCompanies = this.commonService.getPreferencesOfCompanies();
  companiesArray = [];
  companiesRightdata = []
  companiesClass = "ui-g-6"
  getCompanies(compData) {
    this.companiesdata = {
      labels: [],
      datasets: [
        {
          data: [],
          backgroundColor: [
           this.FILL_COLOR
          ],
          hoverBackgroundColor: [
            this.FILL_COLOR
          ]
        }]
    };
    this.totalCompanies = compData.companies;
    this.companiesdata.datasets[0].data.push(this.totalCompanies);
    this.companiesdata.labels.push('Total -- ' + this.totalCompanies)
  }
  onCompaniesDataSelect($event) {
    var event;
    if ($event == null || event == undefined)
      event = 0;// left overlaypanel clicked
    else
      event = $event.element._index;
      this.selectedChart = "companies";
      this.hideSearchPanel();
    this.resetrightSideData();
    console.log("onCompaniesDataSelect", event);
    this.showFacilities = false;
    this.showCompliance = false;
    this.showConsolidateReport = false;
    this.companiesClass = "ui-g-12";
    this.showBack = true;
    this.showRightContent = true;
    this.rightPanelTitle = "Companies -- " + " (" + this.totalCompanies + ")";
    this.dashboardService.getCompaniesList(this.commonService.getUserName()) // retrieve all thd parent folders
      .subscribe(
        companiesList => {
          for (var i = 0; i < companiesList.length; i++) {
            var faciData = companiesList[i];
            for (var j = 0; j < faciData.facilities.length; j++) {
               if( faciData.facilities[j].compliance != null)
               faciData.facilities[j].compliance =  faciData.facilities[j].compliance == "true";
              faciData.facilities[j].image = "assets/images/gasstation/"+this.commonService.gasStationImage(faciData.facilities[j].brand)
            }
            this.companiesRightdata.push(faciData);
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
            this.FILL_COLOR,
            this.NON_FILL_COLOR
          ],
          hoverBackgroundColor: [
            this.FILL_COLOR,
            this.NON_FILL_COLOR
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
    var event;
    if ($event == null || $event == undefined)
      event = 0;// left overlaypanel clicked
    else
      event = $event.element._index
      this.selectedChart = "compliance";
      this.hideSearchPanel();
    this.resetrightSideData();
    console.log("onComplianceDataSelect" + event)
    this.showFacilities = false;
    this.showCompanies = false;
    this.showConsolidateReport = false;
    this.complianceClass = "ui-g-12";
    this.showBack = true;
    this.rightPanelTitle = "Compliance -- " + this.complianceLabel[event] + " (" + this.complianceArray[event] + ")";
    this.showRightContent = true;
    this.dashboardService.getComplianceList(this.commonService.getUserName(), this.complianceLabel[event]) // retrieve all thd parent folders
      .subscribe(
        complianceList => {
          if(complianceList !== null )
          for (var i = 0; i < complianceList.length; i++) {
            var feciData = complianceList[i];
            var image = this.commonService.gasStationImage(feciData.brand)
            feciData.image = "assets/images/gasstation/"+image;
            this.complianceRightdata.push(feciData);
          }

        },
        error => {
          console.log(error);
        });
  }

    // compliance end


  //consolidateReport start
  consolidateReportdata: any;
  facilityConsolidateReportdata:any;
  showConsolidateReport = this.commonService.getPreferencesOfConsolidate();
  reportClass = "ui-g-6"
  // regular;
  // midGrade;
  // premium;
  // diesel;
  // totalGallons = 1000;
  getConsolidateReport(consolidateData) {



  //   this.regular = consolidateData.regular;
  //   this.midGrade = consolidateData.midgrade;
  //   this.premium = consolidateData.premium;
  //   this.diesel = consolidateData.diesel;
    this.consolidateReportdata = {
      labels: [],


      datasets: [
        {
          label: 'Remaining',
          data: [],
          // backgroundColor: this.NON_FILL_COLOR,
          // hoverBackgroundColor: this.NON_FILL_COLOR
          backgroundColor: this.FILL_COLOR,
          hoverBackgroundColor: this.FILL_COLOR
        }
        // , {
        //   label: 'Total',
        //   data: [this.totalGallons - this.regular, (this.totalGallons - this.midGrade), (this.totalGallons - this.premium)],
        //   backgroundColor: this.FILL_COLOR,
        //   hoverBackgroundColor: this.FILL_COLOR

        // }
      ]
    };
    for(var i=0;i<consolidateData.length;i++){
      this.consolidateReportdata.labels.push(consolidateData[i].key);
      this.consolidateReportdata.datasets[0].data.push(consolidateData[i].value)

    }

  // this.consolidateReportdata.labels.push('Regular')
  //   this.consolidateReportdata.labels.push('Mid Grade');
  //   this.consolidateReportdata.labels.push('Premium');
  //   this.consolidateReportdata.labels.push('diesel');
  }
  onConsolidateDataSelect($event) {
    console.log("onConsolidateDataSelect" + $event.element._index)
    // this.showFacilities = false;
    // this.showCompanies = false;
    // this.showCompliance = false;
    // this.reportClass = "ui-g-12";
    // this.showBack = true;
  }
  //consolidateReport end
  constructPercentage(value1, value2) {
    var value = "0";
    if (value1 == 0 && value1 == 0) {
      value = "0";
    } else
      value = ((value1 / (value1 + value2)) * 100).toFixed(2);
    value = value.replace(".00", '');
    value = '(' + value + "%)";
    return value;
  }




  private options: any = {
    legend: { position: 'bottom' },
    responsive: true,
    maintainAspectRatio :false
  }
  private noLegendtOptions = {
    legend: { display: false },
    responsive: false,
    maintainAspectRatio: false,

    scales: {
      xAxes: [{
        stacked: true // this should be set to make the bars stacked
      }],
      yAxes: [{
        stacked: true // this also..
      }]
    }
  }
  private noLegendtRightOptions = {
    legend: { display: false },
    responsive: false,
    maintainAspectRatio: false,

    scales: {
      xAxes: [{
        stacked: true // this should be set to make the bars stacked
      }],
      yAxes: [{
        stacked: true // this also..
      }]
    }
  }
  showAll() {
    this.showBack = false;
    this.showRightContent = false;
    this.showRightDetailContent = false;
    this.hideSearchPanel();
   
    this.resetView();
  }
  resetView() {
    this.showFacilities = this.commonService.getPreferencesOfFacilities();
    this.showCompanies = this.commonService.getPreferencesOfCompanies();;
    this.showConsolidateReport = this.commonService.getPreferencesOfConsolidate();;
    this.showCompliance = this.commonService.getPreferencesOfCompliance();
    this.newsFeedVisible = true;
    this.facilitiesClass = "ui-g-6";
    this.companiesClass = "ui-g-6";
    this.reportClass = "ui-g-6";
    this.complianceClass = "ui-g-6";
    this.area.left = 50;
    this.area.center = 50;
    this.area.right = 0;
  }
  resetLeftSideData() {
    this.facilitiesArray = [];
    this.facilitiesLabel = [];
    this.companiesArray = [];
    this.complianceArray = [];
    this.complianceLabel = [];
  }
  resetrightSideData() {
    this.facilitiesRightdata = [];
    this.complianceRightdata = [];
    this.companiesRightdata = [];
    this.middlePaneClass = "ui-g-4"
    this.showRightDetailContent = false;
    this.newsFeedVisible = false;
    this.area.left = 20;
    this.area.center = 80;
    this.area.right = 0;
  }
  // getImage(fdata) {
  //   return "assets/images/gasstation/" + fdata.img;
  // }
  showRightDetailPanel() {
    if(this.searchResult["facilitiesList"] == null && this.searchResult["companiesList"] ==null)
    this.middlePaneClass = "ui-g-12";
    else
    this.middlePaneClass = "ui-g-6";
    this.area.center = 40;
    this.area.right = 40;
    this.area.rightVisible =  true;
  }
  hideRightContentDetails(rightDetailsContent) {
    rightDetailsContent = [];
    this.actualServerData = [];
    this.area.left = 20;
    this.area.center = 80;
    this.area.right = 0;
    this.middlePaneClass = "ui-g-4"
    this.area.rightVisible =  false;
  }
  showMainDashBoard() {
    console.log("showDashBoard");
  }

  getFileName(fileArray) {
    if (fileArray != null && fileArray[0] != null)
      return fileArray[0];
    return "";
  }
  fileSelected($event, fileupdateName) {
    // var files = $event.files;
    // var file = files[0];
    // this.fOperatorFileName = file.name;
  }
  modalData;
  getNotificationModalData(facilitiesId) {
    this.dashboardService.getNotifictionUploadData(facilitiesId) // retrieve all thd parent folders
      .subscribe(
        modalData => {
          this.modalData = modalData;
        },
        error => {
          console.log(error);
        });
  }

  getNotificationFormButtonClass(rightDetailsContent) {
    if ((rightDetailsContent.compliance == false && rightDetailsContent.tankPaidService =="false") ||(rightDetailsContent.notificationFormButtonEnable != null && rightDetailsContent.notificationFormButtonEnable == "true"))
      return 'facility-button-background-red'
    return ""
  }
  getComplianceButtonClass(rightDetailsContent) {
    if ((rightDetailsContent.compliance == false && rightDetailsContent.tankPaidService =="false") || (rightDetailsContent.complianceButtonEnable != null && rightDetailsContent.complianceButtonEnable == "true"))
      return 'facility-button-background-red'
    return ""
  }
  getCertificationButtonClass(rightDetailsContent) {
    if ((rightDetailsContent.compliance == false && rightDetailsContent.tankPaidService =="false") || (rightDetailsContent.certificationButtonEnable != null && rightDetailsContent.certificationButtonEnable == "true"))
      return 'facility-button-background-red'
    return ""
  }
  getFacilitiesSubList(facilitiesRightdata, i) {
    var subList = [];
    if (facilitiesRightdata != null) {
      if (facilitiesRightdata[i] != null)
        subList.push(facilitiesRightdata[i]);
      if (facilitiesRightdata[i] + 1 != null)
        subList.push(facilitiesRightdata[i + 1]);
      if (facilitiesRightdata[i + 2] != null)
        subList.push(facilitiesRightdata[i + 2]);
    }
    return subList;

  }

  //import notification files start
  importNotificationDocuments() {
    // console.log(this.fileInput.files.length)
    var frmData = new FormData();

    var fileuploadlabelArray = [];
    frmData.append("docProperties", this.getDocumentProperties());

    frmData.append("facilityId", this.rightDetailsContent.facilityId);
    if (this.fOperatorfile != null) {
      this.generateFileUploadObj(this.fOperatorfile, frmData, 'facilityOperatorPOA', fileuploadlabelArray)
    }
    if (this.ownerFile != null) {
      this.generateFileUploadObj(this.ownerFile, frmData, 'propertyOwnerPOA', fileuploadlabelArray)
    }
    if (this.ustOwnerFile != null) {
      this.generateFileUploadObj(this.ustOwnerFile, frmData, 'ustOwnerPOA', fileuploadlabelArray)
    }
    if (this.operatorLeaseFile != null) {
      this.generateFileUploadObj(this.operatorLeaseFile, frmData, 'operatorAffidevitOfLease', fileuploadlabelArray)
    }
    if (this.notificationDueDateFile != null) {
      this.generateFileUploadObj(this.notificationDueDateFile, frmData, 'notificationDueDate', fileuploadlabelArray)
    }
    if (this.operatoraffidavitFile != null) {
      this.generateFileUploadObj(this.operatoraffidavitFile, frmData, 'operatorAffidevitOfLease', fileuploadlabelArray)
    }
    if (this.ownerAffidavitFile != null) {
      this.generateFileUploadObj(this.ownerAffidavitFile, frmData, 'ownerAffidevitOfLease', fileuploadlabelArray)
    }
    if (this.deedLandFile != null) {
      this.generateFileUploadObj(this.deedLandFile, frmData, 'propertyDeedLandContract', fileuploadlabelArray)
    }

    if (this.taxIdFile != null) {
      this.generateFileUploadObj(this.taxIdFile, frmData, 'taxIDInformation', fileuploadlabelArray)
    }
    if (this.notificationFormSubmittedFile != null) {
      this.generateFileUploadObj(this.notificationFormSubmittedFile, frmData, 'notificationFormSubmitted', fileuploadlabelArray)
    }


    frmData.append("fileuploadlabel", JSON.stringify(fileuploadlabelArray));
    this.importNotificationDocument(frmData);

  }

  importNotificationDocument(frmData) {
    this.importService.importDocuments(frmData)
      .subscribe(
        result => {
          // console.log(message)
          if (result != null) {
            // this.successMessage = "File(s) Uploaded Successfully !!";
            this.notificationResultList = result;
            for (var i = 0; i < result.length; i++) {
              if (result[i].key == 'facilityOperatorPOA')
                this.fOperatorfileSuccess = result[i].value;
              if (result[i].key == 'propertyOwnerPOA')
                this.ownerFileSuccess = result[i].value;
              if (result[i].key == 'ustOwnerPOA')
                this.ustOwnerFileSuccess = result[i].value;
              if (result[i].key == 'operatorAffidevitOfLease')
                this.operatorLeaseFileSuccess = result[i].value;
              if (result[i].key == 'notificationDueDate')
                this.notificationDueDateFileSuccess = result[i].value;
              if (result[i].key == 'operatoraffidavitFile')
                this.operatoraffidavitFileSuccess = result[i].value;
              if (result[i].key == 'ownerAffidevitOfLease')
                this.ownerAffidavitFileSuccess = result[i].value;
              if (result[i].key == 'propertyDeedLandContract')
                this.deedLandFileSuccess = result[i].value;
              if (result[i].key == 'taxIDInformation')
                this.taxIdFileSuccess = result[i].value;
              if (result[i].key == 'notificationFormSubmitted')
                this.notificationFormSubmittedFileSuccess = result[i].value;

            }

            //notification form start
            this.resetNotificationForm(false);
            //notification form end
          }
        },
        error => {
          console.log(error);
        });

  }
  resetNotificationForm(clearTick) {
    this.fOperatorFileName = "";
    this.ownerFileName = "";
    this.ustOwnerFileName = "";
    this.operatorLeaseFileName = "";
    this.notificationDueDateFileName = "";
    this.operatoraffidavitFileName = "";
    this.ownerAffidavitFileName = "";
    this.deedLandFileName = "";
    this.taxIdFileName = "";
    this.notificationFormSubmittedFileName = "";
    if(clearTick){
    this.fOperatorfileSuccess = "false";
    this.ownerFileSuccess = "false";
    this.ustOwnerFileSuccess = "false";
    this.operatorLeaseFileSuccess = "false";
    this.notificationDueDateFileSuccess = "false";
    this.operatoraffidavitFileSuccess = "false";
    this.ownerAffidavitFileSuccess = "false";
    this.deedLandFileSuccess = "false";
    this.taxIdFileSuccess = "false";
  }
    this.enableNotificationuploadButton = false;
  }
  //import notification files end


  //import compliance files start
  importComplianceDocuments() {
    // console.log(this.fileInput.files.length)
    var frmData = new FormData();

    var complianceUploadArray = [];
    frmData.append("docProperties", this.getDocumentProperties());

    frmData.append("facilityId", this.rightDetailsContent.facilityId);
    if (this.lineLeakFile != null) {
      this.generateFileUploadObj(this.lineLeakFile, frmData, 'lineAndLeakDetector', complianceUploadArray)
    }
    if (this.cathodicProtectionFile != null) {
      this.generateFileUploadObj(this.cathodicProtectionFile, frmData, 'cathodicProtection', complianceUploadArray)
    }
    if (this.tankTestingReportFile != null) {
      this.generateFileUploadObj(this.tankTestingReportFile, frmData, 'tankTestingReport', complianceUploadArray)
    }
    if (this.repairDocumentsFile != null) {
      this.generateFileUploadObj(this.repairDocumentsFile, frmData, 'repairDocuments', complianceUploadArray)
    }
    if (this.releaseDetectionFile != null) {
      this.generateFileUploadObj(this.releaseDetectionFile, frmData, 'releaseDetectionReport', complianceUploadArray)
    }
    if (this.internalLiningFile != null) {
      this.generateFileUploadObj(this.internalLiningFile, frmData, 'internalLiningInspection', complianceUploadArray)
    }
    frmData.append("fileuploadlabel", JSON.stringify(complianceUploadArray));
    this.importComplianceDocument(frmData);

  }
  importComplianceDocument(frmData) {
    this.importService.importDocuments(frmData)
      .subscribe(
        result => {
          // console.log(message)
          if (result != null) {
            // this.successMessage = "File(s) Uploaded Successfully !!";
            this.complianceResultList = result;
            for (var i = 0; i < result.length; i++) {
              if (result[i].key == 'lineAndLeakDetector')
                this.lineLeakFileSuccess = result[i].value;
              if (result[i].key == 'cathodicProtection')
                this.cathodicProtectionFileSuccess = result[i].value;
              if (result[i].key == 'tankTestingReport')
                this.tankTestingReportFileSuccess = result[i].value;
              if (result[i].key == 'repairDocuments')
                this.repairDocumentsFileSuccess = result[i].value;
              if (result[i].key == 'releaseDetectionReport')
                this.releaseDetectionFileSuccess = result[i].value;
              if (result[i].key == 'internalLiningInspection')
                this.internalLiningFileSuccess = result[i].value;
            }

            //notification form start
            this.resetComplianceForm(false);
            //notification form end
          }
        },
        error => {
          console.log(error);
        });

  }
  resetComplianceForm(clearTick) {
    this.lineLeakFileName = "";
    this.cathodicProtectionFile = "";
    this.tankTestingReportFileName = "";
    this.repairDocumentsFileName = "";
    this.releaseDetectionFile = "";
    this.internalLiningFileName = "";
    if(clearTick){
    this.lineLeakFileSuccess = "false";
    this.cathodicProtectionFileSuccess = "false";
    this.tankTestingReportFileSuccess = "false";
    this.repairDocumentsFileSuccess = "false";
    this.releaseDetectionFileSuccess = "false";
    this.internalLiningFileSuccess = "false";
  }
  }
  //import compliance end

  //import Certification files start
  importCertificationDocuments() {
    // console.log(this.fileInput.files.length)
    var frmData = new FormData();

    var certificationUploadArray = [];
    frmData.append("docProperties", this.getDocumentProperties());

    frmData.append("facilityId", this.rightDetailsContent.facilityId);
    if (this.operatorAcertificateFile != null) {
      this.generateFileUploadObj(this.operatorAcertificateFile, frmData, 'operatorAcertificate', certificationUploadArray)
    }
    if (this.operatorBcertificateFile != null) {
      this.generateFileUploadObj(this.operatorBcertificateFile, frmData, 'operatorBcertificate', certificationUploadArray)
    }
    if (this.operatorCcertificateFile != null) {
      this.generateFileUploadObj(this.operatorCcertificateFile, frmData, 'operatorCcertificate', certificationUploadArray)
    }
    frmData.append("fileuploadlabel", JSON.stringify(certificationUploadArray));
    this.importCertificationDocument(frmData);

  }
  importCertificationDocument(frmData) {
    this.importService.importDocuments(frmData)
      .subscribe(
        result => {
          // console.log(message)
          if (result != null) {
            // this.successMessage = "File(s) Uploaded Successfully !!";
            this.complianceResultList = result;
            for (var i = 0; i < result.length; i++) {
              if (result[i].key == 'operatorAcertificate')
                this.operatorAcertificateFileSuccess = result[i].value;
              if (result[i].key == 'operatorBcertificate')
                this.operatorBcertificateFileSuccess = result[i].value;
              if (result[i].key == 'operatorCcertificate')
                this.operatorCcertificateFileSuccess = result[i].value;
            }
            this.resetCertificationForm(false);
          }
        },
        error => {
          console.log(error);
        });

  }
  resetCertificationForm(clearCheck) {
    this.operatorAcertificateFileName = "";
    this.operatorBcertificateFileName = "";
    this.operatorCcertificateFileName = "";
    if(clearCheck){
    this.operatorAcertificateFileSuccess = "false";
    this.operatorBcertificateFileSuccess = "false";
    this.operatorCcertificateFileSuccess = "false";
  }
  }
  //import compliance end

  getDocumentProperties() {
    // console.log(this.model)
    return JSON.stringify(this.actualServerData)
  }
  generateFileUploadObj(file, frmData, dbObj, fileuploadlabelArray) {
    var fileuploadlabel: any = {}
    frmData.append("fileUpload", file);
    fileuploadlabel.key = dbObj;
    fileuploadlabel.value = file.name;
    fileuploadlabelArray.push(fileuploadlabel);
  }
// search results start
searchArea = {
  left: 50,
  right:50,
  leftVisible: true,
  rightVisible: true,
  useTransition: true,
}

  handleSearchResults(searchResult){
    if(searchResult.facilitiesList!= null && searchResult.facilitiesList.length>0){
    for (var i = 0; i < searchResult.facilitiesList.length; i++) {
      var feciData = searchResult.facilitiesList[i];
      if(feciData == null)continue;
      var image = this.commonService.gasStationImage(feciData.brand)
  
      feciData.image = "assets/images/gasstation/"+image;
    }
  }
    if(searchResult.companiesList!= null && searchResult.companiesList.length>0){
      for (var i = 0; i < searchResult.companiesList.length; i++) {
        var feciData = searchResult.companiesList[i];
        for (var j = 0; j < feciData.facilities.length; j++) {
          feciData.facilities[j].image = "assets/images/gasstation/"+this.commonService.gasStationImage(feciData.facilities[j].brand)
        }
        this.companiesRightdata.push(feciData);
      }
    }
    this.searchResult["facilitiesList"] = searchResult.facilitiesList;
    this.searchResult["companiesList"] = searchResult.companiesList;
    this.hideMainPanal();
  }
  hideMainPanal(){
    this.showSearchResults=true;
  }
  hideSearchPanel(){
    this.appcomponent.searchString = "";
    this.showSearchResults=false;
  }

  //search results end
  setSplitwidth(){
//     console.log("set")
    var sidebarDiv = document.getElementById("left-split-panel")
    var mainDiv =document.getElementById("split-panel") 
    if(sidebarDiv != null && mainDiv !== null )
{
  sidebarDiv.style.display = "";
  mainDiv.style.width="calc(100% - 320px)";
}     
//     // if(this.area.leftVisible)
  }
  reSetSplitwidth(){
    var sidebarDiv = document.getElementById("left-split-panel")
    var mainDiv =document.getElementById("split-panel") 
    if(sidebarDiv != null && mainDiv !== null )
{
  sidebarDiv.style.display = "none";
  mainDiv.style.width="100%";
}   
  }
  checkCertificationDisabled(enableData){
    console.log(enableData)
    if(enableData == null) return false;
    return true;

  }
  getFacilityConsolidateReport(consolidateData) {

this.facilityConsolidateReportdata = null;;

    //   this.regular = consolidateData.regular;
    //   this.midGrade = consolidateData.midgrade;
    //   this.premium = consolidateData.premium;
    //   this.diesel = consolidateData.diesel;
      this.facilityConsolidateReportdata = {
        labels: [],
  
  
        datasets: [
          {
            label: 'Remaining',
            data: [],
            // backgroundColor: this.NON_FILL_COLOR,
            // hoverBackgroundColor: this.NON_FILL_COLOR
            backgroundColor: this.FILL_COLOR,
            hoverBackgroundColor: this.FILL_COLOR
          }
          // , {
          //   label: 'Total',
          //   data: [this.totalGallons - this.regular, (this.totalGallons - this.midGrade), (this.totalGallons - this.premium)],
          //   backgroundColor: this.FILL_COLOR,
          //   hoverBackgroundColor: this.FILL_COLOR
  
          // }
        ]
      };
      for(var i=0;i<consolidateData.length;i++){
        this.facilityConsolidateReportdata.labels.push(consolidateData[i].key);
        this.facilityConsolidateReportdata.datasets[0].data.push(consolidateData[i].value)
  
      }
      // return this.facilityConsolidateReportdata;
    }

}
