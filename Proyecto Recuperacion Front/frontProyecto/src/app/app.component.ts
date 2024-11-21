import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  isLoggedIn = false;
  title = 'frontProyecto';
  menuPorRolList: any[] = [];

  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  constructor(private router: Router, private http: HttpClient) {
    const usuario = JSON.parse(localStorage.getItem('usuario') || '{}');
    const idRol = usuario.idRol;
    this.buscarNavbar(idRol);
  }


  buscarNavbar(idRol: number): void {
    this.servicioBuscarMenuPorRol(idRol).subscribe({
      next: (menuPorRolList: any) => {
        this.menuPorRolList = Array.isArray(menuPorRolList) ? menuPorRolList : [];
      },
      error: (err) => {
        console.error('Error al buscar los menús:', err);
      },
    });
  }

  servicioBuscarMenuPorRol(idRol: number): Observable<any> {
    return this.http.get(`http://localhost:8080/MenusPorRol/porRol/${idRol}`, this.httpOptions);
  }
 
  ngOnInit(): void {
    this.checkAuthentication();
  }

  
  checkAuthentication(): void {
    const usuario = localStorage.getItem('usuario');
    this.isLoggedIn = !!usuario;
  }

 
  logout(): void {
    localStorage.removeItem('usuario'); 
    this.isLoggedIn = false;
    this.router.navigate(['/login']);
}
}
