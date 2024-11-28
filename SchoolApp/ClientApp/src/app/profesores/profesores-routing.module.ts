import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ProfesorComponent } from './profesores.component';

const routes: Routes = [
  { path: '', component: ProfesorComponent } // Ruta principal para `EntidadesComponent`
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ProfesoresRoutingModule { }
