import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MenuComponent } from './menu/menu.component';
import { BITACORAComponent } from './bitacora/bitacora.component';
import { INVENTARIOComponent } from './inventario/inventario.component';
import { MARCAComponent } from './marca/marca.component';
import { MENUROLComponent } from './menu-rol/menu-rol.component';
import { METODORENTAComponent } from './metodo-renta/metodo-renta.component';
import { MOTOCICLETAComponent } from './motocicleta/motocicleta.component';
import { RESERVACIONComponent } from './reservacion/reservacion.component';
import { ROLComponent } from './rol/rol.component';
import { SUCURSALComponent } from './sucursal/sucursal.component';
import { TIPOESTADOMOTOCICLETAComponent } from './tipo-estado-motocicleta/tipo-estado-motocicleta.component';
import { TIPOESTADORESERVACIONComponent } from './tipo-estado-reservacion/tipo-estado-reservacion.component';
import { USUARIOComponent } from './usuario/usuario.component';

const routes: Routes = [
  { path: 'bitacora', component: BITACORAComponent },
  { path: 'inventario', component: INVENTARIOComponent },
  { path: 'marca', component: MARCAComponent },
  { path: 'menu', component: MenuComponent },
  { path: 'menuRol', component: MENUROLComponent },
  { path: 'metodoRenta', component: METODORENTAComponent },
  { path: 'motocicleta', component: MOTOCICLETAComponent },
  { path: 'reservacion', component: RESERVACIONComponent },
  { path: 'rol', component: ROLComponent },
  { path: 'sucursal', component: SUCURSALComponent },
  { path: 'estadoMotocicleta', component: TIPOESTADOMOTOCICLETAComponent },
  { path: 'estadoReservacion', component: TIPOESTADORESERVACIONComponent },
  { path: 'usuario', component: USUARIOComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {

 }
