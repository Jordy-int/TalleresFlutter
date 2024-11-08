import 'package:flutter/material.dart'; //libreria con diseños

void main() {
  runApp(MyApp()); //runapp corre la app (configuraciones iniciales)
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { //método build o constructor
    return const MaterialApp( //regresa el widget
      home: Center(child:Text("hola mundo")), 
    );
  }
}
