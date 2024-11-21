import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component } from '@angular/core';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-motocicleta',
  templateUrl: './motocicleta.component.html',
  styleUrls: ['./motocicleta.component.css']
})
export class MOTOCICLETAComponent {
  motocicleta: any = {};
  usuarioSesion: any = {};
  motocicletaList: any[] = [];
  marcaList: any = {};
  base64:any;
  

  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  constructor(private http: HttpClient) {
    this.buscarMotocicleta();
    this.BuscarMarca();
    this.usuarioSesion = JSON.parse(localStorage.getItem('usuario') || '{}');
    
  }

  // Crear
  CrearMotocicleta() {
    let validarFormulario: any = document.getElementById('formularioCrear');
    if (validarFormulario.reportValidity()) {
        this.motocicleta.fechaModif = new Date().toISOString();
        this.motocicleta.usuarioModif = this.usuarioSesion.idUsuario.toString();
        console.log(this.motocicleta);
        this.servicioCrear().subscribe({
          next: () => {
            this.buscarMotocicleta();
            this.motocicleta = {};
            
          },
          error: (err) => {
            console.error('Error al crear:', err);
          },
        });
    }
  }

  servicioCrear(): Observable<any> {
    return this.http.post<any>(
      'http://localhost:8080/motocicleta/guardar',
      this.motocicleta,
      this.httpOptions
    );
  }

  // Buscar
  buscarMotocicleta() {
    this.servicioBuscar().subscribe({
      next: (motocicletaList: any) => {
        this.motocicletaList = Array.isArray(motocicletaList) ? motocicletaList : [];
      },
      error: (err) => {
        console.error('Error al buscar:', err);
      },
    });
  }

  servicioBuscar(): Observable<any> {
    return this.http.get('http://localhost:8080/motocicleta/buscar');
  }

  // Modificar 
  modificar(motocicleta: any) {
    this.motocicleta = motocicleta;
  }

  limpiar() {
    this.motocicleta = {};
  }
// Eliminar
eliminar(motocicleta: any) {
  if (confirm('¿Estás seguro de que deseas eliminar?')) {
    this.servicioEliminar(motocicleta.idMotocicleta).subscribe({
      next: () => this.buscarMotocicleta(), 
      error: (err) => {
        console.error('Error al eliminar:', err);
      },
    });
  }
}

servicioEliminar(idMotocicleta: number): Observable<any> {
  return this.http.delete(
    `http://localhost:8080/usuario/motocicleta/${idMotocicleta}`
  );
}



  // Buscar Marcas
  BuscarMarca() {
    this.servicioBuscarMarca().subscribe({
      next: (marcaList: any) => {
        this.marcaList = Array.isArray(marcaList) ? marcaList : [];
      },
      error: (err) => {
        console.error('Error al buscar los roles:', err);
      },
    });
  }

  servicioBuscarMarca(): Observable<any> {
    return this.http.get('http://localhost:8080/marca/buscar');
  }

  // Método de transformar imagen

  fileToBase64(file: File, callback: (base64String: string) => void): void {
    const reader = new FileReader();
    reader.onload = function () {
      const base64String = reader.result as string;
      callback(base64String);
    };

    reader.readAsDataURL(file);
  }

  transformar() {
    const input = document.getElementById("imagenInput") as HTMLInputElement | null; 
    if (input) {
      if (input.files && input.files[0]) {
        const selectedFile = input.files[0];
        this.fileToBase64(selectedFile, (base64) => {
        this.motocicleta.foto = base64;
        });
      }
    }
  }


}
