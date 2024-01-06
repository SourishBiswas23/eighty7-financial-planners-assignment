import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer timer;

  @override
  void initState() {
    timer = Timer(
      const Duration(seconds: 3),
      () {
        AppNavigator.pushReplace(route: AppRoutes.homePage);
      },
    );
    super.initState();
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200, maxHeight: 200),
            child: Lottie.asset('assets/smile.json'),
          ),
        ),
      ),
    );
  }
}
