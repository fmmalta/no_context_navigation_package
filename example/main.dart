import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

import 'src/detail_screen/detail_screen.dart';
import 'src/home_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigationKey,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => HomeScreen());
          case '/detail_screen':
            return MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(message: settings.arguments as String?));
          default:
            return null;
        }
      },
    );
  }
}
