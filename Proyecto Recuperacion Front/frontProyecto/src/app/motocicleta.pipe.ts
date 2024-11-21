import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'motocicleta'
})
export class MotocicletaPipe implements PipeTransform {

  transform(value: number, motocicletaList:any[]): string {
    let e: any;
    for(e of motocicletaList){
      if(e.idMotocicleta == value){
        return e.modelo;
      }
    }
    return "No hay Informacion";
  }

}
