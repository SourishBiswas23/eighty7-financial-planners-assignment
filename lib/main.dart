import 'package:eighty_seven_financial_planners_assignment/routes.dart';
import 'package:eighty_seven_financial_planners_assignment/views/joke_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eighy7 financial planners assignment',
      home: const JokeScreen(),
      onGenerateRoute: AppNavigator.onGenerateRoute,
      scaffoldMessengerKey: AppNavigator.scaffoldMessengerKey,
      navigatorKey: AppNavigator.navigatorKey,
    );
  }
}
