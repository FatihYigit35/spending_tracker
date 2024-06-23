import 'package:flutter/material.dart';
import 'package:spending_tracker/model/category.dart';
import 'package:spending_tracker/model/spending.dart';

class NewSpending extends StatefulWidget {
  const NewSpending({super.key, required this.onAddSpending});

  final void Function(Spending spending) onAddSpending;

  @override
  State<NewSpending> createState() => _NewSpendingState();
}

class _NewSpendingState extends State<NewSpending> {
  var dateNow = DateTime.now();
  var _selectedDate = '';
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  var _selectedCategory = Category.shopping;

  @override
  void initState() {
    super.initState();
    _selectedDate = '${dateNow.day}/${dateNow.month}/${dateNow.year}';
  }

  @override
  void dispose() {
    //It must always be added to the TextEditingController so that it is deleted from memory when the screen is closed.
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _openDatePicker() async {
    final firstDate = DateTime(
      dateNow.year - 1,
      dateNow.month,
      dateNow.day,
    );
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: dateNow,
    );

    setState(() {
      if (pickedDate != null) {
        _selectedDate =
            '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';

        dateNow = pickedDate;
      }
    });
  }

  void _submitSpendingData() {
    final enteredAmount = double.tryParse(_amountController.text);

    if (enteredAmount == null || enteredAmount <= 0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
          title: const Text('Missing Value!'),
          content: const Text('Please enter amount.'),
        ),
      );
      return;
    }

    if (_titleController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
          title: const Text('Missing Value!'),
          content: const Text('Please enter title.'),
        ),
      );
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredDescription = _descriptionController.text;
    final enteredDate = dateNow;

    final newSpending = Spending(
      amount: enteredAmount,
      title: enteredTitle,
      description: enteredDescription,
      date: enteredDate,
      category: _selectedCategory,
    );

    widget.onAddSpending(newSpending);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
            keyboardType: TextInputType.text,
          ),
          TextField(
            controller: _descriptionController,
            maxLength: 100,
            decoration: const InputDecoration(
              label: Text('Description'),
            ),
            keyboardType: TextInputType.text,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    prefixText: '₺',
                    label: Text('Amount'),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_selectedDate),
                        IconButton(
                          onPressed: _openDatePicker,
                          icon: const Icon(Icons.calendar_month),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    }
                  }),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
              ElevatedButton(
                onPressed: _submitSpendingData,
                child: const Text('Save'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
