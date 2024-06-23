import 'package:flutter/material.dart';
import 'package:spending_tracker/view/spendings_screen.dart';

final kColorSheme = ColorScheme.fromSeed(seedColor: Colors.green.shade200);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: kColorSheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorSheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorSheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorSheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorSheme.onSecondaryContainer,
                fontSize: 16,
              ))),
      home: const SpendingsScreen(),
    );
  }
}
