import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'job-schedule',
  templateUrl: './schedule.component.html',
  styleUrls: ['./schedule.component.css']
})
export class ScheduleComponent implements OnInit {

  constructor() { }
  cols: any[];
  displayDialog: boolean;
  newJob: boolean;
  job: any;
  selectedJob;
  jobs = [];

  ngOnInit() {


    this.cols = [
      { field: 'jobName', header: 'Job Name' },
      { field: 'jobPath', header: 'Job Path' },
      { field: 'endFilePath', header: 'End File Name' },
      { field: 'schedule', header: 'Schedule' },
      { field: 'recurrence', header: 'Recurrence' }
    ];
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
    if (this.job.schedule != null && this.job.schedule !== "NaN:NaN") {
      this.setTime(this.job)
    }
    if (this.job.recurrence == false) {
      this.job.schedule = "";
    }
    if (this.newJob) {
      this.jobs.push(this.job);
    }
    else
      this.jobs[this.jobs.indexOf(this.selectedJob)] = this.job;

    // this.jobs = jobs;
    this.job = null;
    this.displayDialog = false;
  }
  setTime(job) {
    let hour = new Date(job.schedule).getHours();
    let min = new Date(job.schedule).getMinutes();
    job.schedule = `${hour}:${min}`;
  }
  onSelect($event, job) {
    let hour = new Date($event).getHours();
    let min = new Date($event).getMinutes();
    job.schedule = `${hour}:${min}`;
  }

  delete() {
    let index = this.jobs.indexOf(this.selectedJob);
    this.jobs = this.jobs.filter((val, i) => i != index);
    // this.jobs = null;
    this.displayDialog = false;
  }
  checkFormValues() {
    if (this.job != null && (this.job.jobName != null && this.job.jobName.trim().length != 0 && this.job.jobPath != null && this.job.jobPath.trim().length != 0
      && this.job.endFilePath != null && this.job.endFilePath.trim().length != 0 && (this.job.recurrence == true && this.job.schedule != null)))
      return false;
    return true;

  }
}
