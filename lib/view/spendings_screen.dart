import 'package:flutter/material.dart';
import 'package:spending_tracker/model/spending.dart';
import 'package:spending_tracker/view/new_spending.dart';
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
          backgroundColor: Colors.green.shade200,
        ),
        body: Column(
          children: [
            const Text("Spendings chart"),
            Expanded(
              child: mainContent,
            ),
          ],
        ));
  }
}
