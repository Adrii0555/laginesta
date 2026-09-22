import 'package:flutter/material.dart';
import '../models/product.dart';
import '../estilos/estilos_app.dart'; //
import 'product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Función que crea y muestra la ventanita de alerta
  Future<bool?> _mostrarAlertaCerrarSesion(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Cerrar sesión?'),
          content: const Text('¿Estás seguro de que quieres salir y volver al inicio?'),
          actions: [
            // Botón de Cancelar
            TextButton(
              onPressed: () => Navigator.of(context).pop(false), // Devuelve 'false'
              child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
            ),
            // Botón de Confirmar
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: EstilosApp.colorPrincipal, // Usamos tu color corporativo
              ),
              onPressed: () => Navigator.of(context).pop(true), // Devuelve 'true'
              child: const Text('Cerrar sesión', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // PopScope envuelve a toda la pantalla para interceptar el botón de "Atrás"
    return PopScope(
      canPop: false, // Bloquea la acción automática de volver atrás
      onPopInvoked: (bool didPop) async {
        if (didPop) return; // Si la pantalla ya se cerró, no hacemos nada
        
        // Esperamos a ver qué botón pulsa el usuario en la alerta
        final bool? confirmar = await _mostrarAlertaCerrarSesion(context);
        
        // Si pulsó "Cerrar sesión" (true), entonces sí le dejamos salir
        if (confirmar == true && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          // Usamos tus estilos para el texto y el fondo
          title: const Text('Carta - Bar La Ginesta', style: EstilosApp.tituloAppBar),
          backgroundColor: EstilosApp.colorPrincipal, 
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white), // Flecha de volver blanca
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
                  '${product.basePrice.toStringAsFixed(2)} €', 
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)
                ),
                onTap: () {
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
          backgroundColor: EstilosApp.colorPrincipal, // Usamos tu color
          onPressed: () {
            // Futuro botón para ir al carrito
          },
          child: const Icon(Icons.shopping_cart, color: Colors.white),
        ),
      ),
    );
  }
}