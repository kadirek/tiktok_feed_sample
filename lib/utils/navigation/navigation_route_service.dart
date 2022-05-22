import 'package:flutter/material.dart';

abstract class NavigationRouteService {
  Route<dynamic> generateRoute(RouteSettings settings);
}
