import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EstudiantesRoutingModule } from './estudiantes-routing.module';
import { EstudianteComponent } from './estudiantes.component';

import { FormsModule } from '@angular/forms';
import { NgxPaginationModule } from 'ngx-pagination';

@NgModule({
  declarations: [
    EstudianteComponent
  ],
  imports: [
    CommonModule,
    EstudiantesRoutingModule,
    FormsModule,
    NgxPaginationModule
  ]
})
export class EstudiantesModule { }
