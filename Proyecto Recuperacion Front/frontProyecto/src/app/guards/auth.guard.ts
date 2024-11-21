import { Injectable } from '@angular/core';
import { CanActivate, CanActivateFn, Router } from '@angular/router';


@Injectable({
  providedIn: 'root',
})
export class AuthGuard implements CanActivate {
  constructor(private router: Router) {}

  canActivate(): boolean {
    // Verificar si hay un usuario en localStorage
    const usuario = localStorage.getItem('usuario');
    if (usuario) {
      return true;
    } else {
      this.router.navigate(['/login']);
      return false;
    }
  }
}
