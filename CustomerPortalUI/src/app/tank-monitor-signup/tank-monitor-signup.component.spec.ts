import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TankMonitorSignupComponent } from './tank-monitor-signup.component';

describe('TankMonitorSignupComponent', () => {
  let component: TankMonitorSignupComponent;
  let fixture: ComponentFixture<TankMonitorSignupComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TankMonitorSignupComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TankMonitorSignupComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
