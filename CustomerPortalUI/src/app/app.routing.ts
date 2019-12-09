import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { UsersComponent } from './users/users.component';
import { UserComponent } from './user/user.component';
import { ScheduleComponent } from './schedule/schedule.component';
import { UssboaComponent } from './ussboa/ussboa.component';
import { TankMonitorSignupComponent } from './tank-monitor-signup/tank-monitor-signup.component';
import { SettingsComponent } from './settings/settings.component';




const appRoutes: Routes = [
    { path: '', component: HomeComponent},
    { path: 'login', component: LoginComponent },
    { path: 'users', component: UsersComponent },
    { path: 'settings', component: SettingsComponent },
    { path: 'newuser', component: UserComponent },
    { path: 'schedule', component: ScheduleComponent },
    { path: 'ussboa', component: UssboaComponent },
    { path: 'tankmonitorsignup', component: TankMonitorSignupComponent },
    // otherwise redirect to home
    { path: '**', redirectTo: 'login' } 
];

export const routing = RouterModule.forRoot(appRoutes);