import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component } from '@angular/core';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-marca',
  templateUrl: './marca.component.html',
  styleUrls: ['./marca.component.css']
})
export class MARCAComponent {
  marca: any = {};
  marcaList: any[] = [];
  usuarioSesion: any = {};

  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  constructor(private http: HttpClient) {
    this.buscar();
    this.usuarioSesion = JSON.parse(localStorage.getItem('usuario') || '{}');
  }

  // Crear Rol
  crear() {
    let validarFormulario: any = document.getElementById('formularioCrear');
    if (validarFormulario.reportValidity()) {
      this.marca.fechaModif = new Date().toISOString();
      this.marca.usuarioModif = this.usuarioSesion.idUsuario.toString();
      console.log(this.marca);
      this.servicioCrear().subscribe({
        next: () => {
          this.buscar();
          this.marca = {};
        },
        error: (err) => {
          console.error('Error al crear la marca:', err);
        },
      });
    }
  }

  servicioCrear(): Observable<any> {
    return this.http.post<any>(
      'http://localhost:8080/marca/guardar',
      this.marca,
      this.httpOptions
    );
  }

  // Buscar Roles
  buscar() {
    this.servicioBuscar().subscribe({
      next: (marcaList: any) => {
        this.marcaList = Array.isArray(marcaList) ? marcaList : [];
      },
      error: (err) => {
        console.error('Error al buscar las marcas:', err);
      },
    });
  }

  servicioBuscar(): Observable<any> {
    return this.http.get('http://localhost:8080/marca/buscar');
  }

  // Modificar marca
  modificar(marca: any) {
    this.marca = marca;
  }

  limpiar() {
    this.marca = {};
  }

   // Eliminar rol
eliminar(marca: any) {
  if (confirm('¿Estás seguro de que deseas eliminar?')) {
    this.servicioEliminar(marca.idMarca).subscribe({
      next: () => this.buscar(), 
      error: (err) => {
        console.error('Error al eliminar:', err);
      },
    });
  }
}

servicioEliminar(idMarca: number): Observable<any> {
  return this.http.delete(
    `http://localhost:8080/marca/eliminar/${idMarca}`
  );
}
}

