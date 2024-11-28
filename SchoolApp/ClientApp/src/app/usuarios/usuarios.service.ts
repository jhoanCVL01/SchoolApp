import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';
import { Profesor } from '../profesores/profesores.service';
import { Estudiante } from '../estudiantes/estudiantes.service';

export interface TipoUsuario {
  id: number;
  nombre: string;
  descripcion: string;
}

export interface Usuario {
  id: number;
  username: string;
  password: string;
  idProfesor?: number; 
  idEstudiante?: number; 
  idTipoUsuario?: number; 
  tipoUsuario?: TipoUsuario;
  estudiante?: Estudiante;
  profesor?: Profesor;
}

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {
  private apiUrl = environment.apiUrl + 'api/usuario'; // Ajusta la URL de tu API

  constructor(private http: HttpClient) { }

  getAll(): Observable<Usuario[]> {
    return this.http.get<Usuario[]>(this.apiUrl);
  }
  getTipoUsuario(): Observable<TipoUsuario[]> {
    return this.http.get<TipoUsuario[]>(`${this.apiUrl}/GetTipoUsuarios`);
  }
  getById(id: number): Observable<Usuario> {
    return this.http.get<Usuario>(`${this.apiUrl}/${id}`);
  }

  create(entidad: Usuario): Observable<Usuario> {
    return this.http.post<Usuario>(this.apiUrl, entidad);
  }

  update(id: number, entidad: Usuario): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/${id}`, entidad);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
