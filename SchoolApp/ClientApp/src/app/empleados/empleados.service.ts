// entidades.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Entidad } from '../entidades/entidades.service';
import { environment } from '../../environments/environment';

export interface Empleado {
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
  cargo: string;
  idEmpresa?: number;
  empresa?: Entidad
}

@Injectable({
  providedIn: 'root'
})
export class EmpleadosService {
  private apiUrl = environment.apiUrl + 'api/empleado';

  constructor(private http: HttpClient) { }

  getAll(): Observable<Empleado[]> {
    return this.http.get<Empleado[]>(this.apiUrl);
  }

  getById(id: number): Observable<Empleado> {
    return this.http.get<Empleado>(`${this.apiUrl}/${id}`);
  }

  create(empleado: Empleado): Observable<Empleado> {
    return this.http.post<Empleado>(this.apiUrl, empleado);
  }

  update(id: number, empleado: Empleado): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/${id}`, empleado);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}