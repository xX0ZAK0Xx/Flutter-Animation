import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            width: isExpanded ? 250 : 80.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: isExpanded ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(isExpanded ? 30.0 : 10),
            ),
            duration: const Duration(milliseconds: 500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    isExpanded ? Icons.add_shopping_cart : Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
                if (isExpanded)
                  Expanded(
                      flex: 3,
                      child: Text(
                        "Added to the Cart",
                        style: const TextStyle(fontSize: 20),
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
