import 'package:flutter/material.dart';

import '../../module/view/home/view/home.dart';
import '../../module/view/home/viewmodel/home_viewmodel.dart';
import '../../module/view/splash/view/splash.dart';
import 'navigation_enum.dart';
import 'navigation_route_service.dart';

class NavigationRouteManager implements NavigationRouteService {
  @override
  Route generateRoute(RouteSettings settings) {
    var navigation = _getNavigationPage(settings.name ?? NavigationPages.initial.toString());

    switch (navigation) {
      case NavigationPages.initial:
      case NavigationPages.splash:
        return _normalNavigate(const Splash());

      case NavigationPages.home:
        return _normalNavigate(Home(viewModel: HomeViewModel()));

      default:
        return _normalNavigate(const Splash());
    }
  }

  MaterialPageRoute _normalNavigate(Widget widget, {RouteSettings? settings, bool isFullScreen = false}) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings, fullscreenDialog: isFullScreen);
  }

  NavigationPages? _getNavigationPage(String name) {
    return name == '/'
        ? NavigationPages.initial
        : NavigationPages.values.firstWhere((element) => element.toString() == name);
  }

  T? _getData<T>(Object? arguments) {
    return arguments is T ? arguments : null;
  }
}
