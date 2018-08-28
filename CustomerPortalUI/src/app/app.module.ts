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


@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    HomeComponent,
    UserComponent,
    UsersComponent,
  ],  
  imports: [
    routing,
    BrowserModule, 
    FormsModule,
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
    RadioButtonModule
  ],
  providers: [  
    UserService,
    CommonService,
    AuthenticationService,
    DashboardService,
    {provide: LocationStrategy, useClass: HashLocationStrategy},
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
