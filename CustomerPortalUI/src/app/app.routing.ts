import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { UsersComponent } from './users/users.component';
import { UserComponent } from './user/user.component';
import { ScheduleComponent } from './schedule/schedule.component';




const appRoutes: Routes = [
    { path: '', component: HomeComponent},
    { path: 'login', component: LoginComponent },
    { path: 'users', component: UsersComponent },
    { path: 'newuser', component: UserComponent },
    { path: 'schedule', component: ScheduleComponent },
    // otherwise redirect to home
    { path: '**', redirectTo: 'login' } 
];

export const routing = RouterModule.forRoot(appRoutes);