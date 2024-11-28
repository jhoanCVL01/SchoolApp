import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { RegistroEstudiantilRoutingModule } from './registroestudiantil-routing.module';
import { RegistroEstudiantilComponent } from './registroestudiantil.component';

import { FormsModule } from '@angular/forms';
import { NgxPaginationModule } from 'ngx-pagination';
import { NgbTypeaheadModule } from '@ng-bootstrap/ng-bootstrap';

@NgModule({
  declarations: [
    RegistroEstudiantilComponent
  ],
  imports: [
    CommonModule,
    RegistroEstudiantilRoutingModule,
    FormsModule,
    NgxPaginationModule,
    NgbTypeaheadModule
  ]
})
export class RegistroEstudiantilModule { }
