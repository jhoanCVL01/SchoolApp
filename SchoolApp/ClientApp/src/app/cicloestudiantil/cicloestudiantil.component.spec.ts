import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CicloEstudiantilComponent } from './cicloestudiantil.component';

describe('CicloEstudiantilComponent', () => {
  let component: CicloEstudiantilComponent;
  let fixture: ComponentFixture<CicloEstudiantilComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [CicloEstudiantilComponent]
    });
    fixture = TestBed.createComponent(CicloEstudiantilComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
