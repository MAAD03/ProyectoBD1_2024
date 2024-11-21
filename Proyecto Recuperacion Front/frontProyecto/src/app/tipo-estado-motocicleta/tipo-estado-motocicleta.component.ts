import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component } from '@angular/core';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-tipo-estado-motocicleta',
  templateUrl: './tipo-estado-motocicleta.component.html',
  styleUrls: ['./tipo-estado-motocicleta.component.css']
})
export class TIPOESTADOMOTOCICLETAComponent {
  estadoMotocicleta: any = {};
  estadoMotocicletaList: any[] = [];
  usuarioSesion: any = {};

  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  constructor(private http: HttpClient) {
    this.buscarEstadoMotocicleta();
    this.usuarioSesion = JSON.parse(localStorage.getItem('usuario') || '{}');
  }

  // Crear EstadoMotocicleta
  crearEstadoMotocicleta() {
    let validarFormulario: any = document.getElementById('formularioCrear');
    if (validarFormulario.reportValidity()) {
      this.estadoMotocicleta.fechaModif = new Date().toISOString();
      this.estadoMotocicleta.usuarioModif = this.usuarioSesion.idUsuario.toString();
      console.log(this.estadoMotocicleta);
      this.servicioCrear().subscribe({
        next: () => {
          this.buscarEstadoMotocicleta();
          this.estadoMotocicleta = {};
        },
        error: (err) => {
          console.error('Error al crear la estadoMotocicleta:', err);
        },
      });
    }
  }

  servicioCrear(): Observable<any> {
    return this.http.post<any>(
      'http://localhost:8080/estadoMoto/guardar',
      this.estadoMotocicleta,
      this.httpOptions
    );
  }

  // Buscar EstadoMotocicleta
  buscarEstadoMotocicleta() {
    this.servicioBuscar().subscribe({
      next: (estadoMotocicletaList: any) => {
        this.estadoMotocicletaList = Array.isArray(estadoMotocicletaList) ? estadoMotocicletaList : [];
      },
      error: (err) => {
        console.error('Error al buscar los EstadoMotocicleta:', err);
      },
    });
  }

  servicioBuscar(): Observable<any> {
    return this.http.get('http://localhost:8080/estadoMoto/buscar');
  }

  // Modificar EstadoMotocicleta
  modificar(estadoMotocicleta: any) {
    this.estadoMotocicleta = estadoMotocicleta;
  }

  limpiar() {
    this.estadoMotocicleta = {};
  }

  // Eliminar EstadoMotocicleta
  eliminar(estadoMotocicleta: any) {
    if (confirm('¿Estás seguro de que deseas eliminar?')) {
      this.servicioEliminar(estadoMotocicleta.idEstadoMotocicleta).subscribe({
        next: () => this.buscarEstadoMotocicleta(),
        error: (err) => {
          console.error('Error al eliminar:', err);
        },
      });
    }
  }

  servicioEliminar(idEstadoMotocicleta: number): Observable<any> {
    return this.http.delete(
      `http://localhost:8080/estadoMoto/eliminar/${idEstadoMotocicleta}`
    );
  }
}
