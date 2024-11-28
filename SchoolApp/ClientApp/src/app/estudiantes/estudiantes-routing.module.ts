import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EstudianteComponent } from './estudiantes.component';

const routes: Routes = [
  { path: '', component: EstudianteComponent } // Ruta principal para `EntidadesComponent`
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EstudiantesRoutingModule { }
