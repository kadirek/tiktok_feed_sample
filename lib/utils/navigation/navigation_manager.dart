import 'package:flutter/material.dart';

import 'navigation_service.dart';

class NavigationManager extends NavigationService {
  @override
  Future<T?> navigateToPage<T>({required String path, Object? data}) async {
    return await navigatorKey.currentState?.pushNamed(path, arguments: data);
  }

  @override
  Future<T?> navigateAndRemoveUntil<T>({required String path, Object? data}) async {
    return await navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(path, (Route<dynamic> route) => false, arguments: data);
  }

  @override
  Future<T?> pushAndReplacement<T>({required String path, Object? data}) async {
    return await navigatorKey.currentState?.pushReplacementNamed(path, arguments: data);
  }

  @override
  void navigateToRoot() {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }
}
