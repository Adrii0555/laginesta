import 'package:flutter/material.dart';

class AppColors {
  // Paleta de colores global
  static const Color primary = Color(0xFF2E7D32); // Verde tipo La Ginesta
  static const Color secondary = Color(0xFFFFA000);
  static const Color background = Color(0xFFF5F5F5);
  static const Color textDark = Color(0xFF212121);
}

class AppTextStyles {
  // Estilos de texto reutilizables
  static const TextStyle title = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16.0,
    color: AppColors.textDark,
  );
}

class AppTheme {
  // Tema global de la aplicación
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}