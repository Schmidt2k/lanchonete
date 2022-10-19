
import { Component, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ModalInsertLancheComponent } from '../alert-modal/modal-insert-lanche/modal-insert-lanche.component';
import { HePedidos } from '../models/he-pedidos';
import { HePedidosService } from '../services/he-pedidos.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  
  hePedidos?: HePedidos[];

  constructor(private hePedidosService: HePedidosService, private modalInsertLancheComponent: ModalInsertLancheComponent, public ngbModal: NgbModal) {}
  
  ngOnInit(): void {
    
    window.setInterval(() =>{
      this.getAllHePedidos();
    }, 1000);
  }

  getAllHePedidos(): void {
   this.hePedidosService.getAll().subscribe({
    next: (data) => {
      this.hePedidos = data;
      console.log(data);
    },
    error: (e) => console.error(e)
   });
  }

  abrirModalInsertLanche(){
    this.ngbModal.open(ModalInsertLancheComponent)
  }

  
}
