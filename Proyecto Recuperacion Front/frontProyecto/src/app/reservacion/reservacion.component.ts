import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component } from '@angular/core';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-reservacion',
  templateUrl: './reservacion.component.html',
  styleUrls: ['./reservacion.component.css']
})
export class RESERVACIONComponent {

  reservacion: any = {};
  reservacionList: any[] = [];
  usuarioSesion: any = {};

  estadoResevacionList: any = {};
  metodoRentaList: any = {};
  inventarioList: any = {};



  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  constructor(private http: HttpClient) {
    this.buscarReservacion();
    this.buscarMetodoRenta();
    this.buscarInventario();
    this.buscarEstadoResevacion();
    this.usuarioSesion = JSON.parse(localStorage.getItem('usuario') || '{}');

  }

  // Crear
  CrearReservacion() {
    let validarFormulario: any = document.getElementById('formularioCrear');
    if (validarFormulario.reportValidity()) {
      this.reservacion.fechaModif = new Date().toISOString();
      this.reservacion.idUsuario = this.usuarioSesion.idUsuario;
      this.reservacion.usuarioModif = this.usuarioSesion.idUsuario.toString();
      // this.reservacion.idEstadoReservacion = 2;
      console.log(this.reservacion);
      this.servicioCrear().subscribe({
        next: () => {
          this.buscarReservacion();
          this.reservacion = {};

        },
        error: (err) => {
          console.error('Error al crear:', err);
        },
      });
    }
  }

  servicioCrear(): Observable<any> {
    return this.http.post<any>(
      'http://localhost:8080/reservacion/guardar',
      this.reservacion,
      this.httpOptions
    );
  }

  // Buscar
  buscarReservacion() {
    this.servicioBuscarReservacion().subscribe({
      next: (reservacionList: any) => {
        this.reservacionList = Array.isArray(reservacionList) ? reservacionList : [];
      },
      error: (err) => {
        console.error('Error al buscar:', err);
      },
    });
  }

  servicioBuscarReservacion(): Observable<any> {
    return this.http.get('http://localhost:8080/reservacion/buscar');
  }

  // Modificar 
  modificar(reservacion: any) {
    this.reservacion = reservacion;
  }

  limpiar() {
    this.reservacion = {};
  }

  // Eliminar
  eliminar(reservacion: any) {
    if (confirm('¿Estás seguro de que deseas eliminar?')) {
      this.servicioEliminar(reservacion.idReservacion).subscribe({
        next: () => this.buscarReservacion(),
        error: (err) => {
          console.error('Error al eliminar:', err);
        },
      });
    }
  }

  servicioEliminar(idReservacion: number): Observable<any> {
    return this.http.delete(
      `http://localhost:8080/reservacion/eliminar/${idReservacion}`
    );
  }

  // Buscar
  buscarInventario() {
    this.servicioBuscarInventario().subscribe({
      next: (inventarioList: any) => {
        this.inventarioList = Array.isArray(inventarioList) ? inventarioList : [];
      },
      error: (err) => {
        console.error('Error al buscar:', err);
      },
    });
  }

  servicioBuscarInventario(): Observable<any> {
    return this.http.get('http://localhost:8080/inventario/buscar');
  }


  // Buscar sucursal
  buscarMetodoRenta() {
    this.servicioBuscarMetodoRenta().subscribe({
      next: (metodoRentaList: any) => {
        this.metodoRentaList = Array.isArray(metodoRentaList) ? metodoRentaList : [];
      },
      error: (err) => {
        console.error('Error al buscar las metodoRenta:', err);
      },
    });
  }

  servicioBuscarMetodoRenta(): Observable<any> {
    return this.http.get('http://localhost:8080/metodoRenta/buscar');
  }

  // Buscar EstadoResevacion
  buscarEstadoResevacion() {
    this.servicioBuscarEstadoReservacion().subscribe({
      next: (estadoResevacionList: any) => {
        this.estadoResevacionList = Array.isArray(estadoResevacionList) ? estadoResevacionList : [];
      },
      error: (err) => {
        console.error('Error al buscar los EstadoResevacion:', err);
      },
    });
  }

  servicioBuscarEstadoReservacion(): Observable<any> {
    return this.http.get('http://localhost:8080/estadoReservacion/buscar');
  }








}
