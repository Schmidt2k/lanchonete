import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from "@angular/common/http";

import {  Observable, throwError } from 'rxjs';
import { retry, catchError } from 'rxjs/operators';
import { HePedidos } from '../models/he-pedidos';

const apiUrl = 'http://localhost:8080/api/pedidos/recuperarHePedido';

@Injectable({
  providedIn: 'root'
})
export class HePedidosService {



  constructor(private http:HttpClient) { }

  getAll(): Observable<HePedidos[]> {
    return this.http.get<HePedidos[]>(apiUrl);
  }

    handleError(error: HttpErrorResponse) {
      let errorMessage = 'Unknown error!';
      if (error.error instanceof ErrorEvent) {
        // Client-side errors
        errorMessage = `Error: ${error.error.message}`;
      } else {
        // Server-side errors
        errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
      }
      window.alert(errorMessage);
      return throwError(errorMessage);
    }

    public sendGetRequest(){
      return this.http.get(apiUrl).pipe(retry(3), catchError(this.handleError));

    }
}
