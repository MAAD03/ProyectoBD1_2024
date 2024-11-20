import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component } from '@angular/core';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-menu-rol',
  templateUrl: './menu-rol.component.html',
  styleUrls: ['./menu-rol.component.css']
})
export class MENUROLComponent {

  menu_rol: any = {};
  menu_rolList: any[] = [];
  rolList: any = {};
  menuList: any = {};

  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  constructor(private http: HttpClient) {
    this.buscar();
    this.BuscarRoles();
    this.buscarMenu();
  }

  // Crear menu_rol
  crear() {
    let validarFormulario: any = document.getElementById('formularioCrear');
    if (validarFormulario.reportValidity()) {
      this.menu_rol.fechaModif = new Date().toISOString();
      this.menu_rol.usuarioModif = 'usuarioprueba';
      console.log(this.menu_rol);
      this.servicioCrear().subscribe({
        next: () => {
          this.buscar();
          this.menu_rol = {};
        },
        error: (err) => {
          console.error('Error al crear:', err);
        },
      });
    }
  }

  servicioCrear(): Observable<any> {
    return this.http.post<any>(
      'http://localhost:8080/menuRol/guardar',
      this.menu_rol,
      this.httpOptions
    );
  }

  // Buscar menu_rol
  buscar() {
    this.servicioBuscar().subscribe({
      next: (menu_rolList: any) => {
        this.menu_rolList = Array.isArray(menu_rolList) ? menu_rolList : [];
      },
      error: (err) => {
        console.error('Error al buscar:', err);
      },
    });
  }

  servicioBuscar(): Observable<any> {
    return this.http.get('http://localhost:8080/menuRol/buscar');
  }

  // Modificar menu_rol
  modificar(rol: any) {
    this.menu_rol = rol;
  }

  limpiar() {
    this.menu_rol = {};
  }
// Eliminar menu_rol
eliminar(menu_rol: any) {
  if (confirm('¿Estás seguro de que deseas eliminar?')) {
    this.servicioEliminar(menu_rol.idMenuRol).subscribe({
      next: () => this.buscar(), 
      error: (err) => {
        console.error('Error al eliminar:', err);
      },
    });
  }
}

servicioEliminar(idMenuRol: number): Observable<any> {
  return this.http.delete(
    `http://localhost:8080/menuRol/eliminar/${idMenuRol}`
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

  // Buscar Roles
  BuscarRoles() {
    this.servicioBuscarRoles().subscribe({
      next: (rolList: any) => {
        this.rolList = Array.isArray(rolList) ? rolList : [];
      },
      error: (err) => {
        console.error('Error al buscar los roles:', err);
      },
    });
  }

  servicioBuscarRoles(): Observable<any> {
    return this.http.get('http://localhost:8080/rol/buscar');
  }

}
