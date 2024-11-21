import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'sucursal'
})
export class SucursalPipe implements PipeTransform {

  transform(value: number, sucursalList:any[]): string {
    let e: any;
    for(e of sucursalList){
      if(e.idSucursal == value){
        return e.nombreLocal;
      }
    }
    return "No hay Informacion";
  }

}
