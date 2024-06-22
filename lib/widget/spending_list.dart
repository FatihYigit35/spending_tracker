import 'package:flutter/material.dart';
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
