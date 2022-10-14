import { TestBed } from '@angular/core/testing';

import { HePedidosService } from './he-pedidos.service';

describe('HePedidosService', () => {
  let service: HePedidosService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(HePedidosService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
