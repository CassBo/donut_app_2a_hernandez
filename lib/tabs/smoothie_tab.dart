import 'package:donut_app_2a_hernandez/Utils/donut_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  final void Function(String, String) addToCart;

  SmoothieTab({super.key, required this.addToCart});

  //Lista de donas
  final List donutsOnSale = [
    // [ donutFlavor, donutStore, donutPrice, donutColor, imageName ]
    ["Mango Tango", "Jamba Juice", "36", Colors.blue, "lib/images/smoothie4.png"],
    ["Strawberry Banana", "Smoothie King", "45", Colors.red, "lib/images/smoothie3.png"],
    ["Grape Delight", "Tropical Smoothie Cafe", "84", Colors.purple, "lib/images/smoothie7.png"],
    ["Choco Bliss", "Booster Juice", "95", Colors.brown, "lib/images/smoothie8.png"],
    ["Vanilla Berry", "Planet Smoothie", "50", Colors.yellow, "lib/images/smoothie2.png"],
    ["Blueberry Burst", "Nekter Juice Bar", "70", Colors.indigo, "lib/images/smoothie1.png"],
    ["Matcha Green", "Pressed Juicery", "65", Colors.green, "lib/images/smoothie5.png"],
    ["Caramel Coffee", "Juice It Up!", "80", Colors.orange, "lib/images/smoothie6.png"],

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
