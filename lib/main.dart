//IMPORTANDO MATERIAL DART
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//CHAMANDO STF, WIDGET COM ESTADO.
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController teMetroController = TextEditingController();
  TextEditingController teConectoresController = TextEditingController();
  TextEditingController teDivisorUmPorDoisController = TextEditingController();
  TextEditingController teDivisorUmPorQuatroController =
      TextEditingController();

  final _messageKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messageKey,
      home: Scaffold(
        appBar: buildAppBar(),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.cyan, Colors.blue]),
          ),
          child: SizedBox(
            /*WIDTH É RESPONSAVEL PELA
            LARGURA DOS TextField

          width: double.infinity,
           height é responsavel pela
           altura dos TextField
           height: double.infinity,
           é responsavel por organizar
           por coluna e centralizar os TextField
            */
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTextField(
                    controller: teMetroController,
                    label: "Metros de Cabos",
                  ),

                  //Responsavel por dar o espaçamento entre os TextFild
                  Padding(padding: EdgeInsets.all(10.0)),

                  buildTextField(
                    controller: teConectoresController,
                    label: "Conectores RG6",
                  ),

                  //Responsavel por dar o espaçamento entre os TextFild
                  Padding(padding: EdgeInsets.all(10.0)),

                  buildTextField(
                    controller: teDivisorUmPorDoisController,
                    label: "Divisores 1/2",
                  ),
                  //Responsavel por dar o espaçamento entre os TextFild
                  Padding(padding: EdgeInsets.all(10.0)),

                  buildTextField(
                    controller: teDivisorUmPorQuatroController,
                    label: "Divisores 1/4",
                  ),

                  //Responsavel por dar o espaçamento entre TextFild/button
                  Padding(padding: EdgeInsets.all(25.0)),

                  buildBotaoSomar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildBotaoSomar() {
    return Container(
      //width = largura do botao / heidth = altura do botao
      width: 150,
      height: 55,
      child: ElevatedButton.icon(
        onPressed: () {
          print("Somando");
          //double.tryParse converte string em double
          var valorPerdaMetro = (double.tryParse(teMetroController.text) ?? 0) * 0.06;
          var valorPerdaConectores = (double.tryParse(teConectoresController.text) ??0) * 0.15;
          var valorPerdaDivisoresUmDois = (double.tryParse(teConectoresController.text) ??0) * 8;
          var valorPerdaDivisoresUmQuatro = (double.tryParse(teConectoresController.text) ??0) * 12;
          var total = valorPerdaMetro + valorPerdaConectores + valorPerdaDivisoresUmDois + valorPerdaDivisoresUmQuatro;
          buildShowSnackBar('Perda de -$total dB');
        },
        style: ElevatedButton.styleFrom(primary: Colors.black87),
        icon: Icon(
          Icons.view_stream,
          color: Colors.cyan,
        ),
        label: Text("SOMA", style: TextStyle(color: Colors.cyan)),
      ),
    );
  }

  void buildShowSnackBar(String message) {
    _messageKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  TextField buildTextField( //required = obrigatoriedade
      {
    required TextEditingController controller,
    String? label,
  }) {
    return TextField(
      controller: controller,
      // enabled: false, bloquear
      //onChenged retorna o valor digitado no textFiield
      onChanged: (cabos) {
        //valor = cabos;
        print(cabos);
      },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      //tipo de teclado a ser apresentado
      keyboardType: TextInputType.number,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      //centralizar titulo do appBarr
      title: Text('Calculadora HPNA'),
      centerTitle: true,
      backgroundColor: Colors.black87,
      elevation: 30,
      actions: [
        IconButton(
          icon: Icon(Icons.announcement),
          onPressed: () => {},
        )
      ],
    );
  }
}
