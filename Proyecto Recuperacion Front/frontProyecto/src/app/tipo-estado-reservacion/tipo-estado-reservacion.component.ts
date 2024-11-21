import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component } from '@angular/core';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-tipo-estado-reservacion',
  templateUrl: './tipo-estado-reservacion.component.html',
  styleUrls: ['./tipo-estado-reservacion.component.css']
})
export class TIPOESTADORESERVACIONComponent {

  estadoResevacion: any = {};
  estadoResevacionList: any[] = [];
  usuarioSesion: any = {};

  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  constructor(private http: HttpClient) {
    this.buscarEstadoResevacion();
    this.usuarioSesion = JSON.parse(localStorage.getItem('usuario') || '{}');
  }

  // Crear EstadoResevacion
  crearEstadoResevacion() {
    let validarFormulario: any = document.getElementById('formularioCrear');
    if (validarFormulario.reportValidity()) {
      this.estadoResevacion.fechaModif = new Date().toISOString();
      this.estadoResevacion.usuarioModif = this.usuarioSesion.idUsuario.toString();
      console.log(this.estadoResevacion);
      this.servicioCrear().subscribe({
        next: () => {
          this.buscarEstadoResevacion();
          this.estadoResevacion = {};
        },
        error: (err) => {
          console.error('Error al crear el EstadoResevacion:', err);
        },
      });
    }
  }

  servicioCrear(): Observable<any> {
    return this.http.post<any>(
      'http://localhost:8080/estadoReservacion/guardar',
      this.estadoResevacion,
      this.httpOptions
    );
  }

  // Buscar EstadoResevacion
  buscarEstadoResevacion() {
    this.servicioBuscar().subscribe({
      next: (estadoResevacionList: any) => {
        this.estadoResevacionList = Array.isArray(estadoResevacionList) ? estadoResevacionList : [];
      },
      error: (err) => {
        console.error('Error al buscar los EstadoResevacion:', err);
      },
    });
  }

  servicioBuscar(): Observable<any> {
    return this.http.get('http://localhost:8080/estadoReservacion/buscar');
  }

  // Modificar estadoResevacion
  modificar(estadoResevacion: any) {
    this.estadoResevacion = estadoResevacion;
  }

  limpiar() {
    this.estadoResevacion = {};
  }

   // Eliminar estadoResevacion
eliminar(estadoResevacion: any) {
  if (confirm('¿Estás seguro de que deseas eliminar?')) {
    this.servicioEliminar(estadoResevacion.idEstadoReservacion).subscribe({
      next: () => this.buscarEstadoResevacion(), 
      error: (err) => {
        console.error('Error al eliminar:', err);
      },
    });
  }
}

servicioEliminar(idEstadoReservacion: number): Observable<any> {
  return this.http.delete(
    `http://localhost:8080/estadoReservacion/eliminar/${idEstadoReservacion}`
  );
}
}
