import { Component, OnInit, ViewChild } from '@angular/core';
import { CommonService } from '../services/common.service';
import { DashboardService } from '../services/dashboard.service';
import { ImportService } from '../services/import.service';
import { AppComponent } from '../app.component';
import { CRMConstants } from '../constants/crmconstants';
import { Router } from '@angular/router';
import { environment } from '../../environments/environment';
import 'chartjs-plugin-datalabels';
import { CustomDatePipe } from '../services/custom.datepipe';
import { TabView } from 'primeng/primeng';
declare var $: any;
@Component({
  selector: 'crm-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  currencyMask = {
    align: 'right',
    prefix: '',
    allowNegative:false,
    thousands: '',
    precision: '2'
  };
  numberMask = {
    align: 'left',
    prefix: '',
    allowNegative:false,
    thousands: '',
    precision: '0'
  };
  incomeModal:any={fromDate:new Date,toDate:new Date(),startDateForAdmin:new Date,endDateForAdmin:new Date(),gallonsSold:0,gasAmount:0.0,insideSalesAmount:0.0,lotteryAmount:0.0,scratchOffSold:0.0,tax:0.0};
  expenditureModel:any={checkdate:new Date(),startDateForAdmin:new Date,endDateForAdmin:new Date(),vendor:{name: 'Others', value: 'Others'}};
  vendorsList:any=[];;
  incomeData: any;
  expencesData: any;
  showSiteIncomeSuccessMessage=false;
  siteIncomeSuccessMessage=""; 
  showSiteIncomeFailureMessage=false;
  siteIncomeFailureMessage=""; 
  showsiteExpensesSuccessMessage=false;
  siteExpensesSuccessMessage=""; 
  showSiteExpensesFailureMessage=false;
  siteExpensesFailureMessage=""; 
  maxDateValue= new Date();
  incomeTabIndex=0;
  todayIncome;
  todayExpenses;
  incomeChartDetailsData;
  expensesChartDetailsData;
  incomeChartByList:any=[{name: 'Monthly Income', value: 'MonthlyIncome'},
  {name: 'By Item', value: 'ByItem'}];;
  expensesModel:any={ startDate:new Date(new Date().setFullYear(new Date().getFullYear() -1)),endDate:new Date()};
  incomeChartModel:any={ startDate:new Date(new Date().setFullYear(new Date().getFullYear() -1)),endDate:new Date(),incomeChartByItem:{name: 'Monthly Income', value: 'MonthlyIncome'}};
  @ViewChild('incomeExpensesTab') tabView: TabView;
  ngOnInit() {
    var self = this;
    $('#notificationFormModal').on('hidden.bs.modal', function (e) {
      $(this).find('form')[0].reset();
      self.resetNotificationForm(null,true);
    })

    $('#notificationcontentModal').on('hidden.bs.modal', function (e) {
      self.documentURL= null;
    })
    $('#tankReportsModal').on('hidden.bs.modal', function (e) {
      self.resetTankReports();
    })
    $('#complianceFormModal').on('hidden.bs.modal', function (e) {
      $(this).find('form')[0].reset();
      self.resetComplianceForm(null,true);
    })
    $('#certificationFormModal').on('hidden.bs.modal', function (e) {
      $(this).find('form')[0].reset();
      self.resetCertificationForm(null,true);
    })
    $('#incomeAndexpenditureModal').on('hidden.bs.modal', function (e) {

      self.resetIncomeExpenatureForm();
    })

    //searchResults
    if (this.commonService.getSearchResult() != null) {
      var resultObj = JSON.parse(this.commonService.getSearchResult())
      this.handleSearchResults(resultObj);
      this.commonService.resetSearchResult();
      return;
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
  dashboardConst = CRMConstants;
  uploadLabel = ""

  GUTTER_COLOR = "#d3e8c8";
  showSearchResults = false;

  selectedChart = 'dashboard';
  // fOperatorFileName;
  // commom properties end
  //consolidate report start
  consolidateReportColors = { "UNLEADED": "#ffffff", "PREMIUM": "#C35A3A", "RECOVERY": "#E18230", "DIESEL": "#F6C918" }
  consolidateFacilitiesdata = [];
  FILL_COLOR = "#2c347E";
  GAL_LEVEL_BELOW_COLOR = "#FF0000";
  NON_FILL_COLOR = "#ef4136";
  // consolidate report end
  //search start
  searchString;
  searchResult = {};
  //search end

  // notification fileupload start
  operatorBusinessFileName;
  operatorBusinessFile;
  operatorBusinessFileSuccess = "false";

  propertyFileName;
  propertyFile;
  propertyFileSuccess = "false";


  ustOwnerBusinessFileName;
  ustOwnerBusinessFile;
  ustOwnerBusinessFileSuccess = "false";
  
  operatorOwnerFileName;
  operatorOwnerFile;
  operatorOwnerFileSuccess = "false";

  propertyOwnerFileName;
  propertyOwnerFile;
  propertyOwnerSuccess = "false";

  ustOwnerFileName;
  ustOwnerFile;
  ustOwnerFileSuccess = "false";

  operatorLeaseAgreementFileName;
  operatorLeaseAgreementFile;
  operatorLeaseAgreementFileSuccess = "false";
  
  ownerAffidavitFileName;
  ownerAffidavitFile;
  ownerAffidavitFileSuccess = "false";
 
  financialResponsibilityFileName;
  financialResponsibilityFile;
  financialResponsibilityFileSuccess = "false";

  deedOrLandContractFileName;
  deedOrLandContractFile;
  deedOrLandContractFileSuccess = "false";

  facilitySiteMapFileName;
  facilitySiteMapFile;
  facilitySiteMapFileSuccess = "false";

  cofaLinkFileName;
  cofaLinkFile;
  cofaLinkFileSuccess = "false";

  

  notificationFormSubmittedFileName;
  notificationFormSubmittedFile;
  notificationFormSubmittedFileSuccess = "false";
  letterOfNetworthCertificationFileName;
  letterOfNetworthCertificationFile;
  letterOfNetworthCertificationFileSuccess = "false";
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
  releaseDetectionReportFileName;
  releaseDetectionReportFile;
  releaseDetectionReportFileSuccess = "false";

  repairDocumentsFileName;
  repairDocumentsFile;
  repairDocumentsFileSuccess = "false";

  tankTestingReportFileName;
  tankTestingReportFile;
  tankTestingReportFileSuccess = "false";

  lineAndLeakDetectorFileName;
  lineAndLeakDetectorFile;
  lineAndLeakDetectorFileSuccess = "false";

  cathodicProtectionFileName;
  cathodicProtectionFile;
  cathodicProtectionFileSuccess = "false";

  internalLiningFileName;
  internalLiningFile;
  internalLiningFileSuccess = "false";

  
  pipingCathodicProtectionFileName;
  pipingCathodicProtectionFile;
  pipingCathodicProtectionFileSuccess = "false";

  dropTubeRepairDocumentFileName;
  dropTubeRepairDocumentFile;
  dropTubeRepairDocumentFileSuccess = "false";
  
  tankInterstitialMonitoringFileName;
  tankInterstitialMonitoringFile;
  tankInterstitialMonitoringFileSuccess = "false";

  pipinginterstitialMonitoringFileName;
  pipinginterstitialMonitoringFile;
  pipinginterstitialMonitoringFileSuccess = "false";
  
  atgTestReportFileName;
  atgTestReportFile;
  atgTestReportFileSuccess = "false";

  atgRepairReportFileName;
  atgRepairReportFile;
  atgRepairReportFileSuccess = "false";

  spillBucketTestingDocumentFileName;
  spillBucketTestingDocumentFile;
  spillBucketTestingDocumentFileSuccess = "false";

  spillBucketRepairDocumentFileName;
  spillBucketRepairDocumentFile;
  spillBucketRepairDocumentFileSuccess = "false";

  sumpMaintenanceDocumentFileName;
  sumpMaintenanceDocumentFile;
  sumpMaintenanceDocumentFileSuccess = "false";

  udcMaintenanceDocumentFileName;
  udcMaintenanceDocumentFile;
  udcMaintenanceDocumentFileSuccess = "false";

  sirReportFileName;
  sirReportFile;
  sirReportFileSuccess = "false";

  monthlyWalkThroughReportFileName;
  monthlyWalkThroughReportFile;
  monthlyWalkThroughReportFileSuccess = "false";

  tankMonitorStaticIPFileName;
  tankMonitorStaticIPFile;
  tankMonitorStaticIPFileSuccess = "false";

  
  
  
  enableComplianceuploadButton = false;
  complianceResultList = [];

  // compliance fileupload end

  //rightside panel variables start
  rightPanelTitle;
  showRightContent = false;
  rightDetailsContent: any = {};
  actualServerData: any = {};
  rightPaneDetailslTitle = "";
  middlePaneClass = "ui-g-6";
  visibleSidebar = false;
  showUploadLoading=false;
  //right side panel variables end
//tank reports panel variables start
tankReportsModalTitle
tankReportTab1Title1;
tankReportTab1Title2;
tankReportTab1Title3;
tankDetailsData;
tankDetailsFirstTabData;
tankDetailsSecondTabData;
tankDetailsThirdTabData;
tankDetailsFirstTabKeys;
tankDetailsSecondTabKeys;
tankDetailsThirdTabKeys;
tankDetailsKeys;
tankDetailsDataKeys;
documentURL=null;
selectedTankReportTTab;
// tank reports panel variables end

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
  constructor(private router: Router, public appcomponent: AppComponent, public commonService: CommonService, 
    private dashboardService: DashboardService, private importService: ImportService, private customDatePipe: CustomDatePipe) {
    // this.loadLeftPanelData();
    if (this.commonService.getSearchResult() == null){
      if(!this.commonService.getMobileAccess())
      this.fetchDashboardValues(true);
    }
  }
  fetchDashboardValues(resetview) {
    if(this.commonService.getUserName() != null && this.commonService.getUserName() != undefined){
    this.dashboardService.getDashboardData(this.commonService.getUserName()) // retrieve all thd parent folders
      .subscribe(
        dashboardData => {
          if (resetview)
            this.resetLeftSideData();
          this.getFacilitiesData(dashboardData.facilitiesData);
          this.getCompanies(dashboardData.companiesData);
          this.consolidateReportdata = this.generateInventoryReport(dashboardData.consolidateReportData, this.consolidateReportdata);
          this.getComplianceData(dashboardData.complianceData);
          if (this.selectedChart === 'dashboard' && !this.commonService.getMobileAccess()) {
            this.setSplitwidth();
            this.setRightSplitwidth();
            this.area.centerVisible = false;
          }
        },
        error => {
          console.log(error);
        });
    if (!this.commonService.isAdmin())
      this.retrieveTankAlarmHistory();
    }

  }
  // Facilities
  showFacilities = this.commonService.getPreferencesOfFacilities();
  facilitiesClass = "ui-g-6"
  facilitiesdata: any;
  facilitiesArray = [];
  facilitiesLabel = [];
  totalFacilities;
  facilitiesRightdata = [];
  nonManagedfacilitiesRightdata = [];
  showMobileFacilities=false;
  showMobileFacilityDetails=false
  showMobileCompanies=false;
  showMobileCompliance = false;
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
    this.facilitiesLabel.push(this.dashboardConst.MANAGED);
    this.facilitiesLabel.push(this.dashboardConst.UNMANAGED);
    this.facilitiesdata.labels.push(this.facilitiesLabel[0] + ' ' );
    this.facilitiesdata.labels.push(this.facilitiesLabel[1] + ' ' )
    this.totalFacilities = this.facilitiesArray[1] + this.facilitiesArray[0];

  }
  onFacilitiesDataSelect($event) {
    if(this.commonService.getMobileAccess())
    {
      this.fetchManagedAndNonManagedFacitlities();
      return;
    }
    var event;
    if ($event == null || $event == undefined)
      event = 0;// left overlaypanel clicked
    else
      event = $event.element._index
    this.selectedChart = "facilities";
    this.showRightContent = false;
    this.hideSearchPanel();
    this.area.centerVisible = true;
    this.resetrightSideData();
    console.log("onFacilitiesDataSelect", this.facilitiesLabel[event]);
    this.showCompanies = false;
    this.showCompliance = false;
    this.showConsolidateReport = false;
    this.facilitiesClass = "ui-g-12";
    this.showBack = true;
    if ($event == null || $event == undefined) {
      this.fetchDashboardValues(false);
      return;
    }
    this.showRightContent = true;
    this.rightPanelTitle = this.dashboardConst.MYFACALITIES + " -- " + this.facilitiesLabel[event] + " (" + this.facilitiesArray[event] + ")"

    this.dashboardService.getFacilitiesList(this.commonService.getUserName(), this.facilitiesLabel[event]) // retrieve all thd parent folders
      .subscribe(
        facilitiesList => {
          for (var i = 0; i < facilitiesList.length; i++) {
            var faciData = facilitiesList[i];
            if (this.facilitiesLabel[event] == this.dashboardConst.UNMANAGED)
              faciData.compliance = false;
            else if (faciData.compliance != null)
              faciData.compliance = faciData.compliance == "true";
            faciData.tankPaidService = faciData.tankPaidService == "true";
            faciData.paidService = faciData.paidService == "true";
            // faciData.compliance = faciData.compliance && faciData.tankPaidService;
            // var image = this.commonService.gasStationImage(faciData.brand)
            // faciData.image = "assets/images/gasstation/"+image;
            // this.getFacilityConsolidateReport(faciData.consolidateReport);
            faciData.image = environment.server + faciData.imageURL;
            this.facilitiesRightdata.push(faciData);
          }

        },
        error => {
          console.log(error);
        });

  }
  fetchManagedAndNonManagedFacitlities(){
    this.facilitiesRightdata=[];
    this.nonManagedfacilitiesRightdata =[];
    this.companiesRightdata=[];
    this.showMobileFacilities=true;
    this.showMobileFacilityDetails=false
    this.dashboardService.getFacilitiesList(this.commonService.getUserName(), this.dashboardConst.MANAGED) // retrieve all thd parent folders
      .subscribe(
        facilitiesList => {
          for (var i = 0; i < facilitiesList.length; i++) {
            var faciData = facilitiesList[i];
           if (faciData.compliance != null)
              faciData.compliance = faciData.compliance == "true";
            faciData.tankPaidService = faciData.tankPaidService == "true";
            faciData.paidService = faciData.paidService == "true";
            // faciData.compliance = faciData.compliance && faciData.tankPaidService;
            // var image = this.commonService.gasStationImage(faciData.brand)
            // faciData.image = "assets/images/gasstation/"+image;
            // this.getFacilityConsolidateReport(faciData.consolidateReport);
            faciData.image = environment.server + faciData.imageURL;
            this.facilitiesRightdata.push(faciData);
          }

        },
        error => {
          console.log(error);
        });
        this.dashboardService.getFacilitiesList(this.commonService.getUserName(), this.dashboardConst.UNMANAGED) // retrieve all thd parent folders
        .subscribe(
          facilitiesList => {
            for (var i = 0; i < facilitiesList.length; i++) {
              var faciData = facilitiesList[i];
                faciData.compliance = false;
              faciData.tankPaidService = faciData.tankPaidService == "true";
              faciData.compliance = faciData.compliance == "true";
              faciData.paidService = faciData.paidService == "true";
              // faciData.compliance = faciData.compliance && faciData.tankPaidService;
              // var image = this.commonService.gasStationImage(faciData.brand)
              // faciData.image = "assets/images/gasstation/"+image;
              // this.getFacilityConsolidateReport(faciData.consolidateReport);
              faciData.image = environment.server + faciData.imageURL;
              this.nonManagedfacilitiesRightdata.push(faciData);
            }
  
          },
          error => {
            console.log(error);
          });

  }
  fetchComplianceNonComplianceFacitlities(){
    this.facilitiesRightdata=[];
    this.nonManagedfacilitiesRightdata =[];
    this.companiesRightdata=[];
    this.showMobileFacilities=true;
    this.showMobileFacilityDetails=false;
  this.dashboardService.getComplianceList(this.commonService.getUserName(), "compliance") // retrieve all thd parent folders
    .subscribe(
      complianceList => {
        if (complianceList !== null)
          for (var i = 0; i < complianceList.length; i++) {
            var faciData = complianceList[i];
            // var image = this.commonService.gasStationImage(feciData.brand)
            faciData.compliance = faciData.compliance == "true";
            faciData.tankPaidService = faciData.tankPaidService == "true";
            faciData.paidService = faciData.paidService == "true";
            faciData.image = environment.server + faciData.imageURL;
            this.facilitiesRightdata.push(faciData);
          }

      },
      error => {
        console.log(error);
      });
      this.dashboardService.getComplianceList(this.commonService.getUserName(), "non compliance") // retrieve all thd parent folders
      .subscribe(
        complianceList => {
          if (complianceList !== null)
            for (var i = 0; i < complianceList.length; i++) {
              var faciData = complianceList[i];
              // var image = this.commonService.gasStationImage(feciData.brand)
              faciData.compliance = faciData.compliance == "true";
              faciData.tankPaidService = faciData.tankPaidService == "true";
              faciData.paidService = faciData.paidService == "true";
              faciData.image = environment.server + faciData.imageURL;
              this.nonManagedfacilitiesRightdata.push(faciData);
            }
  
        },
        error => {
          console.log(error);
        });
  }
  compliance = true;
  selectedFacility;
  showSpecificfacilityDetails(fdata) {
    console.log(fdata);
    this.rightDetailsContent.facilityTankPaidMessage = null;
    this.showRightDetailPanel();
    // this.showRightContent = false;
    if (fdata.tankPaidService == false) {
      this.rightDetailsContent.facilityTankPaidMessage = fdata.facilityTankPaidMessage;
      return;
    }
    this.selectedFacility = fdata;
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
    this.rightDetailsContent.leakTankTestCount = fdata.leakTankTestCount;
    this.rightDetailsContent.tankStatusCount = fdata.tankStatusCount;
    this.rightDetailsContent.csldCount = fdata.csldCount;

    this.rightDetailsContent.leakTankTestButtonStatus = fdata.leakTankTestButtonStatus;
    this.rightDetailsContent.tankStatusButtonStatus = fdata.tankStatusButtonStatus;
    this.rightDetailsContent.csldButtonStatus = fdata.csldButtonStatus;
    this.rightDetailsContent.incomeExpenseUpdatesButtonEnable = fdata.incomeExpenseUpdatesButtonEnable;
    this.rightDetailsContent.address = fdata.address;
    this.rightDetailsContent.tankPaidService = fdata.tankPaidService;
    this.rightDetailsContent.paidService = fdata.paidService;
    this.rightDetailsContent.storeManager = fdata.storeManager;
    this.rightDetailsContent.projectManager = fdata.projectManager;
    this.rightDetailsContent.projectManagerPhone = fdata.projectManagerPhone;
    this.rightDetailsContent.tankPm = fdata.tankPm;
    
    this.rightDetailsContent.compliance = fdata.compliance;
    this.rightDetailsContent.backConsolidateReport = fdata.consolidateReport;
    this.rightDetailsContent.consolidateReport = [];
    if(fdata.consolidateReport!=null)
    this.rightDetailsContent.consolidateReport = this.generateInventoryReportForRightSideData(fdata.consolidateReport, this.rightDetailsContent.consolidateReport,fdata.gasLevel);
    //actualServerData details.
    this.actualServerData.docUpdateDate = new Date();
    this.actualServerData.facilityName = fdata.name;
    this.actualServerData.facilityId = fdata.facilityId;
    this.actualServerData.fid = fdata.fid;
    this.actualServerData.street = fdata.street;
    this.actualServerData.city = fdata.city;
    this.actualServerData.requestFrom = "golarsTank";
    this.actualServerData.clientContact=fdata.clientContact;


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
    this.companiesdata.labels.push('Total')
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
    this.showMobileCompanies=true;
    this.facilitiesRightdata=[];
    this.nonManagedfacilitiesRightdata =[];
    this.showMobileFacilities=false;
    this.showMobileFacilityDetails=false
    this.showCompliance = false;
    this.area.centerVisible = true;
    this.showConsolidateReport = false;
    this.companiesClass = "ui-g-12";
    this.showRightContent = false;
    this.showBack = true;
    if (!this.commonService.getMobileAccess() &&($event == null || $event == undefined)) {
      this.fetchDashboardValues(false);
      return;
    }
    this.showRightContent = true;
    this.rightPanelTitle = this.dashboardConst.MYCOMPANIES + " -- " + " (" + this.totalCompanies + ")";
    this.dashboardService.getCompaniesList(this.commonService.getUserName()) // retrieve all thd parent folders
      .subscribe(
        companiesList => {
          for (var i = 0; i < companiesList.length; i++) {
            var faciData = companiesList[i];
            for (var j = 0; j < faciData.facilities.length; j++) {
              if (faciData.facilities[j].compliance != null)
                faciData.facilities[j].compliance = faciData.facilities[j].compliance == "true";
                if (faciData.facilities[j].tankPaidService != null)
                faciData.facilities[j].tankPaidService = faciData.facilities[j].tankPaidService == "true";
                if (faciData.facilities[j].paidService != null)
                faciData.facilities[j].paidService = faciData.facilities[j].paidService == "true";
              faciData.facilities[j].image = environment.server + faciData.facilities[j].imageURL;
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
    this.complianceLabel.push("Compliant");
    this.complianceLabel.push("Non-compliant");
    // this.nonCompliance = 9;
    this.complianceData.labels.push('Compliant ');
    this.complianceData.labels.push('Non-compliant ');
    this.complianceData.datasets[0].data.push(this.complianceArray[0]);
    this.complianceData.datasets[0].data.push(this.complianceArray[1]);
    this.totalCompliance = this.complianceArray[1] + this.complianceArray[0];
  }

  onComplianceDataSelect($event) {
     if(this.commonService.getMobileAccess())
    {
      this.fetchComplianceNonComplianceFacitlities();
      return;
    }
    var event;
    if ($event == null || $event == undefined)
      event = 0;// left overlaypanel clicked
    else
      event = $event.element._index
    this.selectedChart = "compliance";
    this.hideSearchPanel();
    this.resetrightSideData();
    this.area.centerVisible = true;
    console.log("onComplianceDataSelect" + event)
    this.showFacilities = false;
    this.showCompanies = false;
    this.showConsolidateReport = false;
    this.complianceClass = "ui-g-12";
    this.showRightContent = false;
    this.showBack = true;
    if ($event == null || $event == undefined) {
      this.fetchDashboardValues(false);
      return;
    }


    this.rightPanelTitle = this.dashboardConst.MYCOMPLIANCE + " -- " + this.complianceLabel[event] + " (" + this.complianceArray[event] + ")";
    this.showRightContent = true;
    var complianceParam = "compliant";
    if (this.complianceLabel[event].toLowerCase() == 'compliant')
      complianceParam = 'compliance'
    else
      complianceParam = 'non compliance'
    this.dashboardService.getComplianceList(this.commonService.getUserName(), complianceParam) // retrieve all thd parent folders
      .subscribe(
        complianceList => {
          if (complianceList !== null)
            for (var i = 0; i < complianceList.length; i++) {
              var faciData = complianceList[i];
              // var image = this.commonService.gasStationImage(feciData.brand)
              faciData.compliance = faciData.compliance == "true";
              faciData.tankPaidService = faciData.tankPaidService == "true";
              faciData.paidService = faciData.paidService == "true";
              faciData.image = environment.server + faciData.imageURL;
              this.complianceRightdata.push(faciData);
            }

        },
        error => {
          console.log(error);
        });
  }

  // compliance end


  //consolidateReport start
  consolidateReportdata: any;
  facilityConsolidateReportdata: any;
  showConsolidateReport = this.commonService.getPreferencesOfConsolidate();
  reportClass = "ui-g-6"
  // regular;
  // midGrade;
  // premium;
  // diesel;
  // totalGallons = 1000;
  generateInventoryReport(consolidateData, consolidateReportdata) {
    consolidateReportdata = {
      labels: [],
      datasets: [
        {
          data: [],
          backgroundColor: [],
          borderColor: [],
          borderWidth: 1,
          hoverBackgroundColor: []
        }
      ]
    };
    for (var i = 0; i < consolidateData.length; i++) {
      consolidateReportdata.labels.push(consolidateData[i].key);
      consolidateReportdata.datasets[0].data.push(Number(consolidateData[i].value));
      consolidateReportdata.datasets[0].backgroundColor.push(this.consolidateReportColors[consolidateData[i].key]);
      consolidateReportdata.datasets[0].hoverBackgroundColor.push(this.consolidateReportColors[consolidateData[i].key]);
      if (consolidateData[i].key === "UNLEADED")
        consolidateReportdata.datasets[0].borderColor.push('#000000');
      else
        consolidateReportdata.datasets[0].borderColor.push(this.consolidateReportColors[consolidateData[i].key]);
    }

    return consolidateReportdata;
  }
  generateInventoryReportForRightSideData(consolidateData, consolidateReportdata,gasLevel) {
    consolidateReportdata = {
      labels: [],
      datasets: [
        {
          data: [],
          backgroundColor: [],
          borderColor: [],
          borderWidth: 1,
          hoverBackgroundColor: []
        }
      ]
    };
    var gasLevelArray=[]
    if(gasLevel){
    var gasResult = this.getGasLevels(gasLevel);
    
    if(gasResult)
        for (var i = 0; i < gasResult.length; i++) {
          var row = {};
          row["key"] = gasResult[i].key;
          row["value"] = gasResult[i].value;
          gasLevelArray.push(row)
        }
      }
    for (var i = 0; i < consolidateData.length; i++) {
      consolidateReportdata.labels.push(consolidateData[i].key);
      consolidateReportdata.datasets[0].data.push(Number(consolidateData[i].value));
      var result=false;
      for(var j=0;j<gasLevelArray.length;j++){
        if(gasLevelArray[j].key === consolidateData[i].key){
          if(gasLevelArray[j].value > consolidateData[i].value){
            result=true;
            break;
          }
        }
      }
      if(result){
        consolidateReportdata.datasets[0].backgroundColor.push(this.GAL_LEVEL_BELOW_COLOR);
      consolidateReportdata.datasets[0].hoverBackgroundColor.push(this.GAL_LEVEL_BELOW_COLOR);
      }else{
      consolidateReportdata.datasets[0].backgroundColor.push(this.consolidateReportColors[consolidateData[i].key]);
      consolidateReportdata.datasets[0].hoverBackgroundColor.push(this.consolidateReportColors[consolidateData[i].key]);
      if (consolidateData[i].key === "UNLEADED")
        consolidateReportdata.datasets[0].borderColor.push('#000000');
      else
        consolidateReportdata.datasets[0].borderColor.push(this.consolidateReportColors[consolidateData[i].key]);
    }
      
    }

    return consolidateReportdata;
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
  // constructPercentage(value1, value2) {
  //   var value = "0";
  //   if (value1 == 0 && value1 == 0) {
  //     value = "0";
  //   } else
  //     value = ((value1 / (value1 + value2)) * 100).toFixed(2);
  //   value = value.replace(".00", '');
  //   value = '(' + value + "%)";
  //   return value;
  // }




  private options: any = {
    legend: { position: 'bottom' },
    responsive: true,
    maintainAspectRatio: false,
      plugins: {
        datalabels: {
         display: true,
         align: 'center',
         anchor: 'center',
         color:'#FFFFFF',
         font: { weight: 'bold',size:'20' }
      }
    }
  }
  private noLegendtOptions = {
    legend: { display: false },
    responsive: false,
    maintainAspectRatio: false,
    plugins: {
      datalabels: {
         display: true,
         align: '100',
         anchor: 'top',
         font: { weight: 'bold',size:'14' }
      }
   },
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
  private incomeExpensesChartOptions: any = {

   legend: {
      onHover: function(e) {
         e.target.style.cursor = 'pointer';
      }
   },
   hover: {
      onHover: function(e) {
         var point = this.getElementAtEvent(e);
         if (point.length) e.target.style.cursor = 'pointer';
         else e.target.style.cursor = 'default';
      }
   }
  }
  showAll() {
    this.selectedChart = 'dashboard';
    this.showBack = false;
    this.showRightContent = false;

    this.hideSearchPanel();
    this.fetchDashboardValues(true);
    this.resetView();
    this.area.centerVisible = false;
    this.area.rightVisible = false;
    this.setSplitwidth();
    this.setRightSplitwidth();

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
    this.area.center = 0;
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
    this.newsFeedVisible = false;
    this.area.left = 20;
    this.area.center = 80;
    this.area.right = 0;
    this.reSetSplitwidth();
  }
  // getImage(fdata) {
  //   return "assets/images/gasstation/" + fdata.img;
  // }
  showRightDetailPanel() {
    if (this.selectedChart == "companies" || this.selectedChart == "facilities" || this.selectedChart == "compliance")
      this.middlePaneClass = "ui-g-12";
    else
      this.middlePaneClass = "ui-g-6";
    this.area.center = 40;
    this.area.right = 40;
    this.area.rightVisible = true;
  }
  hideRightContentDetails(rightDetailsContent) {
    rightDetailsContent = [];
    this.actualServerData = [];
    this.area.left = 20;
    this.area.center = 80;
    this.area.right = 0;
    this.middlePaneClass = "ui-g-4"
    this.area.rightVisible = false;
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
    this.dashboardService.getNotifictionUSTCertificationUploadData(facilitiesId) // retrieve all thd parent folders
      .subscribe(
        modalData => {
          this.modalData = modalData;
        },
        error => {
          console.log(error);
        });
  }
  getUSTComplianceData(facilitiesId) {
    this.dashboardService.getNotifictionUSTCertificationUploadData(facilitiesId) // retrieve all thd parent folders
      .subscribe(
        modalData => {
          this.modalData = modalData;
        },
        error => {
          console.log(error);
        });
  }
  getCertificationData(facilitiesId) {
    this.dashboardService.getNotifictionUSTCertificationUploadData(facilitiesId) // retrieve all thd parent folders
      .subscribe(
        modalData => {
          this.modalData = modalData;
        },
        error => {
          console.log(error);
        });
  }

  getTankLeakTestButtonClass(rightDetailsContent) {
    if ((rightDetailsContent.leakTankTestButtonStatus != null && rightDetailsContent.leakTankTestButtonStatus == "#ff0000"))
      return 'facility-button-background-red'
      else if ((rightDetailsContent.leakTankTestButtonStatus != null && rightDetailsContent.leakTankTestButtonStatus == "#00FF00"))
      return 'facility-button-background-green'
      else if ((rightDetailsContent.leakTankTestButtonStatus != null && rightDetailsContent.leakTankTestButtonStatus == "#808080"))
      return 'facility-button-background-gray'
    return ""
  }
  getTankStatusButtonClass(rightDetailsContent) {
    if ((rightDetailsContent.tankStatusButtonStatus != null && rightDetailsContent.tankStatusButtonStatus == "#ff0000"))
      return 'facility-button-background-red'
      else if ((rightDetailsContent.tankStatusButtonStatus != null && rightDetailsContent.tankStatusButtonStatus == "#00FF00"))
      return 'facility-button-background-green'
      else if ((rightDetailsContent.tankStatusButtonStatus != null && rightDetailsContent.tankStatusButtonStatus == "#808080"))
      return 'facility-button-background-gray'
    return ""
  }
  getCSCLTestButtonClass(rightDetailsContent) {
    if ((rightDetailsContent.csldButtonStatus != null && rightDetailsContent.csldButtonStatus == "#ff0000"))
      return 'facility-button-background-red'
      else if ((rightDetailsContent.csldButtonStatus != null && rightDetailsContent.csldButtonStatus == "#00FF00"))
      return 'facility-button-background-green'
      else if ((rightDetailsContent.csldButtonStatus != null && rightDetailsContent.csldButtonStatus == "#808080"))
      return 'facility-button-background-gray'
    return ""
  }

  getNotificationFormButtonClass(rightDetailsContent) {
    if ((rightDetailsContent.notificationFormButtonEnable != null && rightDetailsContent.notificationFormButtonEnable == "true"))
      return 'facility-button-background-notification-red'
    return ""
  }
  getComplianceButtonClass(rightDetailsContent) {
    if ((rightDetailsContent.complianceButtonEnable != null && rightDetailsContent.complianceButtonEnable == "true"))
      return 'facility-button-background-notification-red'
    return ""
  }
  getCertificationButtonClass(rightDetailsContent) {
    if ((rightDetailsContent.certificationButtonEnable != null && rightDetailsContent.certificationButtonEnable == "true"))
      return 'facility-button-background-notification-red'
    return ""
  }
  getIncomeExpenseUpdatesButtonEnable(rightDetailsContent) {
    if ((rightDetailsContent.incomeExpenseUpdatesButtonEnable != null && rightDetailsContent.incomeExpenseUpdatesButtonEnable == "true"))
      return 'facility-button-background-notification-red'
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
    this.showUploadLoading = true;
    // console.log(this.fileInput.files.length)
    var frmData = new FormData();

    var fileuploadlabelArray = [];
    frmData.append("docProperties", this.getDocumentProperties());

    frmData.append("facilityId", this.rightDetailsContent.facilityId);
    if (this.operatorBusinessFile != null) {
      this.generateFileUploadObj(this.operatorBusinessFile, frmData, 'operatorBusinessFile', fileuploadlabelArray)
    }
    if (this.propertyFile != null) {
      this.generateFileUploadObj(this.propertyFile, frmData, 'propertyOwnerBusiness', fileuploadlabelArray)
    }
    if (this.ustOwnerBusinessFile != null) {
      this.generateFileUploadObj(this.ustOwnerBusinessFile, frmData, 'ustOwnerBusiness', fileuploadlabelArray)
    }
    if (this.operatorOwnerFile != null) {
      this.generateFileUploadObj(this.operatorOwnerFile, frmData, 'operatorOwnerTaxID', fileuploadlabelArray)
    }
    if (this.propertyOwnerFile != null) {
      this.generateFileUploadObj(this.propertyOwnerFile, frmData, 'propertyOwnerTaxID', fileuploadlabelArray)
    }
    if (this.deedOrLandContractFile != null) {
      this.generateFileUploadObj(this.deedOrLandContractFile, frmData, 'deedOrLandContract', fileuploadlabelArray)
    }
    if (this.facilitySiteMapFile != null) {
      this.generateFileUploadObj(this.facilitySiteMapFile, frmData, 'facilitySiteMap', fileuploadlabelArray)
    }
    if (this.cofaLinkFile != null) {
      this.generateFileUploadObj(this.cofaLinkFile, frmData, 'cofaLink', fileuploadlabelArray)
    }
    
    if (this.ustOwnerFile != null) {
      this.generateFileUploadObj(this.ustOwnerFile, frmData, 'ustOwnerTaxId', fileuploadlabelArray)
    }
    if (this.ownerAffidavitFile != null) {
      this.generateFileUploadObj(this.ownerAffidavitFile, frmData, 'ownerAffidevitOfLease', fileuploadlabelArray)
    }
    if (this.operatorLeaseAgreementFile != null) {
      this.generateFileUploadObj(this.operatorLeaseAgreementFile, frmData, 'operatorLeaseAgreement', fileuploadlabelArray)
    }

    if (this.financialResponsibilityFile != null) {
      this.generateFileUploadObj(this.financialResponsibilityFile, frmData, 'financialResponsibility', fileuploadlabelArray)
    }
    if (this.notificationFormSubmittedFile != null) {
      this.generateFileUploadObj(this.notificationFormSubmittedFile, frmData, 'notificationFormSubmitted', fileuploadlabelArray)
    }
    if (this.letterOfNetworthCertificationFile != null) {
      this.generateFileUploadObj(this.letterOfNetworthCertificationFile, frmData, 'letterOfNetworthCertification', fileuploadlabelArray)
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
              if (result[i].key == 'operatorBusinessFile'){
                this.operatorBusinessFileSuccess = result[i].value;
                this.modalData.operatorBusinessSubmitted = true;
              }
              if (result[i].key == 'propertyOwnerBusiness'){
                this.propertyFileSuccess = result[i].value;
                this.modalData.propertyOwnerBusinessSubmitted = true;
              }
              if (result[i].key == 'ustOwnerBusiness'){
                this.ustOwnerBusinessFileSuccess = result[i].value;
                this.modalData.ustOwnerBusinessSubmitted = true;
              }
              if (result[i].key == 'operatorOwnerTaxID'){
                this.operatorOwnerFileSuccess = result[i].value;
                this.modalData.operatorOwnerSubmitted = true;
              }
                if (result[i].key == 'propertyOwnerTaxID'){
                this.propertyOwnerSuccess = result[i].value;
                this.modalData.propertyOwnerTaxIDSubmitted = true;
              }
              if (result[i].key == 'ustOwnerTaxId'){
                this.ustOwnerFileSuccess = result[i].value;
                this.modalData.ustOwnerSubmitted = true;
              }
              if (result[i].key == 'operatorLeaseAgreement'){
                this.operatorLeaseAgreementFileSuccess = result[i].value;
                this.modalData.operatorLeaseAgreementSubmitted = true;
              }
              if (result[i].key == 'financialResponsibility'){
                this.financialResponsibilityFileSuccess = result[i].value;
                this.modalData.financialResponsibilitySubmitted = true;
              }
              if (result[i].key == 'deedOrLandContract'){
                this.deedOrLandContractFileSuccess = result[i].value;
                this.modalData.propertyDeedLandContractEnable = true;
              }
              if (result[i].key == 'facilitySiteMap'){
                this.facilitySiteMapFileSuccess = result[i].value;
                this.modalData.facilitySiteMapSubmitted = true;
              }
              if (result[i].key == 'cofaLink'){
                this.cofaLinkFileSuccess = result[i].value;
                this.modalData.cofaLinkSubmitted = true;
              }
              
              
              if (result[i].key == 'ownerAffidevitOfLease'){
                this.ownerAffidavitFileSuccess = result[i].value;
                this.modalData.ownerAffidevitOfLeaseEnable= false; 
              }
              
             
              // if (result[i].key == 'notificationFormSubmitted'){
              //   this.notificationFormSubmittedFileSuccess = result[i].value;
              //   this.modalData.ustOwnerPOAEnable = false;
              // }
              if (result[i].key == 'letterOfNetworthCertification'){
                this.letterOfNetworthCertificationFileSuccess = result[i].value;
                this.modalData.letterOfNetworthCertificationEnable = false;
              }

            }

            //notification form start
            this.resetNotificationForm(frmData,false);
            //notification form end
          }
          this.showUploadLoading = false;

        },
        error => {
          console.log(error);
        });

  }
  resetNotificationForm(frmData,clearTick) {
    this.showUploadLoading = false;
    this.operatorBusinessFileName = "";
    this.propertyFileName = "";
    this.ustOwnerBusinessFileName = "";
    this.operatorOwnerFileName = "";
    this.propertyOwnerFileName = "";
    this.ustOwnerFileName = "";
    this.ownerAffidavitFileName = "";
    this.operatorLeaseAgreementFileName = "";
    this.financialResponsibilityFileName = "";
    this.deedOrLandContractFileName=""
    this.facilitySiteMapFileName="";
    this.cofaLinkFileName="";
    this.notificationFormSubmittedFileName = "";
    this.letterOfNetworthCertificationFileName = "";
    // clearing form names start
    this.operatorBusinessFile = null;
    this.propertyFile = null;
    this.ustOwnerBusinessFile = null;
    this.operatorOwnerFile = null;
    this.propertyOwnerFile  = null;
    this.ustOwnerFile = null;
    this.ownerAffidavitFile = null;
    this.operatorLeaseAgreementFile = null;
    this.financialResponsibilityFile  = null;
    this.letterOfNetworthCertificationFile = null;
    //clearing form names end
    if (clearTick) {
      this.operatorBusinessFileSuccess = "false";
      this.propertyFileSuccess = "false";
      this.ustOwnerBusinessFileSuccess = "false";
      this.operatorOwnerFileSuccess = "false";
      this.propertyOwnerSuccess = "false";
      this.deedOrLandContractFileSuccess="false"
      this.facilitySiteMapFileSuccess="false";
      this.cofaLinkFileSuccess="false";
      this.ustOwnerFileSuccess = "false";
      this.ownerAffidavitFileSuccess = "false";
      this.operatorLeaseAgreementFileSuccess = "false";
      this.financialResponsibilityFileSuccess = "false";
      this.letterOfNetworthCertificationFileSuccess = "false"
    }
    this.enableNotificationuploadButton = false;
    if(frmData != null)
    frmData = new FormData();
  }
  //import notification files end


  //import compliance files start
  importComplianceDocuments() {
    // console.log(this.fileInput.files.length)
    this.showUploadLoading = true;
    var frmData = new FormData();

    var complianceUploadArray = [];
    frmData.append("docProperties", this.getDocumentProperties());

    frmData.append("facilityId", this.rightDetailsContent.facilityId);
    if (this.releaseDetectionReportFile != null) {
      this.generateFileUploadObj(this.releaseDetectionReportFile, frmData, 'releaseDetectionReport', complianceUploadArray)
    }
    if (this.repairDocumentsFile != null) {
      this.generateFileUploadObj(this.repairDocumentsFile, frmData, 'repairDocuments', complianceUploadArray)
    }
    if (this.lineAndLeakDetectorFile != null) {
      this.generateFileUploadObj(this.lineAndLeakDetectorFile, frmData, 'lineAndLeakDetector', complianceUploadArray)
    }
 
    if (this.tankTestingReportFile != null) {
      this.generateFileUploadObj(this.tankTestingReportFile, frmData, 'tankTestingReport', complianceUploadArray)
    }
    if (this.cathodicProtectionFile != null) {
      this.generateFileUploadObj(this.cathodicProtectionFile, frmData, 'cathodicProtection', complianceUploadArray)
    }
    if (this.internalLiningFile != null) {
      this.generateFileUploadObj(this.internalLiningFile, frmData, 'internalLining', complianceUploadArray)
    }
    if (this. pipingCathodicProtectionFile != null) {
      this.generateFileUploadObj(this. pipingCathodicProtectionFile, frmData, 'pipingCathodicProtection', complianceUploadArray)
    }
    if (this. dropTubeRepairDocumentFile != null) {
      this.generateFileUploadObj(this. dropTubeRepairDocumentFile, frmData, 'dropTubeRepairDocument', complianceUploadArray)
    }
    if (this. tankInterstitialMonitoringFile != null) {
      this.generateFileUploadObj(this. tankInterstitialMonitoringFile, frmData, 'tankInterstitialMonitoring', complianceUploadArray)
    }
    if (this. pipinginterstitialMonitoringFile != null) {
      this.generateFileUploadObj(this. pipinginterstitialMonitoringFile, frmData, 'pipinginterstitialMonitoring', complianceUploadArray)
    }
    if (this. atgTestReportFile != null) {
      this.generateFileUploadObj(this. atgTestReportFile, frmData, 'atgTestReport', complianceUploadArray)
    }
    if (this. atgRepairReportFile != null) {
      this.generateFileUploadObj(this. atgRepairReportFile, frmData, 'atgRepairReport', complianceUploadArray)
    }
    if (this. spillBucketTestingDocumentFile != null) {
      this.generateFileUploadObj(this. spillBucketTestingDocumentFile, frmData, 'spillBucketTestingDocument', complianceUploadArray)
    }
    if (this. spillBucketRepairDocumentFile != null) {
      this.generateFileUploadObj(this. spillBucketRepairDocumentFile, frmData, 'spillBucketRepairDocument', complianceUploadArray)
    }
    if (this. sumpMaintenanceDocumentFile != null) {
      this.generateFileUploadObj(this. sumpMaintenanceDocumentFile, frmData, 'sumpMaintenanceDocument', complianceUploadArray)
    }
    if (this. udcMaintenanceDocumentFile != null) {
      this.generateFileUploadObj(this. udcMaintenanceDocumentFile, frmData, 'udcMaintenanceDocument', complianceUploadArray)
    }
    if (this. sirReportFile != null) {
      this.generateFileUploadObj(this. sirReportFile, frmData, 'sirReport', complianceUploadArray)
    }
    if (this. monthlyWalkThroughReportFile != null) {
      this.generateFileUploadObj(this. monthlyWalkThroughReportFile, frmData, 'monthlyWalkThroughReport', complianceUploadArray)
    }
    if (this. tankMonitorStaticIPFile != null) {
      this.generateFileUploadObj(this. tankMonitorStaticIPFile, frmData, 'tankMonitorStaticIP', complianceUploadArray)
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
              if (result[i].key == 'releaseDetectionReport'){
                this.releaseDetectionReportFileSuccess = result[i].value;
                this.modalData.releaseDetectionReportSubmitted = true;
              }
              if (result[i].key == 'repairDocuments'){
                this.repairDocumentsFileSuccess = result[i].value;
                this.modalData.repairDocumentsSubmitted=true;
              }
              if (result[i].key == 'lineAndLeakDetector'){
                this.lineAndLeakDetectorFileSuccess = result[i].value;
                this.modalData.lineAndLeakDetectorSubmitted=true;
              }
              
              if (result[i].key == 'tankTestingReport'){
                this.tankTestingReportFileSuccess = result[i].value;
                this.modalData.tankTestingReportSubmitted=true;
              }

              if (result[i].key == 'cathodicProtection'){
                this.cathodicProtectionFileSuccess = result[i].value;
                this.modalData.cathodicProtectionSubmitted=true;
              }
              if (result[i].key == 'internalLining'){
                this.internalLiningFileSuccess = result[i].value;
                this.modalData.internalLiningInspectionSubmitted=true;
              }
              if (result[i].key == 'pipingCathodicProtection'){
                this.pipingCathodicProtectionFileSuccess = result[i].value;
                this.modalData.pipingCathodicProtectionSubmitted=true;
              }

              if (result[i].key == 'dropTubeRepairDocument'){
                this.dropTubeRepairDocumentFileSuccess = result[i].value;
                this.modalData.dropTubeRepairDocumentSubmitted=true;
              }
              if (result[i].key == 'tankInterstitialMonitoring'){
                this.tankInterstitialMonitoringFileSuccess = result[i].value;
                this.modalData.tankInterstitialMonitoringSubmitted=true;
              }
              if (result[i].key == 'pipinginterstitialMonitoring'){
                this.pipinginterstitialMonitoringFileSuccess = result[i].value;
                this.modalData.pipinginterstitialMonitoringSubmitted=true;
              }
              if (result[i].key == 'atgTestReport'){
                this.atgTestReportFileSuccess = result[i].value;
                this.modalData.atgTestReportSubmitted=true;
              }
              if (result[i].key == 'atgRepairReport'){
                this.atgRepairReportFileSuccess = result[i].value;
                this.modalData.atgRepairReportSubmitted=true;
              }
              if (result[i].key == 'spillBucketTestingDocument'){
                this.spillBucketTestingDocumentFileSuccess = result[i].value;
                this.modalData.spillBucketTestingDocumentSubmitted=true;
              }
              if (result[i].key == 'spillBucketRepairDocument'){
                this.spillBucketRepairDocumentFileSuccess = result[i].value;
                this.modalData.spillBucketRepairDocumentSubmitted=true;
              }
              if (result[i].key == 'sumpMaintenanceDocument'){
                this.sumpMaintenanceDocumentFileSuccess = result[i].value;
                this.modalData.sumpMaintenanceDocumentSubmitted=true;
              }
              if (result[i].key == 'udcMaintenanceDocument'){
                this.udcMaintenanceDocumentFileSuccess = result[i].value;
                this.modalData.udcMaintenanceDocumentSubmitted=true;
              } 
              if (result[i].key == 'sirReport'){
                this.sirReportFileSuccess = result[i].value;
                this.modalData.sirReportSubmitted=true;
              } 
              if (result[i].key == 'monthlyWalkThroughReport'){
                this.monthlyWalkThroughReportFileSuccess = result[i].value;
                this.modalData.monthlyWalkThroughReportSubmitted=true;
              }
              if (result[i].key == 'tankMonitorStaticIP'){
                this.tankMonitorStaticIPFileSuccess = result[i].value;
                this.modalData.tankMonitorStaticIPSubmitted=true;
              } 
              
            }

            //notification form start
            this.resetComplianceForm(frmData,false);
            //notification form end
          }
          this.showUploadLoading = false;

        },
        error => {
          console.log(error);
        });

  }
  resetComplianceForm(frmData, clearTick) {
    this.showUploadLoading = false;
    this.releaseDetectionReportFileName = "";
    this.repairDocumentsFileName = "";
    this.tankTestingReportFileName = "";
    this.tankTestingReportFile = "";
    this.cathodicProtectionFileName = "";
    this.internalLiningFileName="";
    this. pipingCathodicProtectionFile="";
    this.dropTubeRepairDocumentFile="";
    this.tankInterstitialMonitoringFile="";
    this.pipinginterstitialMonitoringFile ="";
    this.atgTestReportFile="";
    this.atgRepairReportFile="";
    this.spillBucketTestingDocumentFile="";
    this.spillBucketRepairDocumentFile="";
    this.sumpMaintenanceDocumentFile="";
    this.udcMaintenanceDocumentFile="";
    this.sirReportFile="";
    this.monthlyWalkThroughReportFile="";
    this.tankMonitorStaticIPFile="";
    if (clearTick) {
      this.releaseDetectionReportFileSuccess = "false";
      this.repairDocumentsFileSuccess = "false";
      this.tankTestingReportFileSuccess = "false";
      this.tankTestingReportFileSuccess = "false";
      this.cathodicProtectionFileSuccess = "false";
      this.internalLiningFileSuccess="false"
      this. pipingCathodicProtectionFileSuccess="false";
      this.dropTubeRepairDocumentFileSuccess="false";
      this.tankInterstitialMonitoringFileSuccess="false";
      this.pipinginterstitialMonitoringFileSuccess="false";
      this.atgTestReportFileSuccess="false";
      this.atgRepairReportFileSuccess="false";
      this.spillBucketTestingDocumentFileSuccess="false";
      this.spillBucketRepairDocumentFileSuccess="false";
      this.sumpMaintenanceDocumentFileSuccess="false";
      this.udcMaintenanceDocumentFileSuccess="false";
      this.sirReportFileSuccess="false"
      this.monthlyWalkThroughReportFileSuccess="false";
      this.tankMonitorStaticIPFileSuccess="false";
    }
    if(frmData != null)
    frmData = new FormData();
  }
  //import compliance end

  //import Certification files start
  importCertificationDocuments() {
    // console.log(this.fileInput.files.length)
    this.showUploadLoading = true;
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
              if (result[i].key == 'operatorAcertificate'){
                this.operatorAcertificateFileSuccess = result[i].value;
                this.modalData.operatorAcertificateSubmitted = false;
              }
              if (result[i].key == 'operatorBcertificate'){
                this.operatorBcertificateFileSuccess = result[i].value;
                this.modalData.operatorBcertificateSubmitted = true;
              }
              if (result[i].key == 'operatorCcertificate'){
                this.operatorCcertificateFileSuccess = result[i].value;
                this.modalData.operatorCcertificateSubmitted = true;
              }
            }
            this.resetCertificationForm(frmData,false);
          }
          this.showUploadLoading = false;
        },
        error => {
          console.log(error);
        });

  }
  resetCertificationForm(frmData,clearCheck) {
    this.showUploadLoading = false;
    this.operatorAcertificateFileName = "";
    this.operatorBcertificateFileName = "";
    this.operatorCcertificateFileName = "";
    if (clearCheck) {
      this.operatorAcertificateFileSuccess = "false";
      this.operatorBcertificateFileSuccess = "false";
      this.operatorCcertificateFileSuccess = "false";
    }
    if(frmData != null)
    frmData = new FormData();
  }
  resetIncomeExpenatureForm(){
  
    this.vendorsList=[];;
    this.incomeModal={fromDate:new Date,toDate:new Date(),startDateForAdmin:new Date(),endDateForAdmin:new Date(),gallonsSold:0,gasAmount:0.0,insideSalesAmount:0.0,lotteryAmount:0.0,scratchOffSold:0.0,tax:0.0};
    this.expenditureModel={checkdate:new Date(),startDateForAdmin:new Date,endDateForAdmin:new Date()};
    this.incomeData={};
    this.expencesData={};
    this.showSiteIncomeSuccessMessage=false;
    this.siteIncomeSuccessMessage=""; 
    this.showSiteIncomeFailureMessage=false;
    this.siteIncomeFailureMessage=""; 
    this.showsiteExpensesSuccessMessage=false;
    this.siteExpensesSuccessMessage=""; 
    this.showSiteExpensesFailureMessage=false;
    this.siteExpensesFailureMessage=""; 
    this.maxDateValue= new Date();
    this.todayExpenses = [];
    this.todayIncome = [];
    this.incomeChartByList=[{name: 'Monthly Income', value: 'MonthlyIncome'},
  {name: 'By Item', value: 'ByItem'}];;
  this.expensesModel={ startDate:new Date(new Date().setFullYear(new Date().getFullYear() -1)),endDate:new Date()};
  this.incomeChartModel={ startDate:new Date(new Date().setFullYear(new Date().getFullYear() -1)),endDate:new Date(),incomeChartByItem:"Monthly Income"};
  this.incomeTabIndex=0;
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
    right: 50,
    leftVisible: true,
    rightVisible: true,
    useTransition: true,
  }

  handleSearchResults(searchResult) {
    if (searchResult.facilitiesList != null && searchResult.facilitiesList.length > 0) {
      for (var i = 0; i < searchResult.facilitiesList.length; i++) {
        var faciData = searchResult.facilitiesList[i];
        if (faciData == null) continue;
        // var image = this.commonService.gasStationImage(feciData.brand)
        if (faciData.tankPaidService != null)
          faciData.tankPaidService = faciData.tankPaidService == "true";
        // feciData.image = "assets/images/gasstation/"+image;
        faciData.image = environment.server + faciData.imageURL;
      }
    }
    if (searchResult.companiesList != null && searchResult.companiesList.length > 0) {
      for (var i = 0; i < searchResult.companiesList.length; i++) {
        var faciData = searchResult.companiesList[i];
        for (var j = 0; j < faciData.facilities.length; j++) {
          if (faciData.facilities[j] == null) continue;
          // var image = this.commonService.gasStationImage(feciData.brand)
          if (faciData.facilities[j].tankPaidService != null)
            faciData.facilities[j].tankPaidService = faciData.facilities[j].tankPaidService == "true";
          faciData.facilities[j].image = faciData.image = environment.server + faciData.facilities[j].imageURL;
        }
        this.companiesRightdata.push(faciData);
      }
    }
    this.searchResult["facilitiesList"] = searchResult.facilitiesList;
    this.searchResult["companiesList"] = searchResult.companiesList;
    this.hideMainPanal();
  }
  hideMainPanal() {
    this.showSearchResults = true;
  }
  hideSearchPanel() {
    this.appcomponent.searchString = "";
    this.showSearchResults = false;
  }

  //search results end
  setSplitwidth() {
    //     console.log("set")
    var sidebarDiv = document.getElementById("left-split-panel")
    var mainDiv = document.getElementById("split-panel")
    if (sidebarDiv != null && mainDiv !== null) {
      sidebarDiv.style.display = "";
      if (this.selectedChart == 'dashboard')
        mainDiv.style.width = "calc(100vh - 1000px)";
      else
        mainDiv.style.width = "calc(100% - 320px)";
    }
    //     // if(this.area.leftVisible)
  }
  setRightSplitwidth() {
    var mainDiv = document.getElementById("split-panel")
    if (mainDiv !== null &&  this.selectedChart == 'dashboard') {
      mainDiv.style.width = "calc(100% - 840px)";
    }
  }
  reSetSplitwidth() {
    if (this.selectedChart === 'dashboard') return;
    var sidebarDiv = document.getElementById("left-split-panel")
    var mainDiv = document.getElementById("split-panel")
    if (sidebarDiv != null && mainDiv !== null) {
      sidebarDiv.style.display = "none";
      mainDiv.style.width = "100%";
    }
  }
  checkCertificationDisabled(enableData) {
    console.log(enableData)
    if (enableData == null) return false;
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
    for (var i = 0; i < consolidateData.length; i++) {
      this.facilityConsolidateReportdata.labels.push(consolidateData[i].key);
      this.facilityConsolidateReportdata.datasets[0].data.push(consolidateData[i].value)

    }
    // return this.facilityConsolidateReportdata;
  }
  onUSSBOASelect() {
    this.router.navigate(['ussboa']);
  }
  retrieveTankAlarmHistory() {
    this.commonService.removeTankAlert();
    this.dashboardService.getTankAlarmHistory(this.commonService.getUserName()) // retrieve all thd parent folders
      .subscribe(
        tankAlaramList => {
          if (tankAlaramList != null) {
            this.commonService.setTankAlert(tankAlaramList);
            console.log(tankAlaramList.length)
          }
        },
        error => {
          console.log(error);
        });
  }
  consolidateReportClick() {
    this.consolidateFacilitiesdata = [];
    if (this.commonService.isAdmin())
      return;
    $('#consolidateFacilityModal').modal('show');
    this.dashboardService.getFacilitiesList(this.commonService.getUserName(), "managed") // retrieve all thd parent folders
      .subscribe(
        facilitiesList => {
          for (var i = 0; i < facilitiesList.length; i++) {
            var faciData = facilitiesList[i];
            // var image = this.commonService.gasStationImage(faciData.brand)
            // faciData.image = "assets/images/gasstation/"+image;
            // this.getFacilityConsolidateReport(faciData.consolidateReport);
            faciData.image = environment.server + faciData.imageURL;
            var consolidateReportdata: any;
            consolidateReportdata = this.generateInventoryReport(faciData.consolidateReport, consolidateReportdata);
            faciData.consolidateReport = consolidateReportdata;
            this.consolidateFacilitiesdata.push(faciData);
          }

        },
        error => {
          console.log(error);
        });
  }
  gasLevelModal = [];
  showGasLevelWindow(rightDetailsContent) {
    if (rightDetailsContent.consolidateReport == null || rightDetailsContent.consolidateReport.labels == null || rightDetailsContent.consolidateReport.labels.length == 0)
      return;
    $('#gasLevelModal').modal('show');
  this.gasLevelModal=[]
    this.dashboardService.getGasLevelsForFacility(rightDetailsContent.facilityId) // retrieve all thd parent folders
      .subscribe(
        gaslevelData => {
          if (gaslevelData == null || gaslevelData.length==0) {
            for (var i = 0; i < rightDetailsContent.consolidateReport.labels.length; i++) {
              var row = {};
              row['key'] = rightDetailsContent.consolidateReport.labels[i];
              row["value"] = 0;
              this.gasLevelModal.push(row)
            }
          } else {
            var gasResult = this.getGasLevels(gaslevelData);
            for (var i = 0; i < gasResult.length; i++) {
              var row = {};
              row["key"] = gasResult[i].key;
              row["value"] = gasResult[i].value;
              this.gasLevelModal.push(row)
            }
          }
        },
        error => {
          console.log(error);
        });

  }
  getGasLevels(gaslevelData) {
    var str = gaslevelData.gaslevels;
    var res = str.split(",");
    var result = []
    for (var i = 0; i < res.length; i++) {
      var splitString = res[i].split("=");
      var resultObj={};
      resultObj['key']=splitString[0];
      resultObj['value']= (Number)(splitString[1]);
      result.push(resultObj);
    }
    return result;

  }
  saveGasLevel() {
    this.dashboardService.saveGasLevelsForFacility(this.rightDetailsContent.facilityId, this.gasLevelModal)
      .subscribe(
        result => {
          $('#gasLevelModal').modal('hide');
          this.rightDetailsContent.consolidateReport=[];
          this.selectedFacility.gasLevel = result;
          this.rightDetailsContent.consolidateReport = this.generateInventoryReportForRightSideData(this.rightDetailsContent.backConsolidateReport, this.rightDetailsContent.consolidateReport,result);
    
        },
        error => {
          console.log(error);
          $('#gasLevelModal').modal('hide');
        });

  }
  getTankLeakModalData(facilityId){
    this.tankDetailsData=[];
    this.setTankTitles(1);
    this.dashboardService.getLeakTankDetails(this.commonService.getUserName(), facilityId) 
    .subscribe(
      leakTankDetails => {

        this.tankDetailsData = leakTankDetails;
        this.tankDetailsKeys =["ANNUAL","GROSS", "PERIODIC"];
        this.tankDetailsFirstTabData = this.tankDetailsData[this.tankDetailsKeys[0]];
        this.tankDetailsSecondTabData = this.tankDetailsData[this.tankDetailsKeys[1]];
        this.tankDetailsThirdTabData = this.tankDetailsData[this.tankDetailsKeys[2]];
        this.tankDetailsFirstTabKeys = Object.keys(this.tankDetailsFirstTabData).sort();
        this.tankDetailsSecondTabKeys = Object.keys(this.tankDetailsSecondTabData).sort();
        this.tankDetailsThirdTabKeys = Object.keys(this.tankDetailsThirdTabData).sort();
        console.log(leakTankDetails)
        this.selectedTankReportTTab = "LeakTest";

      },
      error => {
        console.log(error);
      });
  }
  getTankStatusModalData(facilityId){
    this.tankDetailsData=[];
    this.setTankTitles(2);
    this.dashboardService.getTankStatusDetails(this.commonService.getUserName(), facilityId) 
    .subscribe(
      leakTankDetails => {

        this.tankDetailsData = leakTankDetails;
        this.tankDetailsKeys =["UNLEADED","PREMIUM", "DIESEL"];
        this.tankDetailsFirstTabData = this.tankDetailsData[this.tankDetailsKeys[0]];
        this.tankDetailsSecondTabData = this.tankDetailsData[this.tankDetailsKeys[1]];
        this.tankDetailsThirdTabData = this.tankDetailsData[this.tankDetailsKeys[2]];
        this.tankDetailsFirstTabKeys = Object.keys(this.tankDetailsFirstTabData).sort();
        this.tankDetailsSecondTabKeys = Object.keys(this.tankDetailsSecondTabData).sort();
        this.tankDetailsThirdTabKeys = Object.keys(this.tankDetailsThirdTabData).sort();
        this.selectedTankReportTTab = "TankStatus";
        console.log(leakTankDetails)

      },
      error => {
        console.log(error);
      });
  }
  getCSCLStatusModalData(facilityId){
    this.setTankTitles(3);
    this.tankDetailsData=[];

    this.dashboardService.getCSLDTestDetails(this.commonService.getUserName(), facilityId) 
    .subscribe(
      leakTankDetails => {

        this.tankDetailsData = leakTankDetails;
        this.tankDetailsKeys =["UNLEADED","PREMIUM", "DIESEL"];
        this.tankDetailsFirstTabData = this.tankDetailsData[this.tankDetailsKeys[0]];
        this.tankDetailsSecondTabData = this.tankDetailsData[this.tankDetailsKeys[1]];
        this.tankDetailsThirdTabData = this.tankDetailsData[this.tankDetailsKeys[2]];
        this.tankDetailsFirstTabKeys = Object.keys(this.tankDetailsFirstTabData).sort();
        this.tankDetailsSecondTabKeys = Object.keys(this.tankDetailsSecondTabData).sort();
        this.tankDetailsThirdTabKeys = Object.keys(this.tankDetailsThirdTabData).sort();
        this.selectedTankReportTTab = "CSLDTest";
        console.log(leakTankDetails)

      },
      error => {
        console.log(error);
      });
  }
  setTankTitles(index){
if(index == 1){
  this.tankReportsModalTitle = "Tank Reports: Leak Test";
  this.tankReportTab1Title1 = "ANNUAL";
  this.tankReportTab1Title2 = "GROSS";
  this.tankReportTab1Title3 = "PERIODIC";

}else if(index == 2){
  this.tankReportsModalTitle = "Tank Reports: Tank Status";
  this.tankReportTab1Title1 = "UNLEADED";
  this.tankReportTab1Title2 = "PREMIUM";
  this.tankReportTab1Title3 = "DIESEL";

}else if(index == 3){
  this.tankReportsModalTitle = "Tank Reports: CSLD Report";
  this.tankReportTab1Title1 = "UNLEADED";
  this.tankReportTab1Title2 = "PREMIUM";
  this.tankReportTab1Title3 = "DIESEL";

}
  }
  setDocumentURL(documentURL){
    this. documentURL= documentURL;
  }
  resetTankReports(){
    if(this.tankDetailsData  == null || this.tankDetailsData.length == 0)
    return;
    if(this.selectedTankReportTTab == "LeakTest"){
      this.dashboardService.resetLeakTankDetails(this.rightDetailsContent.facilityId)
      .subscribe(
        leakTankDetails => {
         // this.rightDetailsContent.leakTankTestButtonStatus = "#808080";
          //this.selectedFacility.leakTankTestButtonStatus = "#808080";
        },
        error => {
          console.log(error);
        });
    }
    if(this.selectedTankReportTTab == "TankStatus"){
      this.dashboardService.resetTankStatusDetails(this.rightDetailsContent.facilityId)
      .subscribe(
        leakTankDetails => {
          //this.rightDetailsContent.tankStatusButtonStatus = "#808080";
         // this.selectedFacility.tankStatusButtonStatus = "#808080";
        },
        error => {
          console.log(error);
        });
    }
    if(this.selectedTankReportTTab == "CSLDTest"){
      this.dashboardService.resetCSLDTestDetails(this.rightDetailsContent.facilityId)
      .subscribe(
        leakTankDetails => {
          //this.rightDetailsContent.csldButtonStatus = "#808080";
          //this.selectedFacility.csldButtonStatus = "#808080";
        },
        error => {
          console.log(error);
        });
    }

  }
  getIncomeexpenditureDetails(facilityId){
    for (let t of this.tabView.tabs) {
      if (t.selected)
        t.selected = false;
    }
    this.tabView.tabs[0].selected = true;
    this.dashboardService.getIncomePicklistValue()
    .subscribe(incomeData => {
      this.vendorsList = [];
      for (var i = 0; i < incomeData.length; i++) {
        var element = incomeData[i];
        this.vendorsList.push({name: element, value: element})
      }
    },
      error => {
        console.log(error);
      });
      this.incomeChartModel.accountID=this.rightDetailsContent.facilityId;
      this.incomeChartModel.fID = this.rightDetailsContent.fid;
      this.incomeChartModel.id = this.commonService.getUserName();
      this.incomeChartModel.fromFormatedDate =this.customDatePipe.transform(this.incomeChartModel.startDate);
      this.incomeChartModel.endFormatedDate =this.customDatePipe.transform(this.incomeChartModel.endDate);
      this.incomeChartModel.chartType =this.incomeChartModel.incomeChartByItem;
      this.fetchTodaysIncomeData(new Date(),new Date());
      this.fetchTodaysExpensesData(new Date(),new Date());
  }
fetchTodaysIncomeData(fromDate,toDate){
  this.incomeModal.accountID=this.rightDetailsContent.facilityId;
    this.incomeModal.fID = this.rightDetailsContent.fid;
    this.incomeModal.dataEnteredBy = this.commonService.getUserName();
    this.incomeModal.fromFormatedDate =this.customDatePipe.transform(fromDate);
    this.incomeModal.toFormatedDate =this.customDatePipe.transform(toDate);
  this.dashboardService.getIncomeForCustomDate(this.incomeModal)
      .subscribe(incomeData => {
        this.todayIncome = incomeData;
        
      },
        error => {
          console.log(error);
        });
}
fetchTodaysExpensesData(fromDate,toDate){
  this.expenditureModel.accountID=this.rightDetailsContent.facilityId;
    this.expenditureModel.fID = this.rightDetailsContent.fid;
    this.expenditureModel.dataEnteredBy = this.commonService.getUserName();
    this.expenditureModel.fromCheckdate =this.customDatePipe.transform(fromDate);
    this.expenditureModel.toCheckdate =this.customDatePipe.transform(toDate);
    this.dashboardService.getExpensesForCustomDate(this.expenditureModel)
      .subscribe(expenseData => {
        this.todayExpenses = expenseData;
        
      },
        error => {
          console.log(error);
        });
}

  saveSiteIncome(){
    this.incomeModal.accountID=this.rightDetailsContent.facilityId;
    this.incomeModal.fID = this.rightDetailsContent.fid;
    this.incomeModal.dataEnteredBy = this.commonService.getUserName();
    this.incomeModal.fromFormatedDate =this.customDatePipe.transform(this.incomeModal.fromDate);
    this.incomeModal.toFormatedDate =this.customDatePipe.transform(this.incomeModal.toDate);
    this.dashboardService.saveSiteIncome(this.incomeModal)
    .subscribe(
      data => {
        if(data === "true"){
          this.showSiteIncomeSuccessMessage=true;
            this.showSiteIncomeFailureMessage=false;
            this.siteIncomeSuccessMessage = "Site Income Saved Successfully.";
            this.siteIncomeFailureMessage = ""
            this.incomeModal={fromDate:new Date,toDate:new Date(),startDateForAdmin:this.incomeModal.startDateForAdmin,endDateForAdmin:this.incomeModal.endDateForAdmin,gallonsSold:0,gasAmount:0.0,insideSalesAmount:0.0,lotteryAmount:0.0,scratchOffSold:0.0,tax:0.0};
            if(this.actualServerData.clientContact === null)
              this.fetchTodaysIncomeData(this.incomeModal.fromDate,this.incomeModal.toDate);
          setTimeout(() => {
            this.showSiteIncomeSuccessMessage=false;
            this.siteIncomeSuccessMessage = "";
          }, 3000);
         
         
        }else{
          this.showSiteIncomeFailureMessage=true;
          this.showSiteIncomeSuccessMessage=false;
          this.siteIncomeSuccessMessage = "";
          this.siteIncomeFailureMessage = "Problem while saving Site Income !!!."
        }
      },
      error => {
        this.showSiteIncomeFailureMessage=true;
        this.showSiteIncomeSuccessMessage=false;
        this.siteIncomeSuccessMessage = "";
        this.siteIncomeFailureMessage = "Problem while saving Site Income !!!."
        console.log(error);
      });
  }
  saveSiteExpenses(){
    this.expenditureModel.accountID=this.rightDetailsContent.facilityId;
    this.expenditureModel.fID = this.rightDetailsContent.fid;
    this.expenditureModel.dataEnteredBy = this.commonService.getUserName();
    this.expenditureModel.checkFormateddate =this.customDatePipe.transform(this.expenditureModel.checkdate);
    if(this.expenditureModel.vendor !=null && this.expenditureModel.vendor.value !== "Others"){
      this.expenditureModel.others ="";
    }
    this.dashboardService.saveSiteExpenditure(this.expenditureModel)
   .subscribe( data => {
      if(data === "true"){
        this.showsiteExpensesSuccessMessage=true;
        this.showSiteExpensesFailureMessage=false;
        this.siteExpensesSuccessMessage = "Site Expenditure Saved Successfully."
        this.siteExpensesFailureMessage = "";
        this.expenditureModel={checkdate:new Date(),startDateForAdmin:new Date,endDateForAdmin:new Date(),amount:0,checkNo:"",vendor:{name: 'Others', value: 'Others'},others:""};
        if(this.actualServerData.clientContact === null)
          this.fetchTodaysExpensesData(this.expenditureModel.checkdate,this.expenditureModel.checkdate);
        setTimeout(() => {
          this.showsiteExpensesSuccessMessage=false;
          this.siteExpensesSuccessMessage = "";
        }, 3000);
      }else{
        this.showSiteExpensesFailureMessage=true;
        this.showsiteExpensesSuccessMessage=false;
        this.siteExpensesSuccessMessage = "";
        this.siteExpensesFailureMessage = "Problem while saving Site Expenditure !!!."
      }
    },
    error => {
      this.showSiteExpensesFailureMessage=true;
      this.showsiteExpensesSuccessMessage=false;
      this.siteExpensesSuccessMessage = "";
      this.siteExpensesFailureMessage = "Problem while saving Site Expenditure !!!."
      console.log(error);
    });
  }
  getIncomeExpenditureReport($event){
    switch($event.index){
      case 2:
          this.fetchIncomeChartValues();
          break;
      case 3:
          this.fetchExpenditureValuesForChart();
          break;
    }
  }
  fetchIncomeValuesForAdmin(){
    this.fetchTodaysIncomeData(this.incomeModal.startDateForAdmin,this.incomeModal.endDateForAdmin);
    
  }
  fetchExpensesValuesForAdmin(){
    this.fetchTodaysExpensesData(this.incomeModal.startDateForAdmin,this.incomeModal.endDateForAdmin);
    
  }
  fetchExpenditureValuesForChart(){
    this.expensesModel.accountID=this.rightDetailsContent.facilityId;
    this.expensesModel.fID = this.rightDetailsContent.fid;
    this.expensesModel.id = this.commonService.getUserName();
    this.expensesModel.fromFormatedDate =this.customDatePipe.transform(this.expensesModel.startDate);
    this.expensesModel.endFormatedDate =this.customDatePipe.transform(this.expensesModel.endDate);
    this.dashboardService.getExpendatureData(this.expensesModel)
   .subscribe( expensesData => {
    this.expencesData = {
      labels: [],
      datasets: [
        {
          data: [],
          label: 'Expenses',
          backgroundColor: '#42A5F5',
          borderColor: '#1E88E5',
        }
      ]
    };

    for (var i = 0; i < expensesData.length; i++) {
      this.expencesData.labels.push(expensesData[i].key);
      this.expencesData.datasets[0].data.push(Number(expensesData[i].value));
    }
    },
    error => {
      console.log(error);
    });
  }
  fetchIncomeValuesForChartByMonthly(){
    this.incomeChartModel.accountID=this.rightDetailsContent.facilityId;
    this.incomeChartModel.fID = this.rightDetailsContent.fid;
    this.incomeChartModel.id = this.commonService.getUserName();
    this.incomeChartModel.fromFormatedDate =this.customDatePipe.transform(this.incomeChartModel.startDate);
    this.incomeChartModel.endFormatedDate =this.customDatePipe.transform(this.incomeChartModel.endDate);
    this.incomeChartModel.chartType =this.incomeChartModel.incomeChartByItem;
    
    this.dashboardService.getIncomeDataByMonthly(this.incomeChartModel)
   .subscribe( incomeData => {
    this.incomeData = {
      labels: [],
      datasets: [
        {
          data: [],
          label: 'Income',
          backgroundColor: '#42A5F5',
          borderColor: '#1E88E5',
        }
      ]
    };

    for (var i = 0; i < incomeData.length; i++) {
      this.incomeData.labels.push(incomeData[i].key);
      this.incomeData.datasets[0].data.push(Number(incomeData[i].value));
    }
    },
    error => {
      console.log(error);
    });
  
  }
  fetchIncomeChartValues(){
    // console.log($event.value.value)
    if(this.incomeChartModel.incomeChartByItem === 'Monthly Income'||this.incomeChartModel.incomeChartByItem.value === 'MonthlyIncome'){
      this.fetchIncomeValuesForChartByMonthly();
    }
      else{
      this.fetchIncomeValuesForChartByType();
    }
    }
    fetchIncomeValuesForChartByType(){
      this.incomeChartModel.accountID=this.rightDetailsContent.facilityId;
      this.incomeChartModel.fID = this.rightDetailsContent.fid;
      this.incomeChartModel.id = this.commonService.getUserName();
      this.incomeChartModel.fromFormatedDate =this.customDatePipe.transform(this.incomeChartModel.startDate);
      this.incomeChartModel.endFormatedDate =this.customDatePipe.transform(this.incomeChartModel.endDate);
      this.incomeChartModel.chartType =this.incomeChartModel.incomeChartByItem;
      
      this.dashboardService.getIncomeDataByType(this.incomeChartModel)
     .subscribe( incomeData => {
      this.incomeData = {
        labels: [],
        datasets: [
        ]
      };
      var labelsList = ["Gallons Sold","Gas Amount","Inside Sales Amount","Lottery Amount","Scratch Off Sold"];
      var backgroundColorsList = ['#42A5F5','#FF0000','#FFFF00','#FF00FF','#004400'];
      this.incomeData.labels=[];
      var gallonsSold=[];
      var gasAmount=[];
      var insideSalesAmount=[];
      var lotteryAmount=[];
      var scratchOffSold=[];

      for (var i = 0; i < incomeData.length; i++) {
        // this.incomeData.label.push(incomeData[i].month);
        this.incomeData.labels.push(incomeData[i].month)
        
        gallonsSold.push(Number(incomeData[i].gallonsSold));
        gasAmount.push(Number(incomeData[i].gasAmount));
        insideSalesAmount.push(Number(incomeData[i].insideSalesAmount));
        lotteryAmount.push(Number(incomeData[i].lotteryAmount));
        scratchOffSold.push(Number(incomeData[i].scratchOffSold));
      }
      for (var i = 0; i < labelsList.length; i++) {
        this.incomeData.datasets[i] = {};
        this.incomeData.datasets[i].backgroundColor=backgroundColorsList[i];
        this.incomeData.datasets[i].label=labelsList[i];
      }
      this.incomeData.datasets[0].data=gallonsSold
      this.incomeData.datasets[1].data=gasAmount
      this.incomeData.datasets[2].data=insideSalesAmount
      this.incomeData.datasets[3].data=lotteryAmount
      this.incomeData.datasets[4].data=scratchOffSold
      },
      error => {
        console.log(error);
      });
    
    }
    editIncomeRecord(incomeRec){
      this.incomeModal.fromDate = new Date(incomeRec.fromDateString);
      this.incomeModal.toDate = new Date(incomeRec.toDateString);
      this.incomeModal.gallonsSold = incomeRec.gallonsSold;
      this.incomeModal.gasAmount = incomeRec.gasAmount;
      this.incomeModal.insideSalesAmount = incomeRec.insideSalesAmount;
      this.incomeModal.lotteryAmount = incomeRec.lotteryAmount;
      this.incomeModal.scratchOffSold = incomeRec.scratchOffSold;
      this.incomeModal.id = incomeRec.id;
      this.incomeModal.salesforceId = incomeRec.salesforceId;
      this.incomeModal.tax = incomeRec.tax;
      this.incomeModal.createdDate = incomeRec.createdDate;
      this.incomeModal.modifiedDate = incomeRec.modifiedDate;
      
    }
    deleteIncomeRecord(incomeRec){
      incomeRec.accountID=this.rightDetailsContent.facilityId;
      incomeRec.fID = this.rightDetailsContent.fid;
      incomeRec.dataEnteredBy = this.commonService.getUserName();
      incomeRec.fromFormatedDate =this.customDatePipe.transform(incomeRec.fromDate);
      incomeRec.toFormatedDate =this.customDatePipe.transform(incomeRec.toDate);
      this.dashboardService.deleteSiteIncome(incomeRec)
      .subscribe( incomeData => {
       this.todayIncome = incomeData
       },
       error => {
         console.log(error);
       });
    }

    editExpenses(expsnseRec){
      this.expenditureModel.checkdate = new Date(expsnseRec.dateString);
      this.expenditureModel.amount = expsnseRec.amount;
      this.expenditureModel.checkNo = expsnseRec.checkNo;
      this.expenditureModel.id = expsnseRec.id;
      this.expenditureModel.salesforceId = expsnseRec.salesforceId;
      this.expenditureModel.createdDate = expsnseRec.createdDate;
      this.expenditureModel.modifiedDate = expsnseRec.modifiedDate;
      var pickListFound = false;
      for(var i=0; i<this.vendorsList.length; i++){
        var elem = this.vendorsList[i];
        if(elem.name == expsnseRec.vendor){
          pickListFound = true;
        }
      }
      if(expsnseRec.others != null && expsnseRec.others != ""){
        this.expenditureModel.vendor = {name: 'Others', value: 'Others'}; 
        this.expenditureModel.others = expsnseRec.others;
      }else{
        this.expenditureModel.vendor = {name:expsnseRec.vendor, value:expsnseRec.vendor};;
        
      }
    }
    deleteExpensesRecord(expenseRec){
      expenseRec.accountID=this.rightDetailsContent.facilityId;
      expenseRec.fID = this.rightDetailsContent.fid;
      expenseRec.dataEnteredBy = this.commonService.getUserName();
      expenseRec.fromFormatedDate =this.customDatePipe.transform(expenseRec.date);

      this.dashboardService.deleteSiteExpenses(expenseRec)
      .subscribe( expenseData => {
        this.todayExpenses = expenseData;
       },
       error => {
         console.log(error);
       });
    }
  month;
  chartTypeSelected;
  isChartSpecficItem(item) {
    if (this.incomeChartModel.incomeChartByItem.value == "ByItem" && this.chartTypeSelected == item || this.incomeChartModel.incomeChartByItem.value == 'MonthlyIncome') {
      return true;
    }
    return false;
  }
    onIncomeChartDataSelect(e){
      $('#incomeDetailsModal').modal('show');
      this.month = e.element._model.label;
      this.chartTypeSelected=e.element._model.datasetLabel;
      console.log(e.element._model.label +"   "+e.element._model.datasetLabel);
      this.incomeChartModel.accountID=this.rightDetailsContent.facilityId;
      this.incomeChartModel.fID = this.rightDetailsContent.fid;
      this.incomeChartModel.id = this.commonService.getUserName();
      this.incomeChartModel.fromFormatedDate =this.customDatePipe.transform(this.incomeChartModel.startDate);
      this.incomeChartModel.endFormatedDate =this.customDatePipe.transform(this.incomeChartModel.endDate);
      this.incomeChartModel.chartType =this.incomeChartModel.incomeChartByItem;
      this.dashboardService.getIncomeChartDetails(this.incomeChartModel,e.element._model.label)
      .subscribe( incomeDetailsData => {
        console.log(incomeDetailsData);
        this.incomeChartDetailsData = incomeDetailsData;
        // this.todayExpenses = expenseData;
       },
       error => {
         console.log(error);
       });

    }
    onExpensesChartDataSelect(e){
      $('#expensesDetailsModal').modal('show');
      this.month = e.element._model.label;
      console.log(e.element._model.label +"   "+e.element._model.datasetLabel);
      this.expensesModel.accountID=this.rightDetailsContent.facilityId;
      this.expensesModel.fID = this.rightDetailsContent.fid;
      this.expensesModel.id = this.commonService.getUserName();
      this.expensesModel.fromFormatedDate =this.customDatePipe.transform(this.expensesModel.startDate);
      this.expensesModel.endFormatedDate =this.customDatePipe.transform(this.expensesModel.endDate);

      this.dashboardService.getExpensesChartDetails(this.expensesModel,e.element._model.label)
      .subscribe( expensesDetailsData => {
        console.log(expensesDetailsData);
        this.expensesChartDetailsData = expensesDetailsData;
        // this.todayExpenses = expenseData;
       },
       error => {
         console.log(error);
       });
     
    }
  getFontWeight(viewed){
    if(viewed === null || viewed=== 'false')
    return "bold";
    return "normal";

  }
  
  checkIncomeFormValues(){
    if(this.incomeModal.fromDate ==null || this.incomeModal.toDate ==null ||this.incomeModal.gallonsSold ==null|| 
      this.incomeModal.gasAmount ==null||this.incomeModal.insideSalesAmount ==null|| this.incomeModal.lotteryAmount ==null|| this.incomeModal.scratchOffSold ==null)
    return true;
  return false;
  }
  checkExpensisFormValues(){
    if(this.expenditureModel.amount ==null || this.expenditureModel.checkNo ==null || this.expenditureModel.checkNo.trim().length==0 ||this.expenditureModel.checkdate ==null|| 
      this.expenditureModel.vendor ==null|| (this.expenditureModel.vendor !=null && this.expenditureModel.vendor.value=='Others' && this.expenditureModel.others ==null || 
      (this.expenditureModel.others!== undefined &&  this.expenditureModel.others !== null && this.expenditureModel.others.length==0)))
    return true;
  return false;
  }
}
