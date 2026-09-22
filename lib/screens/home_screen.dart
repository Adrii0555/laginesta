import 'package:flutter/material.dart';
import '../models/product.dart'; // Importamos nuestros datos de prueba

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
                '${product.price.toStringAsFixed(2)} €', 
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)
              ),
              onTap: () {
                // De momento solo mostramos un mensajito al tocar el producto.
                // Más adelante, esto abrirá la pantalla para elegir el pan o los ingredientes.
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Has seleccionado: ${product.name}')),
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