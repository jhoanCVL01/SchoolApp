import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';
import { ProgramaAcademico } from '../programa/programa.service';

export interface Estudiante {
  id: number;
  nombres: string;
  apellidos: string;
  numeroIdentificacion: string;
  direccion: string;
  ciudad: string;
  telefono: string;
  celular: string;
  correo: string;
  fechaVinculacion: string;  // Asegúrate de formatear la fecha adecuadamente
  estado: boolean;
  idProgramaAcademico?:number;
  programaAcademico?: ProgramaAcademico;
}

@Injectable({
  providedIn: 'root'
})
export class EstudianteService {
  private apiUrl = environment.apiUrl + 'api/estudiante'; // Ajusta la URL de tu API

  constructor(private http: HttpClient) { }

  getAll(): Observable<Estudiante[]> {
    return this.http.get<Estudiante[]>(this.apiUrl);
  }

  getById(id: number): Observable<Estudiante> {
    return this.http.get<Estudiante>(`${this.apiUrl}/${id}`);
  }

  create(entidad: Estudiante): Observable<Estudiante> {
    return this.http.post<Estudiante>(this.apiUrl, entidad);
  }

  update(id: number, entidad: Estudiante): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/${id}`, entidad);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
