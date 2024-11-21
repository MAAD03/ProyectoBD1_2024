import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-crear-usuario-normal',
  templateUrl: './crear-usuario-normal.component.html',
  styleUrls: ['./crear-usuario-normal.component.css']
})
export class CrearUsuarioNormalComponent {
  usuario: any = {};

  confirmPassword: string = ''; 

  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  constructor(private http: HttpClient, private router: Router) {
  
    
  }

  // Crear
  crearUsuario() {
    let validarFormulario: any = document.getElementById('formularioCrear');
    if (validarFormulario.reportValidity()) {
      if (this.usuario.passwordUsuario === this.confirmPassword) {
        this.usuario.fechaModif = new Date().toISOString();
        this.usuario.usuarioModif = "Usuario creado por primera Instancia";
        this.usuario.idRol = 46;
        console.log(this.usuario);

        this.servicioCrear().subscribe({
          next: () => {
            alert('Usuario Creado con exito');
            this.usuario = {};
            this.confirmPassword = '';
            this.router.navigate(['/login']);
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

  cancelar() {
    this.usuario = {};
    this.confirmPassword = '';
    this.router.navigate(['/login']);

  }

}
