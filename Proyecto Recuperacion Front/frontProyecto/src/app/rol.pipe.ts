import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'rol'
})
export class RolPipe implements PipeTransform {

  transform(value: number, rolList:any[]): string {
    let e: any;
    for(e of rolList){
      if(e.idRol == value){
        return e.nombreRol;
      }
    }
    return "No hay Informacion";
  }


}
