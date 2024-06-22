import 'package:flutter/material.dart';
import 'package:spending_tracker/view/spendings_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.green.shade50,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green.shade200,
        ),
      ),
      home: const SpendingsScreen(),
    );
  }
}
