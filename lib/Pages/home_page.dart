import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // Icono de la izquierda
        leading: Icon(
          Icons.menu,
          color: Colors.grey[800],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      body: const Column( // Agregado: 'const' está bien aquí
        children: [
          // Texto
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "I want to",
                  style: TextStyle(fontSize: 32),
                ),
                Text(
                  "Eat",
                  style: TextStyle(
                    // Tamaño de la letra
                    fontSize: 32,
                    // Negritas
                    fontWeight: FontWeight.bold,
                    // Subrayado
                    decoration: TextDecoration.underline,
                  ),
                ),
              ], // Agregado: Cierre de la lista de hijos del Row
            ), // Agregado: Cierre del Row
          ), // Agregado: Cierre del Padding
        ], // Agregado: Cierre de la lista de hijos del Column
      ), // Agregado: Cierre del Column
    ); // Agregado: Cierre del Scaffold
  }
}