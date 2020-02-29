import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { map } from 'rxjs/operators';
import { DashboardService } from '../services/dashboard.service';
import { CommonService } from '../services/common.service';

@Component({
  selector: 'app-facility-report',
  templateUrl: './facility-report.component.html',
  styleUrls: ['./facility-report.component.css']
})
export class FacilityReportComponent implements OnInit {

  constructor(private route: ActivatedRoute,
    private router: Router, private dashboardService: DashboardService, private commonService: CommonService) { }
  tankreportData;
  gasRefreshClicked = false;
  ngOnInit() {
    this.route
      .queryParams
      .pipe(map(params => params))
      .subscribe(paramObject => {
        let userId = paramObject.userId;
        let fId = paramObject.fId;
        let facilityId = paramObject.facilityId;
        let reportType = paramObject.reportType;
        let keyCode = paramObject.keyCode;
        this.getTankMonitorData(userId, fId, facilityId, reportType, keyCode)
      });
  }
  getTankMonitorData(userId, fId, facilityId, reportType, keyCode) {
    this.tankreportData = null;
    this.dashboardService.getFacilityReportDirectlyFromStationWithoutLogin(userId, fId, facilityId, reportType, keyCode)
      .subscribe(
        reportData => {
          this.tankreportData = reportData;
          console.log(this.tankreportData.contentAsText);
        },
        error => {
          this.gasRefreshClicked = false;
          console.log(error);
        });
  }
  printFacilityReport() {
    // const printContent = document.getElementById("facilityReportId");
    // const WindowPrt = window.open('', '', 'left=0,top=0,width=900,height=900,toolbar=0,scrollbars=0,status=0');
    // WindowPrt.document.write('<pre>'+this.tankreportData+'</pre>');
    var uniqueName = new Date();
    var windowName = 'Print' + uniqueName.getTime();

    var printWindow = window.open("_blank", windowName, 'left=200,top=200,width=800,height=600');

    printWindow.document.write('<html>\n');
    printWindow.document.write('<head>\n');

    printWindow.document.write('<script>\n');

    printWindow.document.write('function winPrint()\n');
    printWindow.document.write('{\n');
    printWindow.document.write('window.focus();\n');


    if (navigator.userAgent.toLowerCase().indexOf("chrome") > -1) {
      printWindow.document.write('printChrome();\n');
    }
    else {
      printWindow.document.write('window.print();\n');
    }


    printWindow.document.write('}\n');


    printWindow.document.write('function chkstate()\n');
    printWindow.document.write('{\n');
    printWindow.document.write('setTimeout("chkstate();",3000);\n');
    printWindow.document.write('}\n');

    printWindow.document.write('function printChrome()\n');
    printWindow.document.write('{\n');
    printWindow.document.write('if(document.readyState=="complete")');
    printWindow.document.write('{\n');
    printWindow.document.write('window.print();\n');
    printWindow.document.write('}\n');
    printWindow.document.write('else{\n');
    printWindow.document.write('setTimeout("printChrome();",3000);\n');
    printWindow.document.write('}\n');
    printWindow.document.write('}\n');


    printWindow.document.write('</scr');
    printWindow.document.write('ipt>');

    printWindow.document.write('</head>');
    printWindow.document.write('<body onload="winPrint()" >');
    printWindow.document.write('<div style="height: 100%;"><pre>');
    printWindow.document.write(this.tankreportData.contentAsText);
    printWindow.document.write('</pre></div>');
    printWindow.document.write('</body>');
    printWindow.document.write('</html>');
    printWindow.document.close();

  }
}
