import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { NgxPaginationModule } from 'ngx-pagination';
import { ProgramaAcademicoComponent } from './programa.component';
import { ProgramaAcademicoRoutingModule } from './programa-routing.module';

@NgModule({
  declarations: [
    ProgramaAcademicoComponent
  ],
  imports: [
    CommonModule,
    ProgramaAcademicoRoutingModule,
    FormsModule,
    NgxPaginationModule
  ]
})
export class ProgramaAcademicoModule { }
