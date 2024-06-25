import 'package:flutter/material.dart';
import 'package:spending_tracker/chart/chart_bar.dart';
import 'package:spending_tracker/model/category.dart';
import 'package:spending_tracker/model/category_icons.dart';
import 'package:spending_tracker/model/spending.dart';
import 'package:spending_tracker/model/spending_bucket.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.spendings});

  final List<Spending> spendings;

  List<SpendingBucket> get buckets {
    return [
      SpendingBucket.forCategory(spendings, Category.food),
      SpendingBucket.forCategory(spendings, Category.entertainment),
      SpendingBucket.forCategory(spendings, Category.shopping),
      SpendingBucket.forCategory(spendings, Category.transport),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalSpendings > maxTotalExpense) {
        maxTotalExpense = bucket.totalSpendings;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  ChartBar(
                    fill: bucket.totalSpendings == 0
                        ? 0
                        : bucket.totalSpendings / maxTotalExpense,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        categoryIcons[bucket.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
