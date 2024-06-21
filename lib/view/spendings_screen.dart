import 'package:flutter/material.dart';
import 'package:spending_tracker/model/spending.dart';
import 'package:spending_tracker/widget/spending_list.dart';

class SpendingsScreen extends StatefulWidget {
  const SpendingsScreen({super.key});

  @override
  State<SpendingsScreen> createState() => _SpendingsScreenState();
}

class _SpendingsScreenState extends State<SpendingsScreen> {
  final List<Spending> _registeredSpendings = [
    Spending(
      title: 'Kitap',
      amount: 20.8,
      date: DateTime.now(),
      category: Category.shopping,
      description: 'Doctor Who - 11 Doktor 11 Öykü kitabu alındı',
    ),
    Spending(
      title: 'Sinema',
      amount: 30.5,
      date: DateTime.now(),
      category: Category.entertainment,
      description: 'Matrix filmine gidildi',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
          backgroundColor: Colors.green.shade200,
        ),
        body: Column(
          children: [
            const Text("Spendings chart"),
            Expanded(
              child: SpendingList(spendings: _registeredSpendings),
            ),
          ],
        ));
  }
}
