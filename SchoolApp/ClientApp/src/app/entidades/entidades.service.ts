import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface Entidad {
  id: number;
  nombre: string;
  nit: string;
  direccion: string;
  ciudad: string;
  telefono: string;
  correo: string;
  estado: boolean;
}

@Injectable({
  providedIn: 'root'
})
export class EntidadesService {
  private apiUrl = environment.apiUrl + 'api/entidad'; // Ajusta la URL de tu API

  constructor(private http: HttpClient) { }

  getAll(): Observable<Entidad[]> {
    return this.http.get<Entidad[]>(this.apiUrl);
  }

  getById(id: number): Observable<Entidad> {
    return this.http.get<Entidad>(`${this.apiUrl}/${id}`);
  }

  create(entidad: Entidad): Observable<Entidad> {
    return this.http.post<Entidad>(this.apiUrl, entidad);
  }

  update(id: number, entidad: Entidad): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/${id}`, entidad);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
