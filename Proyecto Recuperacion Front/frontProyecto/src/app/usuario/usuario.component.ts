import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component } from '@angular/core';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-usuario',
  templateUrl: './usuario.component.html',
  styleUrls: ['./usuario.component.css']
})
export class USUARIOComponent {

  usuario: any = {};
  usuarioSesion: any = {};
  usuarioList: any[] = [];
  rolList: any = {};
  confirmPassword: string = ''; 

  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  constructor(private http: HttpClient) {
    this.buscarUsuario();
    this.BuscarRoles();
    this.usuarioSesion = JSON.parse(localStorage.getItem('usuario') || '{}');
    
  }

  // Crear
  crearUsuario() {
    let validarFormulario: any = document.getElementById('formularioCrear');
    if (validarFormulario.reportValidity()) {
      if (this.usuario.passwordUsuario === this.confirmPassword) {
        this.usuario.fechaModif = new Date().toISOString();
        this.usuario.usuarioModif = this.usuarioSesion.idUsuario.toString();
        console.log(this.usuario);

        this.servicioCrear().subscribe({
          next: () => {
            this.buscarUsuario();
            this.usuario = {};
            this.confirmPassword = '';
          },
          error: (err) => {
            console.error('Error al crear:', err);
          },
        });
      } else {
        alert('Las contraseñas no coinciden. Por favor, inténtelo nuevamente.');
      }
    }
  }

  servicioCrear(): Observable<any> {
    return this.http.post<any>(
      'http://localhost:8080/usuario/guardar',
      this.usuario,
      this.httpOptions
    );
  }

  // Buscar
  buscarUsuario() {
    this.servicioBuscar().subscribe({
      next: (usuarioList: any) => {
        this.usuarioList = Array.isArray(usuarioList) ? usuarioList : [];
      },
      error: (err) => {
        console.error('Error al buscar:', err);
      },
    });
  }

  servicioBuscar(): Observable<any> {
    return this.http.get('http://localhost:8080/usuario/buscar');
  }

  // Modificar menu_rol
  modificar(rol: any) {
    this.usuario = rol;
  }

  limpiar() {
    this.usuario = {};
    this.confirmPassword = '';
  }
// Eliminar
eliminar(usuario: any) {
  if (confirm('¿Estás seguro de que deseas eliminar?')) {
    this.servicioEliminar(usuario.idUsuario).subscribe({
      next: () => this.buscarUsuario(), 
      error: (err) => {
        console.error('Error al eliminar:', err);
      },
    });
  }
}

servicioEliminar(idUsuario: number): Observable<any> {
  return this.http.delete(
    `http://localhost:8080/usuario/eliminar/${idUsuario}`
  );
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


