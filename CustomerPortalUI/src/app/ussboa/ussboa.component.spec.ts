import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UssboaComponent } from './ussboa.component';

describe('UssboaComponent', () => {
  let component: UssboaComponent;
  let fixture: ComponentFixture<UssboaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UssboaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UssboaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
