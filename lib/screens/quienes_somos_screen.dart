import 'package:flutter/material.dart';
import '../estilos/estilos_app.dart';

class QuienesSomosScreen extends StatelessWidget {
  const QuienesSomosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EstilosApp.colorFondo,
      appBar: AppBar(
        title: const Text('Quiénes somos', style: EstilosApp.tituloAppBar),
        backgroundColor: EstilosApp.colorPrincipal,
        iconTheme: const IconThemeData(color: EstilosApp.colorTextoClaro),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Sobre nosotros',
              style: EstilosApp.tituloPrincipal,
            ),
            SizedBox(height: 16),
            Text(
              'En Bar La Ginesta nos dedicamos a ofrecer la mejor experiencia gastronómica a nuestros clientes. '
              'Nuestro equipo está comprometido con la calidad y el servicio, asegurando que cada visita sea memorable.',
              style: EstilosApp.subtitulo,
            ),
          ],
        ),
      ),
    );
  }
}