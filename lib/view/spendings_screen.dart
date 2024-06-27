import 'package:flutter/material.dart';

import '../model/category.dart';
import '../model/spending.dart';
import '../view/new_spending.dart';
import '../widget/spending_list.dart';
import '../chart/chart.dart';

class SpendingsScreen extends StatefulWidget {
  const SpendingsScreen({super.key});

  @override
  State<SpendingsScreen> createState() => _SpendingsScreenState();
}

class _SpendingsScreenState extends State<SpendingsScreen> {
  final List<Spending> _registeredSpendings = [
    Spending(
      title: 'New book',
      amount: 20.8,
      date: DateTime.now(),
      category: Category.shopping,
      description: 'Doctor Who - 11 Doctors 11 Stories book purchased',
    ),
    Spending(
      title: 'New movie in cinema',
      amount: 30.5,
      date: DateTime.now(),
      category: Category.entertainment,
      description: 'I went to the movie Inside Out 2 with my son.',
    ),
  ];

  void _addSpending(Spending spending) {
    setState(() {
      _registeredSpendings.add(spending);
    });
  }

  void _deleteSpending(Spending spending) {
    final index = _registeredSpendings.indexOf(spending);

    setState(() {
      _registeredSpendings.remove(spending);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Spending deleted.'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredSpendings.insert(index, spending);
              });
            }),
      ),
    );
  }

  void _openExpenseAddingScreen() {
    showModalBottomSheet(
      context: context,
      builder: (context) => NewSpending(
        onAddSpending: _addSpending,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text('No spending, add new spending.'),
    );

    if (_registeredSpendings.isNotEmpty) {
      mainContent = SpendingList(
        spendings: _registeredSpendings,
        onDeleteSpending: _deleteSpending,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spending Tracker'),
        actions: [
          IconButton(
            onPressed: _openExpenseAddingScreen,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(spendings: _registeredSpendings),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(
                    spendings: _registeredSpendings,
                  ),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
