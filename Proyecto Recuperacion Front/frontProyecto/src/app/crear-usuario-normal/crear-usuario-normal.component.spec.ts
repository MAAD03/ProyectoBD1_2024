import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CrearUsuarioNormalComponent } from './crear-usuario-normal.component';

describe('CrearUsuarioNormalComponent', () => {
  let component: CrearUsuarioNormalComponent;
  let fixture: ComponentFixture<CrearUsuarioNormalComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [CrearUsuarioNormalComponent]
    });
    fixture = TestBed.createComponent(CrearUsuarioNormalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
