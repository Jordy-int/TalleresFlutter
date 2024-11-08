import "package:flutter/material.dart";

// Acceso directo styles y tabulador
class Contador extends StatefulWidget {
  // Widget con estado
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState(); // Creación del estado
}

class _ContadorState extends State<Contador> {
  // Extiende de la clase state
  int clickCounter = 0; // Contador de clicks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de Pantalla'),
      ), // AppBar

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter',
                style: const TextStyle(
                    fontSize: 160, fontWeight: FontWeight.w100)),
            Text("Click${clickCounter == 1 ? "" : "s"}",
                style: const TextStyle(fontSize: 25))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            clickCounter = clickCounter + 1;
          });
        },
      ),
    );
  }
}
