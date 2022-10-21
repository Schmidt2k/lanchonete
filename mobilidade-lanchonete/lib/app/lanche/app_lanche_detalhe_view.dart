import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppLancheDetalheView extends StatefulWidget {
  @override
  State<AppLancheDetalheView> createState() => _AppLancheDetalheViewState();
}

class _AppLancheDetalheViewState extends State<AppLancheDetalheView> {
  @override
  void initState() {
    super.initState();
    _controller.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context).settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(arguments['lanche'] +
            " " +
            "(R\$${arguments['valorLanche'].toStringAsFixed(2)})"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/fundo.jpg'),
          fit: BoxFit.cover,
        )),
        child: ListView(
          children: [
            lanche(arguments['imagem'], arguments['ingredientes']),
          ],
        ),
      ),
    );
  }

  Widget lanche(String imagem, String ingredientes) {
    return Column(
      children: [
        imagemLanche(imagem),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black26, spreadRadius: 1)],
                color: Colors.white,
              ),
              child: corpoLanche(ingredientes)),
        )
      ],
    );
  }

  Widget imagemLanche(String imagem) {
    return SizedBox(
      height: 220,
      width: double.maxFinite,
      child: Image.network(
        imagem,
        fit: BoxFit.fill,
      ),
    );
  }

  TextEditingController _controller = TextEditingController();

  Widget corpoLanche(String ingredientes) {
    // List<String> ltIngredientes = ingredientes != null
    //     ? ingredientes.split(', ')
    //     : ["Sem ingredientes cadastrados"];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ingredientes:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  ingredientes == null
                      ? 'Sem ingredientes cadastrados, informe ao estabelecimento.'
                      : ingredientes,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),

              // ListView.builder(
              //   padding: EdgeInsets.only(left: 10.00, top: 10.00),
              //   shrinkWrap: true,
              //   itemCount: ltIngredientes.length,
              //   itemBuilder: (context, index) {
              //     return Text(
              //       '•    ${ltIngredientes[index]}',
              //       style: TextStyle(
              //         fontSize: 18.0,
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Observação:',
                hintText: 'Ex: sem cebola...',
                labelStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.maxFinite,
            child: FlatButton(
              onPressed: () {},
              color: Colors.amber,
              child: Text(
                'Adicionar'.toUpperCase(),
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
