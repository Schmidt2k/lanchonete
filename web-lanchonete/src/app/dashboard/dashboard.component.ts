import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { HePedidos } from '../models/he-pedidos';
import { HePedidosService } from '../services/he-pedidos.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  hePedido = {} as HePedidos;
  pedidos!: HePedidos[];
  readonly apiURL : string;
  
  constructor(private http : HttpClient) {
    this.apiURL = 'http://localhost:8080';
   }
  
  ngOnInit(): void {
  }

  getAllHePedidos() {
    this.http.get(`${this.apiURL}/recuperarHePedido`).subscribe(resultado => console.log(resultado));
  }

}
