import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lanchonete_faculdade/app/login/app_login_usuario_controller.dart';
import 'package:lanchonete_faculdade/app/telas/app_telas.dart';

class AppLoginUsuarioView extends StatefulWidget {
  @override
  State<AppLoginUsuarioView> createState() => _AppLoginUsuarioViewState();
}

class _AppLoginUsuarioViewState extends State<AppLoginUsuarioView> {
  final AppLoginUsuarioController _usuarioController =
      Modular.get<AppLoginUsuarioController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                campoTexto(_usuarioController.txtUsuario, 'Usuário', false,
                    Icon(Icons.person), false),
                campoTexto(_usuarioController.txtSenha, 'Senha', true,
                    Icon(Icons.vpn_key_outlined), true),
                botaoLogin(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget campoTexto(TextEditingController controller, String titulo, bool senha,
          Icon icone, bool number) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          keyboardType: number ? TextInputType.number : TextInputType.name,
          validator: (value) {
            if (value.isEmpty || value == "" || value == null) {
              return "*Campo obrigatório!";
            } else {
              return null;
            }
          },
          obscureText: senha,
          decoration: InputDecoration(
            hintText: titulo,
            labelText: titulo,
            prefixIcon: icone,
          ),
        ),
      );

  Widget botaoLogin() {
    return RaisedButton(
        child: Text('Login'),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            await _usuarioController.loginUsuario().then(
              (usuario) {
                if (usuario.idUsuario != null) {
                  return Navigator.pushNamed(
                    context,
                    TELA_CARDAPIO,
                    arguments: {'usuario': usuario},
                  );
                } else {
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Row(
                          children: [
                            Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                            Text('Dados inválidos'),
                          ],
                        ),
                        content: Text('Usuário ou senha inválidos!'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Entendido'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            );
          }
        });
  }
}
