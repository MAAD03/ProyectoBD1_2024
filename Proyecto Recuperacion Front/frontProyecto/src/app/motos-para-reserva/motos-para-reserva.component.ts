import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';

@Component({
  selector: 'app-motos-para-reserva',
  templateUrl: './motos-para-reserva.component.html',
  styleUrls: ['./motos-para-reserva.component.css']
})
export class MotosParaReservaComponent {

  inventarioDisponible: any[] = [];
  


  constructor(private http: HttpClient) {
    
  }

  

  ngOnInit(): void {
    this.obtenerInventarioDisponible();
  }

  obtenerInventarioDisponible(): void {
    this.http.get('http://localhost:8080/inventario/disponible')
      .subscribe({
        next: (data: any) => this.inventarioDisponible = data,
        error: (err) => console.error('Error al cargar el inventario:', err)
      });
  }

  

}
