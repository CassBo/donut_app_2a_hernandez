import 'package:donut_app_2a_hernandez/Utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  final void Function(String, String) addToCart;

  PizzaTab({super.key, required this.addToCart});

  //Lista de donas
  final List donutsOnSale = [
    // [ donutFlavor, donutStore, donutPrice, donutColor, imageName ]
    ["Italian", "Domino's", "36", Colors.blue, "lib/images/pizza1.png"],
    ["Mushroom", "Pizza Hut", "45", Colors.red, "lib/images/pizza2.png"],
    ["Hawaiian", "Little Caesars", "84", Colors.purple, "lib/images/pizza3.png"],
    ["Pepperoni", "Papa John's", "95", Colors.brown, "lib/images/pizza4.png"],
    ["Seafood", "California Pizza Kitchen", "50", Colors.yellow, "lib/images/pizza5.png"],
    ["Vegetarian", "Marco's Pizza", "70", Colors.indigo, "lib/images/pizza6.png"],
    ["Margherita", "Sbarro", "65", Colors.green, "lib/images/pizza7.png"],
    ["Three cheeses", "Chuck E. Cheese", "80", Colors.orange, "lib/images/pizza8.png"],
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
          addToCart: addToCart


        );
      },//Contexto y donde está
    );
  }
}
