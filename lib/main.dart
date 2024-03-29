import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.redAccent);

var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(
    100, 133, 30, 30));

void main  (){
  runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
             style: ElevatedButton.styleFrom(
               backgroundColor: kDarkColorScheme.primaryContainer,
             )

          )
        ),
        theme: ThemeData().copyWith(
          colorScheme:kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
            titleTextStyle: const TextStyle(color: Colors.black),
          )
        ),
        themeMode: ThemeMode.system,
        //darkTheme: ThemeData.dark(),
        home: Expenses()
      )
  );

}