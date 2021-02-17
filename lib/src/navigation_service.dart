import 'package:flutter/cupertino.dart';

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
    bool Function(Route<dynamic>) predicate,
  }) async =>
      navigationKey.currentState.pushNamedAndRemoveUntil<T>(
        routeName,
        predicate ?? (_) => false,
        arguments: args,
      );

  Future<T> pushAndRemoveUntil(
    Route<T> route, {
    bool Function(Route<dynamic>) predicate,
  }) async =>
      navigationKey.currentState.pushAndRemoveUntil<T>(
        route,
        predicate ?? (_) => false,
      );

  Future<bool> maybePop([Object args]) async =>
      navigationKey.currentState.maybePop<bool>(args);

  bool canPop() => navigationKey.currentState.canPop();

  void goBack({T result}) => navigationKey.currentState.pop<T>(result);

  void popUntil(String route) {
    navigationKey.currentState.popUntil(ModalRoute.withName(route));
  }

  RouteSettings pageSettings(BuildContext context) =>
      ModalRoute.of<RouteSettings>(context).settings;
}
