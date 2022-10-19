import { Component, Input, OnInit } from '@angular/core';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Lanche } from 'src/app/models/lanche';

@Component({
  selector: 'app-modal-insert-lanche',
  templateUrl: './modal-insert-lanche.component.html',
  styleUrls: ['./modal-insert-lanche.component.css']
})
export class ModalInsertLancheComponent implements OnInit {

  @Input() lanche!: Lanche;
  
  constructor(public ngbModal: NgbModal) { }

  ngOnInit(): void {
  }

  

}
