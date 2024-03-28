
import 'package:expense_tracker/models/expense.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

final  formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }

}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year-1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now );
    setState(() {
      _selectedDate = pickedDate;
    });
}
void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountController.text);
    final amountInvalid = enteredAmount == null || enteredAmount <= 0;

    if ( _titleController.text.trim().isEmpty || amountInvalid || _selectedDate==null){
          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Invalid Input'),
                content: const  Text('Please make sure you entered valid input'),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text('Okey'),
                  ),
                ],
              )
          );
    }else{

    }

}
  @override
  void dispose(){
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return  Padding(
       padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 15,
            decoration:
             const InputDecoration(
                label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\€',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     Text(_selectedDate == null
                         ? 'No Date Selected'
                         : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                  items: Category.values
                      .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase(),
                            ),
                          )
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value == null){
                        return;
                      }
                      _selectedCategory = value;
                    });
                    print(value);
                  }),

              const Spacer(),
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('CANCEL'),
              ),
              ElevatedButton(
                onPressed: (){
                  _submitExpenseData();
                  },
                child: const Text('Save Expense'),
              ),
            ],

          )
        ],
      ),

    );

  }

}

/*
ElevatedButton(
onPressed: (){print(_titleController.text);},
child: const Text('Save Expense'),
),*/