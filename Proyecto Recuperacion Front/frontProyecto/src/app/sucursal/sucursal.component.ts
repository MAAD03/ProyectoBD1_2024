import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component } from '@angular/core';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-sucursal',
  templateUrl: './sucursal.component.html',
  styleUrls: ['./sucursal.component.css']
})
export class SUCURSALComponent {
  sucursal: any = {};
  sucursalList: any[] = [];
  usuarioSesion: any = {};

  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  constructor(private http: HttpClient) {
    this.buscarSucursal();
    this.usuarioSesion = JSON.parse(localStorage.getItem('usuario') || '{}');
  }

  // Crear sucursal
  crearSucursal() {
    let validarFormulario: any = document.getElementById('formularioCrear');
    if (validarFormulario.reportValidity()) {
      this.sucursal.fechaModif = new Date().toISOString();
      this.sucursal.usuarioModif = this.usuarioSesion.idUsuario.toString();
      console.log(this.sucursal);
      this.servicioCrear().subscribe({
        next: () => {
          this.buscarSucursal();
          this.sucursal = {};
        },
        error: (err) => {
          console.error('Error al crear la sucursal:', err);
        },
      });
    }
  }

  servicioCrear(): Observable<any> {
    return this.http.post<any>(
      'http://localhost:8080/sucursal/guardar',
      this.sucursal,
      this.httpOptions
    );
  }

  // Buscar sucursal
  buscarSucursal() {
    this.servicioBuscar().subscribe({
      next: (sucursalList: any) => {
        this.sucursalList = Array.isArray(sucursalList) ? sucursalList : [];
      },
      error: (err) => {
        console.error('Error al buscar las sucursales:', err);
      },
    });
  }

  servicioBuscar(): Observable<any> {
    return this.http.get('http://localhost:8080/sucursal/buscar');
  }

  // Modificar marca
  modificar(sucursal: any) {
    this.sucursal = sucursal;
  }

  limpiar() {
    this.sucursal = {};
  }

   // Eliminar sucursal
eliminar(sucursal: any) {
  if (confirm('¿Estás seguro de que deseas eliminar?')) {
    this.servicioEliminar(sucursal.idSucursal).subscribe({
      next: () => this.buscarSucursal(), 
      error: (err) => {
        console.error('Error al eliminar:', err);
      },
    });
  }
}

servicioEliminar(idSucursal: number): Observable<any> {
  return this.http.delete(
    `http://localhost:8080/sucursal/eliminar/${idSucursal}`
  );
}
}
