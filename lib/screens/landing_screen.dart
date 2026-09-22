import 'package:flutter/material.dart';
import '../estilos/estilos_app.dart';
import 'login_screen.dart'; // Importamos la pantalla que tú has hecho

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EstilosApp.colorFondo,
      // --- BARRA SUPERIOR (NAVBAR) ---
      appBar: AppBar(
        backgroundColor: EstilosApp.colorPrincipal,
        title: const Text('La Ginesta', style: EstilosApp.tituloAppBar),
        actions: [
          // Botón Quiénes Somos (Sin lógica aún)
          TextButton(
            onPressed: () {}, 
            child: const Text('Quiénes somos', style: EstilosApp.textoBotonNav),
          ),
          const SizedBox(width: 8),
          
          // Botón Contacto (Sin lógica aún)
          TextButton(
            onPressed: () {}, 
            child: const Text('Contacto', style: EstilosApp.textoBotonNav),
          ),
          const SizedBox(width: 16),
          
          // Botón Iniciar Sesión destacado
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Fondo blanco para destacar sobre el naranja
              foregroundColor: EstilosApp.colorPrincipal, // Texto naranja
              elevation: 0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text('Iniciar sesión', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 16), // Margen derecho
        ],
      ),
      
      // --- CONTENIDO CENTRAL ---
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.restaurant_menu, size: 120, color: EstilosApp.colorPrincipal),
            const SizedBox(height: 24),
            const Text(
              'Bienvenido a Bar La Ginesta',
              style: EstilosApp.tituloPrincipal,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Haz tu pedido online y recógelo sin esperas.',
              style: EstilosApp.subtitulo,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}