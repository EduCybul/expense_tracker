import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final  formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category {fun, fixed, transport, supermarket }

const categoryIcons = {
  Category.fun : Icons.lunch_dining,
  Category.fixed : Icons.crop_free_sharp,
  Category.transport : Icons.car_crash,
  Category.supermarket : Icons.fastfood_rounded
};



class Expense {
  Expense({
  required this.title,
  required this.amount,
  required  this.date ,
    required this.category
  }) : id = uuid.v4();

    final String title;
    final double amount;
    final String id;
    final DateTime date;
    final Category category;

    String get formattedDate{
      return formatter.format(date);
    }

}