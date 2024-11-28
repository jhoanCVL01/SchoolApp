import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ProgramaAcademicoComponent } from './programa.component';

const routes: Routes = [
  { path: '', component: ProgramaAcademicoComponent } // Ruta principal para `EntidadesComponent`
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ProgramaAcademicoRoutingModule { }
