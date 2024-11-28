import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AsignaturaComponent } from './asignaturas.component';

const routes: Routes = [
  { path: '', component: AsignaturaComponent } // Ruta principal para `EntidadesComponent`
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AsignaturaRoutingModule { }
