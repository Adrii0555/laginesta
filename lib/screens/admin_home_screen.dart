import 'package:flutter/material.dart';
import '../estilos/estilos_app.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  // Misma función de alerta que en el home_screen
  Future<bool?> _mostrarAlertaCerrarSesion(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Cerrar sesión?'),
          content: const Text('¿Estás seguro de que quieres salir del panel de administrador?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: EstilosApp.colorPrincipal,
              ),
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Salir', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, 
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        
        final bool? confirmar = await _mostrarAlertaCerrarSesion(context);
        if (confirmar == true && context.mounted) {
          Navigator.of(context).pop(); // Cierra sesión y vuelve al Login
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Panel de Administración', style: EstilosApp.tituloAppBar),
          backgroundColor: EstilosApp.colorPrincipal,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.admin_panel_settings, size: 120, color: Colors.grey),
              const SizedBox(height: 24),
              const Text(
                '¡Hola, Jefe!',
                style: EstilosApp.tituloPrincipal,
              ),
              const SizedBox(height: 16),
              const Text(
                'Aquí podrás gestionar los productos\ny ver los pedidos entrantes.',
                style: EstilosApp.subtitulo,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              
              // Un botón de relleno para que se vea algo de interacción
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: EstilosApp.colorPrincipal,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Función "Añadir Producto" en construcción 🚧')),
                  );
                },
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  'Añadir nuevo producto',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}