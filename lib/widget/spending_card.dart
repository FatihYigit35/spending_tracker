import 'package:flutter/material.dart';
import 'package:spending_tracker/model/category_icons.dart';
import 'package:spending_tracker/model/spending.dart';

class SpendingCard extends StatelessWidget {
  const SpendingCard({super.key, required this.spending});

  final Spending spending;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              spending.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              spending.description,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Text(categoryIcons[spending.category].toString()),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      spending.formatedDate,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '₺${spending.amount.toStringAsFixed(2)}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
