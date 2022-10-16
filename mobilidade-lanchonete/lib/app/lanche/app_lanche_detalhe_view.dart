import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppLancheDetalheView extends StatefulWidget {
  @override
  State<AppLancheDetalheView> createState() => _AppLancheDetalheViewState();
}

class _AppLancheDetalheViewState extends State<AppLancheDetalheView> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context).settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['lanche']),
      ),
      body: corpoLanche(arguments['imagem']),
    );
  }

  Widget corpoLanche(String imagem) {
    return Column(
      children: [
        Image.asset(imagem),
      ],
    );
  }
}
