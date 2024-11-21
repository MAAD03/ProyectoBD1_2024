import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'estadoMotos'
})
export class EstadoMotosPipe implements PipeTransform {

  transform(value: number, estadoMotocicletaList:any[]): string {
    let e: any;
    for(e of estadoMotocicletaList){
      if(e.idEstadoMotocicleta == value){
        return e.descripcion;
      }
    }
    return "No hay Informacion";
  }

}
