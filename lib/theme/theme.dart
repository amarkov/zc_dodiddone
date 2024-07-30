import 'package:flutter/material.dart';

class DoDidDoneTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF9479EF), // Основной цвет #9479EF
      brightness: Brightness.light,
      primary: const Color(0xFF9479EF), // Основной цвет #9479EF
      secondary: const Color(0xFF91EB8F), // Второй цвет #91EB8F
    ),
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          const Color(0xFF9479EF), // Основной цвет #9479EF
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(color: Colors.white), // Текст кнопок белый
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: const Color(0xFF9f7bf6), // Цвет выбранной иконки
      unselectedItemColor:
          const Color(0xFF4ceb8b).withOpacity(0.8), // Цвет невыбранной иконки
      backgroundColor: Colors.transparent, // Прозрачный фон
      // Убираем тень
    ),
  );

  
}
