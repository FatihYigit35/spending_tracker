import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Spendings {
  Spendings({
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final String description;
  final double amount;
  final DateTime date;
  final Category category;
}

enum Category {
  food,
  shopping,
  entertainment,
  transport,
}
