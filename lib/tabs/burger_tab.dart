import 'package:donut_app_2a_hernandez/Utils/donut_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  final void Function(String, String) addToCart;

  BurgerTab({super.key, required this.addToCart});
  //Lista de donas
  final List donutsOnSale = [
    // [ donutFlavor, donutStore, donutPrice, donutColor, imageName ]
   ["Whopper Doble","Burger King", "36", Colors.blue, "lib/images/burger1.png"],
   ["Route 66","Jhonny Rockets", "45", Colors.red, "lib/images/burger2.png"],
   ["Quarter","Mc Donalds", "84", Colors.purple, "lib/images/burger3.png"],
   ["Western Bacon","Carl's Jr.", "95", Colors.brown, "lib/images/burger4.png"],
   ["Baconator","Wendy's", "36", Colors.yellow, "lib/images/burger5.png"],
   ["Monster 880","Sixtie's", "45", Colors.pink, "lib/images/burger6.png"],
   ["Crispy Onion","Mítica", "84", Colors.green, "lib/images/burger7.png"],
   ["Honey Burger","KFC", "95", Colors.blueGrey, "lib/images/burger8.png"],
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
          addToCart: addToCart, // Directly use the addToCart function passed from HomePage




        );
      },//Contexto y donde está
    );
  }
}
