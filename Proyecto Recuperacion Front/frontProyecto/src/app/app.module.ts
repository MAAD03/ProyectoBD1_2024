import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http'
import { FormsModule } from '@angular/forms';

import { MenuComponent } from './menu/menu.component';
import { ROLComponent } from './rol/rol.component';
import { MENUROLComponent } from './menu-rol/menu-rol.component';
import { USUARIOComponent } from './usuario/usuario.component';
import { BITACORAComponent } from './bitacora/bitacora.component';
import { MARCAComponent } from './marca/marca.component';
import { MOTOCICLETAComponent } from './motocicleta/motocicleta.component';
import { SUCURSALComponent } from './sucursal/sucursal.component';
import { TIPOESTADOMOTOCICLETAComponent } from './tipo-estado-motocicleta/tipo-estado-motocicleta.component';
import { INVENTARIOComponent } from './inventario/inventario.component';
import { METODORENTAComponent } from './metodo-renta/metodo-renta.component';
import { TIPOESTADORESERVACIONComponent } from './tipo-estado-reservacion/tipo-estado-reservacion.component';
import { RESERVACIONComponent } from './reservacion/reservacion.component';
import { RolPipe } from './rol.pipe';
import { MenuPipe } from './menu.pipe';
import { LoginComponent } from './login/login.component';
import { InicioComponent } from './inicio/inicio.component';
import { MiPerfilComponent } from './mi-perfil/mi-perfil.component';
import { CrearUsuarioNormalComponent } from './crear-usuario-normal/crear-usuario-normal.component';
import { MarcasPipe } from './marcas.pipe';
import { MotocicletaPipe } from './motocicleta.pipe';
import { SucursalPipe } from './sucursal.pipe';
import { EstadoMotosPipe } from './estado-motos.pipe';

@NgModule({
  declarations: [
    AppComponent,
    MenuComponent,
    ROLComponent,
    MENUROLComponent,
    USUARIOComponent,
    BITACORAComponent,
    MARCAComponent,
    MOTOCICLETAComponent,
    SUCURSALComponent,
    TIPOESTADOMOTOCICLETAComponent,
    INVENTARIOComponent,
    METODORENTAComponent,
    TIPOESTADORESERVACIONComponent,
    RESERVACIONComponent,
    RolPipe,
    MenuPipe,
    LoginComponent,
    InicioComponent,
    MiPerfilComponent,
    CrearUsuarioNormalComponent,
    MarcasPipe,
    MotocicletaPipe,
    SucursalPipe,
    EstadoMotosPipe
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
