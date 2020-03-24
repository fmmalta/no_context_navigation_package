import 'package:flutter/cupertino.dart';

final NavigationService navService = NavigationService();

class NavigationService<T, U> {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  Future<T> pushNamed(String routeName, {Object args}) async {
    return await navigationKey.currentState.pushNamed<T>(
      routeName,
      arguments: args,
    );
  }

  Future<T> push(Route<T> route) async {
    return await navigationKey.currentState.push<T>(route);
  }

  Future<T> pushReplacementNamed(String routeName, {Object args}) async {
    return await navigationKey.currentState.pushReplacementNamed<T, U>(
      routeName,
      arguments: args,
    );
  }

  Future<T> pushNamedAndRemoveUntil(String routeName, {Object args}) async {
    return await navigationKey.currentState.pushNamedAndRemoveUntil<T>(
      routeName,
      (Route<dynamic> route) => false,
      arguments: args,
    );
  }

  Future<bool> maybePop([Object args]) async {
    return await navigationKey.currentState.maybePop<bool>(args);
  }

  bool canPop() => navigationKey.currentState.canPop();

  bool goBack({T result}) => navigationKey.currentState.pop<T>(result);
}
