import 'package:donut_app_2a_hernandez/Utils/my_tab.dart';
import 'package:donut_app_2a_hernandez/tabs/burger_tab.dart';
import 'package:donut_app_2a_hernandez/tabs/donut_tab.dart';
import 'package:donut_app_2a_hernandez/tabs/pancakes_tab.dart';
import 'package:donut_app_2a_hernandez/tabs/pizza_tab.dart';
import 'package:donut_app_2a_hernandez/tabs/smoothie_tab.dart';
import 'package:donut_app_2a_hernandez/Pages/cart_page.dart';
import 'package:donut_app_2a_hernandez/Pages/supermarket_page.dart';
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

  List<Map<String, dynamic>> cartItems = [];

  void addToCart(String flavor, String price) {
    // Capture the flavor and price from the respective tab

    setState(() {
      cartItems.add({
        'name': flavor,
        'quantity': 1,
        'price': double.parse(price),
      });
    });
  }

  double getTotal() {
    return cartItems.fold(
        0, (total, item) => total + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    //Este widget sirve para gestionar pestañas
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // Icono de la izquierda - ahora funcional
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.grey[800],
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        // Drawer (side window)
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 218, 113, 148),
                ),
                child: Text(
                  'Menú Principal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.store,
                    color: Color.fromARGB(255, 218, 113, 148)),
                title: const Text('Supermercado'),
                onTap: () {
                  // Cerrar el drawer
                  Navigator.pop(context);
                  // Navegar a SupermarketPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuperMarketPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.home,
                    color: Color.fromARGB(255, 218, 113, 148)),
                title: const Text('Inicio'),
                onTap: () {
                  Navigator.pop(context);
                  // Ya estás en la página de inicio
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart,
                    color: Color.fromARGB(255, 218, 113, 148)),
                title: const Text('Ver Carrito'),
                onTap: () {
                  Navigator.pop(context);
                  // Navegar al carrito
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(
                        cartItems: cartItems,
                        onItemRemoved: (index) {
                          setState(() {
                            cartItems.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings,
                    color: Color.fromARGB(255, 218, 113, 148)),
                title: const Text('Configuración'),
                onTap: () {
                  Navigator.pop(context);
                  // Aquí puedes añadir navegación a configuración
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.info,
                    color: Color.fromARGB(255, 218, 113, 148)),
                title: const Text('Acerca de'),
                onTap: () {
                  Navigator.pop(context);
                  // Aquí puedes añadir navegación a información
                },
              ),
            ],
          ),
        ),
        body: Column(
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
              child: TabBarView(children: [
                DonutTab(addToCart: addToCart),
                BurgerTab(addToCart: addToCart),
                SmoothieTab(
                  addToCart: addToCart,
                ),
                PanCakesTab(
                  addToCart: addToCart,
                ),
                PizzaTab(addToCart: addToCart),
              ]),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cartItems.length} Items | \$${getTotal().toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Delivery Charges Included',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartPage(
                                  cartItems: cartItems,
                                  onItemRemoved: (index) {
                                    setState(() {
                                      cartItems.removeAt(index);
                                    });
                                  })));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 218, 113, 148),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: Text(
                      'View Cart',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
