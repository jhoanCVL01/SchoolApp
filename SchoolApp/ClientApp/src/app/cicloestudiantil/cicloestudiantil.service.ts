import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface CicloEstudiantil {
  id: number;
  nombre: string;
  descripcion: string;
  creditosMaximos: string;
  fechaInicio: string;  // Asegúrate de formatear la fecha adecuadamente
  fechaFin: string;  // Asegúrate de formatear la fecha adecuadamente
  estado: boolean;
}

@Injectable({
  providedIn: 'root'
})
export class CicloEstudiantilService {
  private apiUrl = environment.apiUrl + 'api/cicloEstudiantil'; // Ajusta la URL de tu API

  constructor(private http: HttpClient) { }

  getAll(): Observable<CicloEstudiantil[]> {
    return this.http.get<CicloEstudiantil[]>(this.apiUrl);
  }

  getById(id: number): Observable<CicloEstudiantil> {
    return this.http.get<CicloEstudiantil>(`${this.apiUrl}/${id}`);
  }

  create(entidad: CicloEstudiantil): Observable<CicloEstudiantil> {
    return this.http.post<CicloEstudiantil>(this.apiUrl, entidad);
  }

  update(id: number, entidad: CicloEstudiantil): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/${id}`, entidad);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
