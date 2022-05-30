//IMPORTANDO MATERIAL DART
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//CHAMANDO STF, WIDGET COM ESTADO.
void main (){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar:AppBar(
          //centralizar titulo do appBar
         title:Row(mainAxisAlignment: MainAxisAlignment.center,
             children:[Text('Calculadora HPNA'),
             ]
         ),

          backgroundColor:Colors.black87,
          elevation: 30,
          actions: [IconButton(icon: Icon(Icons.announcement),
           onPressed: () => {},
           )
          ],

        ),



         body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.cyan,Colors.blue]),),


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
           child:Padding (padding: const EdgeInsets.all(20.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,



            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Metros de Cabos",
                    border:OutlineInputBorder()
                  ),
                //tipo de teclado a ser apresentado ao precionar o TextField
                keyboardType: TextInputType.number
                ),
              //Responsavel por dar o espaçamento entre os TextFild
              Padding(padding: EdgeInsets.all(10.0),),

              TextField(decoration: InputDecoration(
                 labelText:"Conectores RG6",
                   border:OutlineInputBorder()
              ),
                  //tipo de teclado a ser apresentado
                  keyboardType: TextInputType.number
               ) ,

              //Responsavel por dar o espaçamento entre os TextFild
              Padding(padding: EdgeInsets.all(10.0),),

              TextField(decoration: InputDecoration(
                labelText:"Divisores 1/2",
                  border:OutlineInputBorder()
                ),
                //tipo de teclado a ser apresentado
                keyboardType: TextInputType.number
              ),

              //Responsavel por dar o espaçamento entre os TextFild
              Padding(padding: EdgeInsets.all(10.0),),

              TextField(decoration: InputDecoration(
                labelText:"Divisores 1/4",
                  border:OutlineInputBorder()
                ),
                //tipo de teclado a ser apresentado
                keyboardType: TextInputType.number,
              ),


              //Responsavel por dar o espaçamento entre TextFild/button
              Padding(padding: EdgeInsets.all(25.0),),


              Container(
                width: 150,
                height: 55,

                child: RaisedButton.icon(onPressed:(){
                print("Somando");
                },
                  color: Colors.black87,
                  icon:Icon(Icons.view_stream,color: Colors.cyan,),
                 label:Text("SOMA",style: TextStyle(color: Colors.cyan)
                 ),
              )
              ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
