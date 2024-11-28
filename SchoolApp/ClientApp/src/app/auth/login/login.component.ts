import { Component, OnInit } from '@angular/core';
import { AuthService } from '../auth.service';
import { Router } from '@angular/router';
import { GlobalDataService } from '../global-data.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html'
})
export class LoginComponent implements OnInit {
  credentials = { username: '', password: '' };
  mensajesError: string[] = [];
  constructor(private authService: AuthService, private globalData: GlobalDataService, private router: Router) { }
  authed: boolean = false;
  ngOnInit(): void {
    if (this.authService.isAuthenticated()) {
      this.authed = true
      this.router.navigate(['/']);
    }

  }

  login() {
    this.mensajesError = []
    this.authService.login(this.credentials).subscribe({
      next: (response) => {
        this.authService.setAuthenticated(response.token); // Usa setAuthenticated para actualizar el estado global
        this.globalData.Idusuario = response.userId;
        this.globalData.IdProfesor = response.profesorid;
        this.globalData.IdTipoUsuario = response.tipousuarioid;
        this.globalData.Idestudiante = response.estudianteid;
        location.reload();
        this.router.navigate(['/']);
      },
      error: (err) => {
        console.error('Login failed', err);
        this.mensajesError.push('Usuario o contraseña Inconrrectos')
      }
    });
  }
}
