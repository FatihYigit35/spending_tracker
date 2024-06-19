import 'package:flutter/material.dart';

class SpendingsScreen extends StatefulWidget {
  const SpendingsScreen({super.key});

  @override
  State<SpendingsScreen> createState() => _SpendingsScreenState();
}

class _SpendingsScreenState extends State<SpendingsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        Text("Spendings chart"),
        Text("Spendings list"),
      ],
    ));
  }
}
