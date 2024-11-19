import { Component } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css'],
})
export class MenuComponent {
  menu: any = {};
  menuList: any[] = [];

  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  constructor(private http: HttpClient) {
    this.buscarMenu();
  }

  // Crear menú
  crearMenu() {
    let validarFormulario: any = document.getElementById('formularioCrear');
    if (validarFormulario.reportValidity()) {
      this.menu.fechaModif = new Date().toISOString();
      this.menu.usuarioModif = 'usuario prueba';
      console.log(this.menu);
      this.servicioCrear().subscribe({
        next: () => {
          this.buscarMenu();
          this.menu = {};
        },
        error: (err) => {
          console.error('Error al crear el menú:', err);
        },
      });
    }
  }

  servicioCrear(): Observable<any> {
    return this.http.post<any>(
      'http://localhost:8080/menu/guardar',
      this.menu,
      this.httpOptions
    );
  }

  // Buscar menús
  buscarMenu() {
    this.servicioBuscarMenu().subscribe({
      next: (menus: any) => {
        this.menuList = Array.isArray(menus) ? menus : [];
      },
      error: (err) => {
        console.error('Error al buscar los menús:', err);
      },
    });
  }

  servicioBuscarMenu(): Observable<any> {
    return this.http.get('http://localhost:8080/menu/buscar');
  }

  // Modificar menú
  modificar(menu: any) {
    this.menu = menu;
  }

  limpiar() {
    this.menu = {};
  }

  // Eliminar menú
  eliminar(menu: any) {
    if (confirm('¿Estás seguro de que deseas eliminar este menú?')) {
      this.servicioEliminar(menu).subscribe({
        next: () => this.buscarMenu(),
        error: (err) => {
          console.error('Error al eliminar el menú:', err);
        },
      });
    }
  }

  servicioEliminar(menu: any): Observable<any> {
    return this.http.delete(
      `http://localhost:8080/menu/eliminar/{menu.idMenu}`
    );
  }
}
