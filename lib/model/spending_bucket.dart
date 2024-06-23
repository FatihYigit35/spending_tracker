import 'package:spending_tracker/model/category.dart';
import 'package:spending_tracker/model/spending.dart';

class SpendingBucket {
  SpendingBucket({required this.category, required this.spendings});
  SpendingBucket.forCategory(List<Spending> allSpendings, this.category)
      : spendings = allSpendings
            .where((spending) => spending.category == category)
            .toList();

  final Category category;
  final List<Spending> spendings;

  double get totalSpendings {
    double total = 0;

    for (var spending in spendings) {
      total += spending.amount;
    }

    return total;
  }
}
