import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface Profesor {
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
}

@Injectable({
  providedIn: 'root'
})
export class ProfesorService {
  private apiUrl = environment.apiUrl + 'api/profesor'; // Ajusta la URL de tu API

  constructor(private http: HttpClient) { }

  getAll(): Observable<Profesor[]> {
    return this.http.get<Profesor[]>(this.apiUrl);
  }

  getById(id: number): Observable<Profesor> {
    return this.http.get<Profesor>(`${this.apiUrl}/${id}`);
  }

  create(entidad: Profesor): Observable<Profesor> {
    return this.http.post<Profesor>(this.apiUrl, entidad);
  }

  update(id: number, entidad: Profesor): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/${id}`, entidad);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
