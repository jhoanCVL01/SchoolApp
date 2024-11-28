import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProgramaAcademicoComponent } from './programa.component';

describe('ProfesorComponent', () => {
  let component: ProgramaAcademicoComponent;
  let fixture: ComponentFixture<ProgramaAcademicoComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ProgramaAcademicoComponent]
    });
    fixture = TestBed.createComponent(ProgramaAcademicoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
