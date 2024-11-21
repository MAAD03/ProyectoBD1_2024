import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component } from '@angular/core';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-metodo-renta',
  templateUrl: './metodo-renta.component.html',
  styleUrls: ['./metodo-renta.component.css']
})
export class METODORENTAComponent {

  metodoRenta: any = {};
  metodoRentaList: any[] = [];
  usuarioSesion: any = {};

  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  constructor(private http: HttpClient) {
    this.buscarMetodoRenta();
    this.usuarioSesion = JSON.parse(localStorage.getItem('usuario') || '{}');
  }

  // Crear metodoRenta
  crearMetodoRenta() {
    let validarFormulario: any = document.getElementById('formularioCrear');
    if (validarFormulario.reportValidity()) {
      this.metodoRenta.fechaModif = new Date().toISOString();
      this.metodoRenta.usuarioModif = this.usuarioSesion.idUsuario.toString();
      console.log(this.metodoRenta);
      this.servicioCrear().subscribe({
        next: () => {
          this.buscarMetodoRenta();
          this.metodoRenta = {};
        },
        error: (err) => {
          console.error('Error al crear el metodoRenta:', err);
        },
      });
    }
  }

  servicioCrear(): Observable<any> {
    return this.http.post<any>(
      'http://localhost:8080/metodoRenta/guardar',
      this.metodoRenta,
      this.httpOptions
    );
  }

  // Buscar sucursal
  buscarMetodoRenta() {
    this.servicioBuscar().subscribe({
      next: (metodoRentaList: any) => {
        this.metodoRentaList = Array.isArray(metodoRentaList) ? metodoRentaList : [];
      },
      error: (err) => {
        console.error('Error al buscar las metodoRenta:', err);
      },
    });
  }

  servicioBuscar(): Observable<any> {
    return this.http.get('http://localhost:8080/metodoRenta/buscar');
  }

  // Modificar marca
  modificar(sucursal: any) {
    this.metodoRenta = sucursal;
  }

  limpiar() {
    this.metodoRenta = {};
  }

   // Eliminar sucursal
eliminar(metodoRenta: any) {
  if (confirm('¿Estás seguro de que deseas eliminar?')) {
    this.servicioEliminar(metodoRenta.idMetodoRenta).subscribe({
      next: () => this.buscarMetodoRenta(), 
      error: (err) => {
        console.error('Error al eliminar:', err);
      },
    });
  }
}

servicioEliminar(idMetodoRenta: number): Observable<any> {
  return this.http.delete(
    `http://localhost:8080/metodoRenta/eliminar/${idMetodoRenta}`
  );
}
}
