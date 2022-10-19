import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: SingleChildScrollView(
          child: lanche(arguments['imagem'], arguments['ingredientes'])),
    );
  }

  Widget lanche(String imagem, String ingredientes) {
    return Column(
      children: [
        imagemLanche(imagem),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: corpoLanche(ingredientes),
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
                    fontSize: 16.0,
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
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          controller: _controller,
                          enabled: false,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: false,
                            signed: true,
                          ),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'\d')),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Container(
                          color: Colors.black,
                          height: 38.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                child: InkWell(
                                  child: Icon(
                                    Icons.arrow_drop_up,
                                    size: 18.0,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    int currentValue =
                                        int.parse(_controller.text);
                                    setState(() {
                                      currentValue++;
                                      _controller.text =
                                          (currentValue).toString();
                                    });
                                  },
                                ),
                              ),
                              InkWell(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 18.0,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  int currentValue =
                                      int.parse(_controller.text);
                                  setState(() {
                                    currentValue--;
                                    _controller.text =
                                        (currentValue > 0 ? currentValue : 0)
                                            .toString(); // decrementing value
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  onPressed: () {},
                  color: double.parse(_controller.text.trim()) > 0
                      ? Colors.amber
                      : null,
                  child: Text(
                    'Adicionar'.toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Observação',
            ),
          ),
        ),
      ],
    );
  }
}
