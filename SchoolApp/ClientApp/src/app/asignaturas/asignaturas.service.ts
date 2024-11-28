import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';
import { Profesor } from '../profesores/profesores.service';
import { ProgramaAcademico } from '../programa/programa.service';

export interface Asignatura {
  id: number;
  nombre: string;
  descripcion: string;
  cantidadCreditos: number;
  estado: boolean;
  idProfesor?: number; 
  profesor?: Profesor;
  idProgramaAcademico?:number;
  programaAcademico?: ProgramaAcademico;
}

@Injectable({
  providedIn: 'root'
})
export class AsignaturaService {
  private apiUrl = environment.apiUrl + 'api/asignatura'; // Ajusta la URL de tu API

  constructor(private http: HttpClient) { }

  getAll(): Observable<Asignatura[]> {
    return this.http.get<Asignatura[]>(this.apiUrl);
  }

  getById(id: number): Observable<Asignatura> {
    return this.http.get<Asignatura>(`${this.apiUrl}/${id}`);
  }

  create(entidad: Asignatura): Observable<Asignatura> {
    return this.http.post<Asignatura>(this.apiUrl, entidad);
  }

  update(id: number, entidad: Asignatura): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/${id}`, entidad);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
