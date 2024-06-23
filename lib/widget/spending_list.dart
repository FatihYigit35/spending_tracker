import 'package:flutter/material.dart';
import 'package:spending_tracker/main.dart';
import 'package:spending_tracker/model/spending.dart';
import 'package:spending_tracker/widget/spending_card.dart';

class SpendingList extends StatelessWidget {
  const SpendingList({
    super.key,
    required this.spendings,
    required this.onDeleteSpending,
  });

  final List<Spending> spendings;
  final void Function(Spending spending) onDeleteSpending;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: spendings.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red,
          ),
          margin: kCardMargin,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Row(
            children: [
              Icon(Icons.delete),
              Spacer(),
              Icon(Icons.delete),
            ],
          ),
        ),
        key: ValueKey(spendings[index]),
        onDismissed: (direction) {
          onDeleteSpending(spendings[index]);
        },
        child: SpendingCard(
          spending: spendings[index],
        ),
      ),
    );
  }
}
