import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Importamos la pantalla principal

void main() {
  runApp(const LaGinestaApp());
}

class LaGinestaApp extends StatelessWidget {
  const LaGinestaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App La Ginesta',
      debugShowCheckedModeBanner: false, // Quita la etiqueta roja de "DEBUG"
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true, // Usa el diseño más moderno de Android/Google
      ),
      home: const HomeScreen(), // Le decimos que arranque en la HomeScreen
    );
  }
}