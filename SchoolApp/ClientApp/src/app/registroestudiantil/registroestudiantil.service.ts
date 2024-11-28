import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';
import { Estudiante } from '../estudiantes/estudiantes.service';
import { CicloEstudiantil } from '../cicloestudiantil/cicloestudiantil.service';
import { Asignatura } from '../asignaturas/asignaturas.service';

export interface RegistroEstudiantil {
  id: number;
  idCicloEstudiantil?: number;
  idAsignatura?: number;
  idEstudiante?: number;
  estudiante?: Estudiante;
  cicloEstudiantil?: CicloEstudiantil;
  asignatura?: Asignatura;
}

@Injectable({
  providedIn: 'root'
})
export class RegistroEstudiantilService {
  private apiUrl = environment.apiUrl + 'api/registroEstudiantil'; // Ajusta la URL de tu API

  constructor(private http: HttpClient) { }

  getAll(): Observable<RegistroEstudiantil[]> {
    return this.http.get<RegistroEstudiantil[]>(this.apiUrl);
  }

  getById(id: number): Observable<RegistroEstudiantil> {
    return this.http.get<RegistroEstudiantil>(`${this.apiUrl}/${id}`);
  }
  getByCiclo(idCiclo: number): Observable<RegistroEstudiantil[]> {
    return this.http.get<RegistroEstudiantil[]>(`${this.apiUrl}/GetByCiclo/${idCiclo}`);
  }
  getByStudent(idCiclo: number, id: number): Observable<RegistroEstudiantil[]> {
    return this.http.get<RegistroEstudiantil[]>(`${this.apiUrl}/GetByStudent/${id}/${idCiclo}`);
  }
  getByStudentAllStundets(idCiclo: number, id: number): Observable<RegistroEstudiantil[]> {
    return this.http.get<RegistroEstudiantil[]>(`${this.apiUrl}/GetByStudentAllStundets/${id}/${idCiclo}`);
  }
  getByTeacher(idCiclo: number, id: number): Observable<RegistroEstudiantil[]> {
    return this.http.get<RegistroEstudiantil[]>(`${this.apiUrl}/GetByTeacher/${id}/${idCiclo}`);
  }
  create(entidad: RegistroEstudiantil): Observable<RegistroEstudiantil> {
    return this.http.post<RegistroEstudiantil>(this.apiUrl, entidad);
  }

  update(id: number, entidad: RegistroEstudiantil): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/${id}`, entidad);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
