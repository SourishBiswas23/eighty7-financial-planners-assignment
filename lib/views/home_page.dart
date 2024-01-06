import 'package:eighty_seven_financial_planners_assignment/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> jokeCategories = [
    'Any',
    'Misc',
    'Programming',
    'Pun',
    'Spooky',
    'Christmas'
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Joke Categories',
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: AppTheme.headingBig,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppTheme.backgroundColor,
      body: ListView.builder(
          itemCount: jokeCategories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: null,
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    jokeCategories[index],
                    style: const TextStyle(
                      fontSize: AppTheme.bodyBig,
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
