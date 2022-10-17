import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lanchonete_faculdade/app/login/app_login_usuario_controller.dart';

class AppLoginUsuarioView extends StatefulWidget {
  @override
  State<AppLoginUsuarioView> createState() => _AppLoginUsuarioViewState();
}

class _AppLoginUsuarioViewState extends State<AppLoginUsuarioView> {
  final AppLoginUsuarioController _usuarioController =
      Modular.get<AppLoginUsuarioController>();
  @override
  void initState() {
    super.initState();
    _usuarioController.loginUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
