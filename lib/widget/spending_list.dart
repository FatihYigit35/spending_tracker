import 'package:flutter/material.dart';
import 'package:spending_tracker/model/spending.dart';
import 'package:spending_tracker/widget/spending_card.dart';

class SpendingList extends StatelessWidget {
  const SpendingList({super.key, required this.spendings});

  final List<Spending> spendings;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: spendings.length,
      itemBuilder: (context, index) => SpendingCard(
        spending: spendings[index],
      ),
    );
  }
}
