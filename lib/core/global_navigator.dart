import 'package:flutter/material.dart';

class GlobalNavigator {
  final GlobalKey<NavigatorState> _navigatorKey;

  NavigatorState? get navigator => _navigatorKey.currentState;

  GlobalNavigator({
    required GlobalKey<NavigatorState> navigatorKey,
  }) : _navigatorKey = navigatorKey;

  Future<T?>? popAndPushNamed<T extends Object, TO extends Object>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _navigatorKey.currentState?.popAndPushNamed(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  Future<T?>?  pushAndRemoveUntil<T extends Object>(
    Route<T> newRoute,
    RoutePredicate predicate,
  ) {
    return _navigatorKey.currentState?.pushAndRemoveUntil(
      newRoute,
      predicate,
    );
  }

  Future<T?>?  pushNamedAndRemoveUntil<T extends Object>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return _navigatorKey.currentState?.pushNamedAndRemoveUntil(
      newRouteName,
      (route) => false,
      arguments: arguments,
    );
  }

  Future<T?>? pushNamed<T extends Object>(
    String routeName, {
    Object? arguments,
  }) {
    return _navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<bool>? maybePop<T extends Object>([T? result]) {
    return _navigatorKey.currentState?.maybePop(result);
  }

  void pop<T extends Object>([T? result]) {
    return _navigatorKey.currentState?.pop(result);
  }

  Future<T?>? push<T extends Object>(Route<T> route) {
    return _navigatorKey.currentState?.push(route);
  }

  Future<T?>? pushReplacement<T extends Object, TO extends Object>(
    Route<T> newRoute, {
    TO? result,
  }) {
    return _navigatorKey.currentState?.pushReplacement<T, TO>(
      newRoute,
      result: result,
    );
  }
}
