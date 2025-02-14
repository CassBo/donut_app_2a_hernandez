import 'package:donut_app_2a_hernandez/Utils/my_tab.dart';
import 'package:donut_app_2a_hernandez/tabs/burger_tab.dart';
import 'package:donut_app_2a_hernandez/tabs/donut_tab.dart';
import 'package:donut_app_2a_hernandez/tabs/pancakes_tab.dart';
import 'package:donut_app_2a_hernandez/tabs/pizza_tab.dart';
import 'package:donut_app_2a_hernandez/tabs/smoothie_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List<Widget> myTabs = [
//Donut Tab
MyTab(iconPath: 'lib/icons/donut.png'),
//Burger Tab
MyTab(iconPath: 'lib/icons/burger.png'),
//Smoothie Tab
MyTab(iconPath: 'lib/icons/smoothie.png'),
//Pancake Tab
MyTab(iconPath: 'lib/icons/pancakes.png'),
//Pizza Tab
MyTab(iconPath: 'lib/icons/pizza.png'),
];

  @override
  Widget build(BuildContext context) {
    //Este widget sirve para gestionar pestañas
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
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
        body:  Column( // Agregado: 'const' está bien aquí
          children: [
            // Texto
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Row(
                children: [
                  Text(
                    "I want to ",
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
                ],
              ),
            ),
            TabBar(tabs: myTabs),
            //Tab bar view
            Expanded(
              child: TabBarView(children:[
                DonutTab(),
                BurgerTab(),
                SmoothieTab(),
                PanCakesTab(),
                PizzaTab(),
              ]) ,
            ),
          ],
        ), // Agregado: Cierre del Column
      ),
    ); // Agregado: Cierre del Scaffold
  }
}