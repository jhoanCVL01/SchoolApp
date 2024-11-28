import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AsignaturaComponent } from './asignaturas.component';

describe('CicloEstudiantilComponent', () => {
  let component: AsignaturaComponent;
  let fixture: ComponentFixture<AsignaturaComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AsignaturaComponent]
    });
    fixture = TestBed.createComponent(AsignaturaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
