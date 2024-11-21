import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component } from '@angular/core';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-inventario',
  templateUrl: './inventario.component.html',
  styleUrls: ['./inventario.component.css']
})
export class INVENTARIOComponent {
  
  usuarioSesion: any = {};
  inventario: any = {};
  inventarioList: any[] = [];
  motocicletaList: any = {};
  sucursalList: any = {};
  estadoMotocicletaList: any = {};

  

  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  constructor(private http: HttpClient) {
    this.buscarInventario();
    this.buscarMotocicleta();
    this.buscarSucursal();
    this.buscarEstadoMotocicleta();
    this.usuarioSesion = JSON.parse(localStorage.getItem('usuario') || '{}');
    
  }

  // Crear
  CrearInventario() {
    let validarFormulario: any = document.getElementById('formularioCrear');
    if (validarFormulario.reportValidity()) {
        this.inventario.fechaModif = new Date().toISOString();
        this.inventario.usuarioModif = this.usuarioSesion.idUsuario.toString();
        console.log(this.inventario);
        this.servicioCrear().subscribe({
          next: () => {
            this.buscarInventario();
            this.inventario = {};
            
          },
          error: (err) => {
            console.error('Error al crear:', err);
          },
        });
    }
  }

  servicioCrear(): Observable<any> {
    return this.http.post<any>(
      'http://localhost:8080/inventario/guardar',
      this.inventario,
      this.httpOptions
    );
  }

  // Buscar
  buscarInventario() {
    this.servicioBuscar().subscribe({
      next: (inventarioList: any) => {
        this.inventarioList = Array.isArray(inventarioList) ? inventarioList : [];
      },
      error: (err) => {
        console.error('Error al buscar:', err);
      },
    });
  }

  servicioBuscar(): Observable<any> {
    return this.http.get('http://localhost:8080/inventario/buscar');
  }

  // Modificar 
  modificar(inventario: any) {
    this.inventario = inventario;
  }

  limpiar() {
    this.inventario = {};
  }
// Eliminar
eliminar(inventario: any) {
  if (confirm('¿Estás seguro de que deseas eliminar?')) {
    this.servicioEliminar(inventario.idInventario).subscribe({
      next: () => this.buscarInventario(), 
      error: (err) => {
        console.error('Error al eliminar:', err);
      },
    });
  }
}

servicioEliminar(idInventario: number): Observable<any> {
  return this.http.delete(
    `http://localhost:8080/inventario/eliminar/${idInventario}`
  );
}



  // Buscar motocicleta
  buscarMotocicleta() {
    this.servicioBuscarMotocicleta().subscribe({
      next: (motocicletaList: any) => {
        this.motocicletaList = Array.isArray(motocicletaList) ? motocicletaList : [];
      },
      error: (err) => {
        console.error('Error al buscar:', err);
      },
    });
  }

  servicioBuscarMotocicleta(): Observable<any> {
    return this.http.get('http://localhost:8080/motocicleta/buscar');
  }


  // Buscar sucursal
  buscarSucursal() {
    this.servicioBuscarSucursal().subscribe({
      next: (sucursalList: any) => {
        this.sucursalList = Array.isArray(sucursalList) ? sucursalList : [];
      },
      error: (err) => {
        console.error('Error al buscar las sucursales:', err);
      },
    });
  }

  servicioBuscarSucursal(): Observable<any> {
    return this.http.get('http://localhost:8080/sucursal/buscar');
  }

  // Buscar Estado de motocicleta
  buscarEstadoMotocicleta() {
    this.servicioBuscarEstadoMotocicleta().subscribe({
      next: (estadoMotocicletaList: any) => {
        this.estadoMotocicletaList = Array.isArray(estadoMotocicletaList) ? estadoMotocicletaList : [];
      },
      error: (err) => {
        console.error('Error al buscar los EstadoMotocicleta:', err);
      },
    });
  }

  servicioBuscarEstadoMotocicleta(): Observable<any> {
    return this.http.get('http://localhost:8080/estadoMoto/buscar');
  }

}
