import { Component, Input, OnInit } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-modal-insert-lanche',
  templateUrl: './modal-insert-lanche.component.html',
  styleUrls: ['./modal-insert-lanche.component.css']
})
export class ModalInsertLancheComponent implements OnInit {

  @Input() title!: string;
  @Input() msg!: string;
  @Input() btnCancel = 'Cancelar';
  @Input() btnCriar = 'Criar ';
  
  constructor(public activeModal: NgbActiveModal) { }

  ngOnInit(): void {
  }

  onConfirm(){

  }

  onClose(){
    //this.bsModalRef.hide();
  }

}
