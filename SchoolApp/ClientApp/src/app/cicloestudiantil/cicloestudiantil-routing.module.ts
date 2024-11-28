import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CicloEstudiantilComponent } from './cicloestudiantil.component';

const routes: Routes = [
  { path: '', component: CicloEstudiantilComponent } // Ruta principal para `EntidadesComponent`
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CicloEstudiantilRoutingModule { }
