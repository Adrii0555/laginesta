import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carta - Bar La Ginesta', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange[800], // Un color cálido típico de restauración
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: mockProducts.length,
        itemBuilder: (context, index) {
          final product = mockProducts[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              title: Text(
                product.name, 
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(product.description),
              ),
              trailing: Text(
                // CAMBIO 1: Ahora usamos basePrice en lugar de price
                '${product.basePrice.toStringAsFixed(2)} €', 
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)
              ),
              onTap: () {
                // CAMBIO 2: Usamos Navigator para ir a la pantalla de detalle
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[800],
        onPressed: () {
          // Futuro botón para ir al carrito
        },
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
    );
  }
}