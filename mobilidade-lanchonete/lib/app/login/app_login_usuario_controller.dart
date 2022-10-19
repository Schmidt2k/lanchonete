import 'package:flutter/cupertino.dart';
import 'package:lanchonete_faculdade/config/url_base.dart';
import 'package:lanchonete_faculdade/models/Usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AppLoginUsuarioController {
  TextEditingController txtUsuario = TextEditingController();
  TextEditingController txtSenha = TextEditingController();

  Future<Usuario> loginUsuario() async {
    Usuario user = Usuario();
    try {
      String usuario = txtUsuario.text.toString().trim();
      int senha = int.parse(txtSenha.text.toString().trim());
      final response = await http.get(Uri.parse(
          URL_BASE + 'loginUsuarioMobile/usuario/$usuario/senha/$senha'));
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          user = Usuario.fromJson(json.decode(response.body));
        }
      } else {
        throw Exception('falha ao efetuar login');
      }
    } catch (e) {
      print('AppLoginUsuarioController - loginUsuario: $e');
    }
    return user;
  }
}
