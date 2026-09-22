import 'package:flutter/material.dart';
import 'screens/landing_screen.dart';

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
      home: const LandingScreen(), // Le decimos que arranque en la LandingScreen
    );
  }
}