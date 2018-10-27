import { Component, OnInit } from '@angular/core';
import { DashboardService } from '../services/dashboard.service';
import { CommonService } from '../services/common.service';

@Component({
  selector: 'job-schedule',
  templateUrl: './schedule.component.html',
  styleUrls: ['./schedule.component.css']
})
export class ScheduleComponent implements OnInit {

  constructor(private commonService: CommonService, private dashboardService: DashboardService) { }
  cols: any[];
  displayDialog: boolean;
  newJob: boolean;
  job: any;
  selectedJob;
  jobScheduleData = [];
  jobScheduleHistoryData = [];
  duplicateName = false;

  ngOnInit() {


    this.cols = [
      { field: 'jobName', header: 'Job Name' },
      { field: 'dependentJobName', header: 'Dependent Job Name' },
      { field: 'jobPath', header: 'Job Path' },
      { field: 'sourceFilePath', header: 'Source File Name' },
      { field: 'endFilePath', header: 'End File Name' },
      { field: 'startTime', header: 'Start Time' },
      { field: 'schedule', header: 'Schedule' },
      { field: 'recurrence', header: 'Recurrence' }
    ];
    this.dashboardService.getJobScheduleData(this.commonService.getUserName())
      .subscribe(
        jobScheduleData => {
          if (jobScheduleData != null) {
            this.jobScheduleData = jobScheduleData;
          }
        },
        error => {
          console.log(error);
        });

  }
  showDialogToAdd() {
    this.newJob = true;
    this.job = {};
    this.displayDialog = true;
  }
  onRowSelect(event) {
    this.newJob = false;
    this.job = this.cloneJob(event.data);
    this.displayDialog = true;
  }
  cloneJob(c) {
    let job = {};
    for (let prop in c) {
      job[prop] = c[prop];
    }
    return job;
  }
  save() {
    // if ((this.newJob == true && this.job.schedule != null && this.job.schedule != this.selectedJob.schedule)  && this.job.schedule !== "NaN:NaN") {
    //   this.setTime(this.job)
    // }
    if (this.newJob == true) {
      this.setTime(this.job);
     
    } else if ((this.job.schedule != null && this.job.schedule != this.selectedJob.schedule) && this.job.schedule !== "NaN:NaN")
      this.setTime(this.job)
     
      if (this.newJob == true) {
        this.setStartTime(this.job)
      }else if ((this.job.startTime != null && this.job.startTime != this.selectedJob.startTime) && this.job.startTime !== "NaN:NaN")
      this.setStartTime(this.job)

    if (this.job.schedule == "NaN:NaN")
      this.job.schedule == 0;
      if (this.job.startTime == "NaN:NaN")
      this.job.startTime == 0;

    if (this.job.recurrence == false) {
      this.job.schedule = "";
    }
    // if (this.newJob) {
    //   this.jobScheduleData.push(this.job);
    // }
    // else
    //   this.jobScheduleData[this.jobScheduleData.indexOf(this.selectedJob)] = this.job;


    this.dashboardService.saveJobScheduleData(this.job)
      .subscribe(
        jobScheduleData => {
          if (jobScheduleData != null) {
            if (this.newJob) {
              this.jobScheduleData.push(this.job);
            }
            else
              this.jobScheduleData[this.jobScheduleData.indexOf(this.selectedJob)] = this.job;

          }
          this.displayDialog = false;
        },
        error => {
          console.log(error);
        });
    // this.jobs = jobs;
    // this.job = null;

  }
  setTime(job) {
    if (job.schedule == undefined || job.schedule === "")
      return 0;
    let hour = new Date(job.schedule).getHours();
    let min = new Date(job.schedule).getMinutes();
    job.schedule = `${hour}:${min}`;
  }
  setStartTime(job) {
    if (job.startTime == undefined || job.startTime === "")
      job.startTime = 0;
    let hour = new Date(job.startTime).getHours();
    let min = new Date(job.startTime).getMinutes();
    job.startTime = `${hour}:${min}`;
  }
  onSelect($event, job) {
    let hour = new Date($event).getHours();
    let min = new Date($event).getMinutes();
    if (isNaN(hour) || isNaN(min))
      job.schedule = 0;
    else
      job.schedule = `${hour}:${min}`;
  }

  delete() {

    // this.jobs = null;
    this.dashboardService.deleteJobScheduleData(this.job.jobName)
      .subscribe(
        result => {
          if (result != null && result) {
            let index = this.jobScheduleData.indexOf(this.selectedJob);
            this.jobScheduleData = this.jobScheduleData.filter((val, i) => i != index);

          }
          this.displayDialog = false;
        },
        error => {
          console.log(error);
        });

    // this.displayDialog = false;
  }
  checkFormValues() {
    if (this.job != null && (this.job.jobName != null && this.job.jobName.trim().length != 0 &&
      this.job.jobPath != null && this.job.jobPath.trim().length != 0
      && this.job.endFilePath != null && this.job.endFilePath.trim().length != 0 && !this.duplicateName))
      return false;
    return true;

  }
  fetchScheduleJobHistory() {
    this.dashboardService.getScheduleJobHisotryData(this.commonService.getUserName())
      .subscribe(
        jobScheduleHistoryData => {
          this.jobScheduleHistoryData = jobScheduleHistoryData;
        },
        error => {
          console.log(error);
        });
  }
  getDate(milli) {
    return new Date(milli);
  }
  checkNameValid(jobName) {
    this.duplicateName = false;
    for (var i = 0; i < this.jobScheduleData.length; i++)
      if (this.jobScheduleData[i].jobName === jobName) {
        this.duplicateName = true;
      }
  }
}
