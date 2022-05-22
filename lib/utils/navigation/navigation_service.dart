import 'package:flutter/material.dart';

abstract class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Future<T?> navigateToPage<T>({required String path, Object? data});
  Future<T?> navigateAndRemoveUntil<T>({required String path, Object? data});
  Future<T?> pushAndReplacement<T>({required String path, Object? data});
  void navigateToRoot();
}
