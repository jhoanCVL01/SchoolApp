import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AsignaturaRoutingModule } from './asignaturas-routing.module';
import { AsignaturaComponent } from './asignaturas.component';

import { FormsModule } from '@angular/forms';
import { NgxPaginationModule } from 'ngx-pagination';

@NgModule({
  declarations: [
    AsignaturaComponent
  ],
  imports: [
    CommonModule,
    AsignaturaRoutingModule,
    FormsModule,
    NgxPaginationModule
  ]
})
export class AsignaturaModule { }
