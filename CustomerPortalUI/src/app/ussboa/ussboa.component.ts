import { Component, OnInit } from '@angular/core';
import { DashboardService } from '../services/dashboard.service';

@Component({
  selector: 'crm-ussboa',
  templateUrl: './ussboa.component.html',
  styleUrls: ['./ussboa.component.css']
})
export class UssboaComponent implements OnInit {

  constructor(private dashboardService: DashboardService) { }
  ussBOAApprovedData;
  ussBOAAssociateData;
  ngOnInit() {
    this.dashboardService.getUSSBOAData("preferred")
    .subscribe(
      data => {
        this.ussBOAApprovedData = JSON.parse(JSON.stringify(data));;
          // data.fo
          
      },
      error => {
        console.log(error);
      });
      this.dashboardService.getUSSBOAData("associate")
      .subscribe(
        data => {
          this.ussBOAAssociateData = JSON.parse(JSON.stringify(data));;
            // data.fo
            
        },
        error => {
          console.log(error);
        });
  }

}
