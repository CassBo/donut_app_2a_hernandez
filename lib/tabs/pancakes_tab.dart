import 'package:donut_app_2a_hernandez/Utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PanCakesTab extends StatelessWidget {
  final void Function(String, String) addToCart;

   PanCakesTab({super.key , required this.addToCart});

  //Lista de donas
  final List donutsOnSale = [
    // [ donutFlavor, donutStore, donutPrice, donutColor, imageName ]
   ["Ice Cream","Krispy Kream", "36", Colors.blue, "lib/images/icecream_donut.png"],
   ["Strawberry","Dunkin Donuts", "45", Colors.red, "lib/images/strawberry_donut.png"],
   ["Grape Ape","Krispy Kream", "84", Colors.purple, "lib/images/grape_donut.png"],
   ["Choco","Dunkin Donuts", "95", Colors.brown, "lib/images/chocolate_donut.png"],
   ["Ice Cream","Krispy Kream", "36", Colors.yellow, "lib/images/icecream_donut.png"],
   ["Strawberry","Dunkin Donuts", "45", Colors.pink, "lib/images/strawberry_donut.png"],
   ["Grape Ape","Krispy Kream", "84", Colors.green, "lib/images/grape_donut.png"],
   ["Choco","Dunkin Donuts", "95", Colors.blueGrey, "lib/images/chocolate_donut.png"],
  ]; //final es como la decisión final, no va a cambiar

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
