import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProfesoresRoutingModule } from './profesores-routing.module';
import { ProfesorComponent } from './profesores.component';

import { FormsModule } from '@angular/forms';
import { NgxPaginationModule } from 'ngx-pagination';

@NgModule({
  declarations: [
    ProfesorComponent
  ],
  imports: [
    CommonModule,
    ProfesoresRoutingModule,
    FormsModule,
    NgxPaginationModule
  ]
})
export class ProfesoresModule { }
