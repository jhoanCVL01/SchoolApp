import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  { path: 'login', loadChildren: () => import('./auth/auth.module').then(m => m.AuthModule) },
  { path: 'entidades', loadChildren: () => import('./entidades/entidades.module').then(m => m.EntidadesModule) },
  { path: 'empleados', loadChildren: () => import('./empleados/empleados.module').then(m => m.EmpleadosModule) },
  { path: 'estudiantes', loadChildren: () => import('./estudiantes/estudiantes.module').then(m => m.EstudiantesModule) },
  { path: 'profesores', loadChildren: () => import('./profesores/profesores.module').then(m => m.ProfesoresModule) },
  { path: 'cicloestudiantil', loadChildren: () => import('./cicloestudiantil/cicloestudiantil.module').then(m => m.CicloEstudiantilModule) },
  { path: 'asignaturas', loadChildren: () => import('./asignaturas/asignaturas.module').then(m => m.AsignaturaModule) },
  { path: 'usuarios', loadChildren: () => import('./usuarios/usuarios.module').then(m => m.UsuarioModule) },
  { path: 'programaacademico', loadChildren: () => import('./programa/programa.module').then(m => m.ProgramaAcademicoModule) },
  { path: 'registroestudiantil', loadChildren: () => import('./registroestudiantil/registroestudiantil.module').then(m => m.RegistroEstudiantilModule) },
  
  { path: '**', redirectTo: 'login' }
];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
