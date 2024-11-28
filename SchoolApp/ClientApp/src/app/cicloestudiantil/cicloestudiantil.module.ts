import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CicloEstudiantilRoutingModule } from './cicloestudiantil-routing.module';
import { CicloEstudiantilComponent } from './cicloestudiantil.component';

import { FormsModule } from '@angular/forms';
import { NgxPaginationModule } from 'ngx-pagination';

@NgModule({
  declarations: [
    CicloEstudiantilComponent
  ],
  imports: [
    CommonModule,
    CicloEstudiantilRoutingModule,
    FormsModule,
    NgxPaginationModule
  ]
})
export class CicloEstudiantilModule { }
