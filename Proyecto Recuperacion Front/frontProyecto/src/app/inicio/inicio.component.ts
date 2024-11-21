import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.component.html',
  styleUrls: ['./inicio.component.css']
})
export class InicioComponent {

  usuario: any = {};

  constructor(private router: Router) {

    this.recargar();
  }
  ngOnInit(): void {
    this.usuario = JSON.parse(localStorage.getItem('usuario') || '{}');
    if (!this.usuario.idUsuario) {
      this.router.navigate(['/login']);
    }
  }

  cerrarSesion(): void {
    
    localStorage.removeItem('usuario');
    this.router.navigate(['/login']);
  }

  recargar() {
    const hasReloaded = localStorage.getItem('hasReloaded');
    if (!hasReloaded) {
      localStorage.setItem('hasReloaded', 'true');
      window.location.reload();
    } else {
      localStorage.removeItem('hasReloaded');
    }
  }
}




