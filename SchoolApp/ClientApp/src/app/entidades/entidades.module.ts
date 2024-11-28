import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EntidadesRoutingModule } from './entidades-routing.module';
import { EntidadesComponent } from './entidades.component';

import { FormsModule } from '@angular/forms';
import { NgxPaginationModule } from 'ngx-pagination';

@NgModule({
  declarations: [
    EntidadesComponent
  ],
  imports: [
    CommonModule,
    EntidadesRoutingModule,
    FormsModule,
    NgxPaginationModule
  ]
})
export class EntidadesModule { }
