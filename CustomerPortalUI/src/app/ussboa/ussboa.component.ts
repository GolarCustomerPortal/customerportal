import { Component, OnInit } from '@angular/core';
import { DashboardService } from '../services/dashboard.service';

@Component({
  selector: 'crm-ussboa',
  templateUrl: './ussboa.component.html',
  styleUrls: ['./ussboa.component.css']
})
export class UssboaComponent implements OnInit {

  constructor(private dashboardService: DashboardService) { }
  ussBOAData;
  ngOnInit() {
    this.dashboardService.getUSSBOAData()
    .subscribe(
      data => {
        this.ussBOAData = JSON.parse(JSON.stringify(data));;
          // data.fo
          
      },
      error => {
        console.log(error);
      });
  }

}
