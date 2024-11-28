import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RegistroEstudiantilComponent } from './registroestudiantil.component';

const routes: Routes = [
  { path: '', component: RegistroEstudiantilComponent } // Ruta principal para `EntidadesComponent`
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class RegistroEstudiantilRoutingModule { }
