import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart' as ex;

import '../models/expense.dart';

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
        category: ex.Category.fixed,
    ),
    ex.Expense(
        title: 'Kamura',
        amount: 50,
        date: DateTime.now(),
        category: ex.Category.fun,)
  ];
void _openAddExpenseOverlay(){
  showModalBottomSheet(
    isScrollControlled: true,
      context: context,
      builder: (ctx) =>  NewExpense(onAddExpense: _addExpense));

}

void _addExpense(ex.Expense expense){
  setState(() {
    _registeredExpenses.add(expense);
  });

}
void _removeExpense (ex.Expense expense){
  final  expenseIndex = _registeredExpenses.indexOf(expense);
  setState(() {
    _registeredExpenses.remove(expense);
  });
  ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        action: SnackBarAction(
            label: 'Undo',
            onPressed: (){
               setState(() {
               _registeredExpenses.insert(expenseIndex, expense);
          });
        },
        ),
        duration: Duration(seconds: 2),
          content: Text('Expense deleted') ),
  );

}


  @override
  Widget build (context){
      Widget mainContent = const Center(
        child: Text('No expenses found!'),

      );
      if(_registeredExpenses.isNotEmpty){
        mainContent = ExpensesList(expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
      }


      return  Scaffold(
        appBar: AppBar(

          title: const Text('Expense Tracker'),
          actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
            color: Colors.red,
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red.shade200),),
            ),
          ],
        ),
        body: Column(
         children: [
           const Text('The chart'),
           Expanded(
             child: mainContent,)
         ],
        )
      );
  }
}

