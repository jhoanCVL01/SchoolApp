import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable()
export class AuthInterceptor implements HttpInterceptor {
  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    // Obtén el token del localStorage
    const token = localStorage.getItem('token');

    // Si hay un token, clona la solicitud y añade el encabezado de autorización
    if (token) {
      const clonedReq = req.clone({
        setHeaders: {
          Authorization: `Bearer ${token}`
        }
      });
      return next.handle(clonedReq); // Envía la solicitud modificada
    }

    return next.handle(req); // Si no hay token, envía la solicitud original
  }
}