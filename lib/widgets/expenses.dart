import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart' as ex;

class Expenses extends StatefulWidget{
  Expenses ({super.key});


  @override
  State<Expenses> createState() {
    return _ExpensesState();

  }

}

class _ExpensesState extends State<Expenses> {
  final List<ex.Expense> _registeredExpenses = [
    ex.Expense(
        title : 'Flutter course',
        amount: 20.00,
        date: DateTime.now(),
        category: ex.Category.work,
    ),
    ex.Expense(
        title: 'Kamura',
        amount: 50,
        date: DateTime.now(),
        category: ex.Category.food,)
  ];
void _openAddExpenseOverlay(){
  showModalBottomSheet(
      context: context,
      builder: (ctx) =>  NewExpense());

}

  @override
  Widget build (context){
      return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Expense Tracker'),
          actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Column(
         children: [
           const Text('The chart'),
           Expanded(
             child: ExpensesList(expenses: _registeredExpenses)),
         ],
        )
      );
  }
}

