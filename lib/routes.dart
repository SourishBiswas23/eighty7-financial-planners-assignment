import 'package:flutter/material.dart';

import 'views/home_page.dart';
import 'views/not_found_page.dart';
import 'views/splash_screen.dart';

enum AppRoutes { splashScreen, homePage, notFound }

class _Paths {
  static const String splashScreen = '/splashScreen';
  static const String homePage = '/homePage';
  static const String notFoundPage = '/notFound';

  static const Map<AppRoutes, String> _pathMap = {
    AppRoutes.homePage: _Paths.homePage,
    AppRoutes.splashScreen: _Paths.splashScreen,
    AppRoutes.notFound: _Paths.notFoundPage,
  };

  static String of(AppRoutes route) => _pathMap[route] ?? notFoundPage;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case _Paths.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case _Paths.notFoundPage:
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
    }
  }

  static Future? push({required AppRoutes route}) {
    return navigatorKey.currentState?.pushNamed(_Paths.of(route));
  }

  static Future? pushReplace({
    required AppRoutes route,
    Map<String, dynamic>? arguments,
  }) {
    return navigatorKey.currentState?.pushReplacementNamed(
      _Paths.of(route),
      arguments: arguments,
    );
  }

  static void pop() {
    return navigatorKey.currentState?.pop();
  }
}
