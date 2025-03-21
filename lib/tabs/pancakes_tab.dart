import 'package:donut_app_2a_hernandez/Utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PanCakesTab extends StatelessWidget {
  final void Function(String, String) addToCart;

   PanCakesTab({super.key , required this.addToCart});

  //Lista de donas
  final List donutsOnSale = [
    ["Spongy pancakes", "IHOP", "36", Colors.blue, "lib/images/pancakes3.png"],
    ["Pancakes fillers", "Denny's", "45", Colors.red, "lib/images/pancakes6.png"],
    ["Japanese spongy pancakes", "The Pancake House", "84", Colors.purple, "lib/images/pancakes2.png"],
    ["Choco pancakes", "Waffle House", "95", Colors.brown, "lib/images/pancakes1.png"],
    ["Oat pancakes", "Perkins", "50", Colors.yellow, "lib/images/pancakes4.png"],
    ["Strawberry pancakes", "Village Inn", "70", Colors.indigo, "lib/images/pancakes5.png"],
    ["Hotcakes light", "Cracker Barrel", "65", Colors.green, "lib/images/pancakes7.png"],
    ["Berry pancakes", "Bob Evans", "80", Colors.blue, "lib/images/pancakes8.png"],
  ];//final es como la decisión final, no va a cambiar

  @override
  Widget build(BuildContext context) {
  
    return GridView.builder(
      //Cuántos elementos tiene
      itemCount: donutsOnSale.length,
      padding: const EdgeInsets.all(12),
      //Encargado de organizar la cuadrícula
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //Relación de aspecto
        childAspectRatio: 1 / 1.5,
      //Determinar número de columnas
          crossAxisCount: 2),
      itemBuilder: (context,index){
      //Elemento individual de la cuadrícula
        return DonutTile(
          donutFlavor : donutsOnSale [index][0],
          donutStore : donutsOnSale [index][1],
          donutPrice : donutsOnSale [index][2],
          donutColor : donutsOnSale [index][3],
          imageName : donutsOnSale [index][4],
          addToCart: addToCart,
  


        );
      },//Contexto y donde está
    );
  }
}
