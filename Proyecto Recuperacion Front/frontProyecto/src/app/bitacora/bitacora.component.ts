import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component } from '@angular/core';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-bitacora',
  templateUrl: './bitacora.component.html',
  styleUrls: ['./bitacora.component.css']
})
export class BITACORAComponent {

  bitacora: any = {};
  bitacoraList: any[] = [];

  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  constructor(private http: HttpClient) {
    this.buscarBitacora();

  }


   // Buscar Bitácora
buscarBitacora() {
  this.serviciobuscarBitacora().subscribe({
    next: (bitacoraList: any[]) => {
      this.bitacoraList = Array.isArray(bitacoraList)
        ? bitacoraList.sort(
            (a, b) => new Date(b.fechaModif).getTime() - new Date(a.fechaModif).getTime()
          )
        : [];
    },
    error: (err) => {
      console.error('Error al buscar la Bitácora:', err);
    },
  });
}


  serviciobuscarBitacora(): Observable<any> {
    return this.http.get('http://localhost:8080/bitacora/buscar');
  }
}
