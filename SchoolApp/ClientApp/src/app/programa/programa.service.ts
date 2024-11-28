import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface ProgramaAcademico {
  id: number;
  nombre: string;
  descripcion: string;
  estado: boolean;
}

@Injectable({
  providedIn: 'root'
})
export class ProgramaAcademicoService {
  private apiUrl = environment.apiUrl + 'api/programaAcademico'; // Ajusta la URL de tu API

  constructor(private http: HttpClient) { }

  getAll(): Observable<ProgramaAcademico[]> {
    return this.http.get<ProgramaAcademico[]>(this.apiUrl);
  }

  getById(id: number): Observable<ProgramaAcademico> {
    return this.http.get<ProgramaAcademico>(`${this.apiUrl}/${id}`);
  }

  create(entidad: ProgramaAcademico): Observable<ProgramaAcademico> {
    return this.http.post<ProgramaAcademico>(this.apiUrl, entidad);
  }

  update(id: number, entidad: ProgramaAcademico): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/${id}`, entidad);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
