import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/cupertino.dart';
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


  @override
  Widget build (context){
      return  Scaffold(
        body: Column(
         children: [
           Text('The chart'),
           Expanded(
             child: ExpensesList(expenses: _registeredExpenses)),
         ],
        )
      );
  }
}

