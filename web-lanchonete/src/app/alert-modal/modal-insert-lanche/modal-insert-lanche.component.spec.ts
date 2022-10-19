import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModalInsertLancheComponent } from './modal-insert-lanche.component';

describe('ModalInsertLancheComponent', () => {
  let component: ModalInsertLancheComponent;
  let fixture: ComponentFixture<ModalInsertLancheComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ModalInsertLancheComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ModalInsertLancheComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
