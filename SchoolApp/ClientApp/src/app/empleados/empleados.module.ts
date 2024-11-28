import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EmpleadosRoutingModule } from './empleados-routing.module';
import { EmpleadosComponent } from './empleados.component';

import { FormsModule } from '@angular/forms';
import { NgxPaginationModule } from 'ngx-pagination';


@NgModule({
  declarations: [
    EmpleadosComponent
  ],
  imports: [
    CommonModule,
    EmpleadosRoutingModule,
    FormsModule,
    NgxPaginationModule
  ]
})
export class EmpleadosModule { }
