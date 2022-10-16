
import { Component, OnInit } from '@angular/core';
import { HePedidos } from '../models/he-pedidos';
import { HePedidosService } from '../services/he-pedidos.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  
  hePedidos?: HePedidos[];


  constructor(private hePedidosService: HePedidosService) {}
  
  ngOnInit(): void {
    this.getAllHePedidos();
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
}
