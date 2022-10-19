import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppLogoutUsuarioView extends StatefulWidget {
  @override
  State<AppLogoutUsuarioView> createState() => _AppLogoutUsuarioViewState();
}

class _AppLogoutUsuarioViewState extends State<AppLogoutUsuarioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Row(
            children: [
              Expanded(child: Text('Encerrar sessão')),
              Expanded(child: Icon(Icons.exit_to_app_sharp)),
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
