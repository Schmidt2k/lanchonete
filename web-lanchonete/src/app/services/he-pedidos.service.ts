import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { HePedidos } from '../models/he-pedidos';

@Injectable({
  providedIn: 'root'
})
export class HePedidosService {

  apiUrl = 'http://localhost:8080';

  constructor(
    private httpClient:HttpClient
    ) { }

    httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'application/json' })
    }

  getAllHePedidos() {
    return this.httpClient.get(`${this.apiUrl}/recuperarHePedido`).subscribe(resultado => console.log(resultado));
  }
}
