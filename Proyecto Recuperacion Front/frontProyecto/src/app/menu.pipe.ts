import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'menu'
})
export class MenuPipe implements PipeTransform {

  transform(value: number, menuList:any[]): string {
    let e: any;
    for(e of menuList){
      if(e.idMenu == value){
        return e.nombreMenu;
      }
    }
    return "No hay Informacion";
  }

}
