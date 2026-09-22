import 'package:flutter/material.dart';

class EstilosApp {
  // --- COLORES ---
  static const Color colorPrincipal = Color.fromARGB(255, 255, 126, 51); // Equivalente a Colors.orange[800]
  static const Color colorFondo = Colors.white;
  static const Color colorTextoOscuro = Color(0xFF333333);
  static const Color colorTextoClaro = Colors.white;

  // --- ESTILOS DE TEXTO ---
  static const TextStyle tituloAppBar = TextStyle(
    color: colorTextoClaro,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textoBotonNav = TextStyle(
    color: colorTextoClaro,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  
  static const TextStyle tituloPrincipal = TextStyle(
    color: colorTextoOscuro,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitulo = TextStyle(
    color: Colors.grey,
    fontSize: 18,
  );
}