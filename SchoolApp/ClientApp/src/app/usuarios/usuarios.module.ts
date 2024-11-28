import { NgModule } from '@angular/core';
import { CommonModule, JsonPipe } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { NgxPaginationModule } from 'ngx-pagination';
import { UsuarioComponent } from './usuarios.component';
import { UsuarioRoutingModule } from './usuarios-routing.module';
import { NgbTypeaheadModule } from '@ng-bootstrap/ng-bootstrap';

@NgModule({
  declarations: [
    UsuarioComponent
  ],
  imports: [
    CommonModule,
    UsuarioRoutingModule,
    FormsModule,
    NgxPaginationModule,
    NgbTypeaheadModule,
    JsonPipe
  ]
})
export class UsuarioModule { }
