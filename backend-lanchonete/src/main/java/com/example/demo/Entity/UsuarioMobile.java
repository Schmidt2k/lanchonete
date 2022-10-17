package com.example.demo.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="USUARIO_MOBILE")
public class UsuarioMobile {

		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
	    @Column(name="id_usuario_mobile")
		private Integer idUsuarioMobile;

		@Column(name="nome_usuario_mobile")
		private String nomeUsuarioMobile;

	    @Column(name="senha_usuario_mobile")
		private int senhaUsuarioMobile;
	    
	    public Integer getIdUsuarioMobile() {
			return idUsuarioMobile;
		}

		public void setIdUsuarioMobile(Integer idUsuarioMobile) {
			this.idUsuarioMobile = idUsuarioMobile;
		}

		public String getNomeUsuarioMobile() {
			return nomeUsuarioMobile;
		}

		public void setNomeUsuarioMobile(String nomeUsuarioMobile) {
			this.nomeUsuarioMobile = nomeUsuarioMobile;
		}

		public int getSenhaUsuarioMobile() {
			return senhaUsuarioMobile;
		}

		public void setSenhaUsuarioMobile(int senhaUsuarioMobile) {
			this.senhaUsuarioMobile = senhaUsuarioMobile;
		}

}
