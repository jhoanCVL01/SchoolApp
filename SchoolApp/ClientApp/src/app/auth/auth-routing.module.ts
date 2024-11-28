import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { EntidadesComponent } from '../entidades/entidades.component';
import { EstudianteComponent } from '../estudiantes/estudiantes.component';
import { ProfesorComponent } from '../profesores/profesores.component';
import { AuthGuard } from '../auth/auth.guard';


const routes: Routes = [
  { path: '', component: LoginComponent }, // Cargar LoginComponent en la ruta base del módulo
  { path: 'login', component: LoginComponent }, // Cargar LoginComponent en la ruta base del módulo
  { path: 'estudiantes', component: EstudianteComponent, canActivate: [AuthGuard] },
  { path: 'profesores', component: ProfesorComponent, canActivate: [AuthGuard] },
  //{ path: 'empleados', component: ListComponent, canActivate: [AuthGuard] }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AuthRoutingModule { }
