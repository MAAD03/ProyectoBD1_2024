import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'marcas'
})
export class MarcasPipe implements PipeTransform {

  transform(value: number, marcaList:any[]): string {
    let e: any;
    for(e of marcaList){
      if(e.idMarca == value){
        return e.nombreMarca;
      }
    }
    return "No hay Informacion";
  }

}
