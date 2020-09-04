## No Context Navigation

[No Context Navigation Package - pub.dev](https://pub.dev/packages/no_context_navigation)
 
Instead of using `Navigator.of(context).pushNamed` or some other method like `pop()` or `pushReplacementNamed()` USING **context**. With this package you don't need to anymore.

This service use a GlobalKey of type NavigatorState which can be used across the entire applicaton.

Now, you only need to this:

```dart
navService.pushNamed('/detail_screen', args: 'From Home Screen');
```
But first, add the **navigationKey** to your MaterialApp's navigationKey property:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Over here
      navigatorKey: NavigationService.navigationKey,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => HomeScreen());
          case '/detail_screen':
            return MaterialPageRoute(builder: (_) => DetailScreen(message: settings.arguments));
          default:
            return null;
        }
      },
    );
  }
}
```

Use **navService object** to be able to acess those methods:
```dart
import 'package:flutter/material.dart';

final NavigationService navService = NavigationService();

class NavigationService<T, U> {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  Future<T> pushNamed(String routeName, {Object args}) async =>
      navigationKey.currentState.pushNamed<T>(
        routeName,
        arguments: args,
      );

  Future<T> push(Route<T> route) async =>
      navigationKey.currentState.push<T>(route);

  Future<T> pushReplacementNamed(String routeName, {Object args}) async =>
      navigationKey.currentState.pushReplacementNamed<T, U>(
        routeName,
        arguments: args,
      );

  Future<T> pushNamedAndRemoveUntil(
    String routeName, {
    Object args,
    bool keepPreviousPages = false,
  }) async =>
      navigationKey.currentState.pushNamedAndRemoveUntil<T>(
        routeName,
        (Route<dynamic> route) => keepPreviousPages,
        arguments: args,
      );

  Future<T> pushAndRemoveUntil(
    Route<T> route, {
    bool keepPreviousPages = false,
  }) async =>
      navigationKey.currentState.pushAndRemoveUntil<T>(
        route,
        (Route<dynamic> route) => keepPreviousPages,
      );

  Future<bool> maybePop([Object args]) async =>
      navigationKey.currentState.maybePop<bool>(args);

  bool canPop() => navigationKey.currentState.canPop();

  void goBack({T result}) => navigationKey.currentState.pop<T>(result);
}
 ```   

Hope you enjoy!
