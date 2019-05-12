import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule }    from '@angular/forms';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import {ChartModule} from 'primeng/chart';
import {AngularSplitModule} from 'angular-split';
import {AccordionModule} from 'primeng/accordion';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {PanelMenuModule} from 'primeng/panelmenu';
import {PanelModule} from 'primeng/panel';
import {CardModule} from 'primeng/card';
import {ButtonModule} from 'primeng/button';
import {InputSwitchModule} from 'primeng/inputswitch';
import { HomeComponent } from './home/home.component';
import {SidebarModule} from 'primeng/sidebar';
import {FileUploadModule} from 'primeng/fileupload';
import { UserComponent } from './user/user.component';
import { UsersComponent } from './users/users.component';
import {  HttpClientModule } from '@angular/common/http';
import { UserService } from './services/user.service';
import {TableModule} from 'primeng/table';
import { routing } from './app.routing';
import { LocationStrategy, HashLocationStrategy } from '@angular/common';
import { CommonService } from './services/common.service';
import { AuthenticationService } from './services/authentication.service';
import {FieldsetModule} from 'primeng/fieldset';
import { DashboardService } from './services/dashboard.service';
import {DropdownModule} from 'primeng/dropdown';
import {RadioButtonModule} from 'primeng/radiobutton';
import { ImportService } from './services/import.service';
import { ScheduleComponent } from './schedule/schedule.component';
import {DialogModule} from 'primeng/dialog';
import {CheckboxModule} from 'primeng/checkbox';
import {CalendarModule} from 'primeng/calendar';
import { UssboaComponent } from './ussboa/ussboa.component';
import { TankMonitorSignupComponent } from './tank-monitor-signup/tank-monitor-signup.component';
import { SafePipe } from './services/SafePipe';
import { HttpService } from './services/http.service';
import {TabViewModule} from 'primeng/tabview';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    HomeComponent,
    UserComponent,
    UsersComponent,
    ScheduleComponent,
    UssboaComponent,
    TankMonitorSignupComponent,
    SafePipe
  ],  
  imports: [
    routing,
    BrowserModule, 
    ChartModule,
    BrowserAnimationsModule,
    AngularSplitModule,
    AccordionModule,
    PanelMenuModule,
    FormsModule,
    TableModule,
    HttpClientModule,
    PanelModule,
    CardModule,
    ButtonModule,
    InputSwitchModule,
    SidebarModule,
    FileUploadModule,
    FieldsetModule,
    DropdownModule,
    RadioButtonModule,
    DialogModule,
    CheckboxModule,
    CalendarModule,
    TabViewModule
  ],
  providers: [  
    UserService,
    CommonService,
    AuthenticationService,
    DashboardService,
    ImportService,
    HttpService,
    {provide: LocationStrategy, useClass: HashLocationStrategy},
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
