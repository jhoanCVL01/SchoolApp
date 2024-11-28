
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { Observable, BehaviorSubject } from 'rxjs';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = environment.apiUrl + 'api/Auth';
  private isAuthenticatedSubject = new BehaviorSubject<boolean>(this.isAuthenticated());
  private readonly tokenExpirationKey = 'tokenExpiration';

  // Observable para suscribirse al estado de autenticación en otros componentes
  isAuthenticated$ = this.isAuthenticatedSubject.asObservable();

  constructor(private http: HttpClient, private router: Router) {
    // Configura un timer al iniciar la aplicación para verificar la expiración del token
    this.checkTokenExpiration();
  }

  login(credentials: { username: string; password: string }): Observable<any> {
    return this.http.post(`${this.apiUrl}/login`, credentials);
  }

  setAuthenticated(token: string): void {
    const expirationTime = 30 * 60 * 1000; // 30 minutos en milisegundos
    const expirationDate = new Date().getTime() + expirationTime;

    // Guardar el token y su fecha de expiración en localStorage
    localStorage.setItem('token', token);
    localStorage.setItem('tokenExpiration', expirationDate.toString());

    this.isAuthenticatedSubject.next(true); // Emitir que el usuario está autenticado
    this.setAutoLogout(expirationTime); // Configura el timer de cierre de sesión
  }

  logout() {
    localStorage.removeItem('token');
    localStorage.removeItem('tokenExpiration');
    this.isAuthenticatedSubject.next(false); // Emitir que el usuario ya no está autenticado
    this.router.navigate(['/login']);
    location.reload();
  }

  isAuthenticated(): boolean {
    const token = localStorage.getItem('token');
    const expiration = localStorage.getItem('tokenExpiration');
    if (!token || !expiration) {
      return false;
    }

    // Verificar si el token ha expirado
    const expirationDate = parseInt(expiration, 10);
    const currentTime = new Date().getTime();
    if (currentTime > expirationDate) {
      this.logout();
      return false;
    }
    return true;
  }

  private setAutoLogout(expirationTime: number) {
    setTimeout(() => {
      this.logout();
    }, expirationTime);
  }

  private checkTokenExpiration() {
    const expiration = localStorage.getItem('tokenExpiration');
    if (expiration) {
      const expirationDate = parseInt(expiration, 10);
      const currentTime = new Date().getTime();
      const remainingTime = expirationDate - currentTime;

      if (remainingTime > 0) {
        // Configura un timer para cerrar sesión cuando el tiempo restante termine
        this.setAutoLogout(remainingTime);
      } else {
        // Si el token ya ha expirado, cerrar sesión inmediatamente
        this.logout();
      }
    }
  }
}
