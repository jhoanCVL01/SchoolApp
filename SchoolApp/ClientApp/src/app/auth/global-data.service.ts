import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class GlobalDataService {
  private readonly USER_ID_KEY = 'userId';
  private readonly STUDENT_ID_KEY = 'studentId';
  private readonly TEACHER_ID_KEY = 'teacherId';
  private readonly USER_ROLE_KEY = 'userRole';
  // Métodos para obtener y establecer el ID del usuario
  get Idusuario(): number | null {
    const id = localStorage.getItem(this.USER_ID_KEY);
    return id ? parseInt(id, 10) : null;
  }

  set Idusuario(id: number | null) {
    if (id !== null) {
      localStorage.setItem(this.USER_ID_KEY, id.toString());
    } else {
      localStorage.removeItem(this.USER_ID_KEY);
    }
  }
  get Idestudiante(): number | null {
    const id = localStorage.getItem(this.STUDENT_ID_KEY);
    return id ? parseInt(id, 10) : null;
  }

  set Idestudiante(id: number | null) {
    if (id !== null) {
      localStorage.setItem(this.STUDENT_ID_KEY, id.toString());
    } else {
      localStorage.removeItem(this.STUDENT_ID_KEY);
    }
  }

  get IdProfesor(): number | null {
    const id = localStorage.getItem(this.TEACHER_ID_KEY);
    return id ? parseInt(id, 10) : null;
  }

  set IdProfesor(id: number | null) {
    if (id !== null) {
      localStorage.setItem(this.TEACHER_ID_KEY, id.toString());
    } else {
      localStorage.removeItem(this.TEACHER_ID_KEY);
    }
  }


  // Métodos para obtener y establecer el rol del usuario
  get IdTipoUsuario(): number | null {
    const id = localStorage.getItem(this.USER_ROLE_KEY);
    return id ? parseInt(id, 10) : null;
  }

  set IdTipoUsuario(id: number | null) {
    if (id !== null) {
      localStorage.setItem(this.USER_ROLE_KEY, id.toString());
    } else {
      localStorage.removeItem(this.USER_ROLE_KEY);
    }
  }
}