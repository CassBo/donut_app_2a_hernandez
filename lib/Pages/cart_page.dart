import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(int) onItemRemoved; // New callback function

  CartPage({Key? key, required this.cartItems, required this.onItemRemoved}) : super(key: key);


  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void addToCart(String flavor, String price) {
    setState(() {
      int index = widget.cartItems.indexWhere((item) => item['name'] == flavor);
      if (index != -1) {
        widget.cartItems[index]['quantity']++;
      } else {
        widget.cartItems.add({
          'name': flavor,
          'quantity': 1,
          'price': double.parse(price),
        });
      }
    });
  }

  void increaseQuantity(int index) {
    setState(() {
      widget.cartItems[index]['quantity']++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (widget.cartItems[index]['quantity'] > 1) {
        widget.cartItems[index]['quantity']--;
      }
    });
  }

  void removeItem(int index) { 
    widget.onItemRemoved(index); // Notify HomePage about the removal

    setState(() {
      widget.cartItems.removeAt(index);
    });
  }

  double getTotal() {
    return widget.cartItems.fold(0, (total, item) => total + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return ListTile(
                  title: Text('${item['name']} (x${item['quantity']}) - \$${item['price'].toStringAsFixed(2)}'),
                  subtitle: Text('Total: \$${(item['price'] * item['quantity']).toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => decreaseQuantity(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => removeItem(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => increaseQuantity(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Total: \$${getTotal().toStringAsFixed(2)}'),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle payment logic here
            },
            child: Text('Pay Now'),
          ),
        ],
      ),
    );
  }
}
