import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lanchonete_faculdade/app/cardapio/app_cardapio_controller.dart';
import 'package:lanchonete_faculdade/app/login/app_login_usuario_view.dart';
import 'package:lanchonete_faculdade/app/pedidos/app_pedidos_realizados_view.dart';
import 'package:lanchonete_faculdade/app/telas/app_telas.dart';
import 'package:lanchonete_faculdade/models/Lanche.dart';

class AppCardapioView extends StatefulWidget {
  @override
  State<AppCardapioView> createState() => _AppCardapioViewState();
}

class _AppCardapioViewState extends State<AppCardapioView> {
  final AppCardapioController _cardapioController =
      Modular.get<AppCardapioController>();
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context).settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexPage,
        selectedItemColor: Colors.black,
        onTap: (num) {
          setState(() {
            indexPage = num;
            _pageController.jumpToPage(num);
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.book_sharp), label: ("Cardápio")),
          BottomNavigationBarItem(
              icon: Icon(Icons.point_of_sale), label: ("Pedidos")),
          BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app), label: ("Sair")),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Lanchonete'),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          cardapio(),
          AppPedidosRealizadosView(
            usuario: arguments['usuario'],
          ),
          AppLoginUsuarioView()
        ],
      ),
    );
  }

  final _pageController = PageController();

  Widget cardapio() {
    return Column(
      children: [
        // clienteMesa(),
        categorias(),
        listaLanches(),
      ],
    );
  }

  Widget categorias() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/x-tudo.jpg'),
                      maxRadius: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Lanches',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/pizza.jpg'),
                      maxRadius: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Pizzas',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/combo.jpg'),
                      maxRadius: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Combos',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/porcoes.jpg'),
                      maxRadius: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Porções',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/bebidas.jpg'),
                      maxRadius: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Bebidas',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listaLanches() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: StreamBuilder<List<Lanche>>(
          stream: _cardapioController.listaLanche(),
          initialData: [],
          builder: (context, index) {
            if (index.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ));
            }
            return ListView.builder(
              itemCount: index.data.length,
              itemBuilder: (context, item) {
                return lancheSelecionado(index.data[item]);
              },
            );
          },
        ),
      ),
    );
  }

  Widget lancheSelecionado(Lanche item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            TELA_LANCHE_DETALHE,
            arguments: {
              'lanche': item.titulo,
              'imagem': item.imagem,
              'valorLanche': item.valorLanche,
              'ingredientes': item.ingredientes,
            },
          );
        },
        child: Card(
          elevation: 2.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item.titulo +
                        ' (R\$ ${item.valorLanche.toStringAsFixed(2)})',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
              ),
              Image.network(
                item.imagem,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
