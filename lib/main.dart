import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'module/view/splash/view/splash.dart';
import 'utils/navigation/navigation_manager.dart';
import 'utils/navigation/navigation_route_manager.dart';
import 'utils/navigation/navigation_route_service.dart';
import 'utils/navigation/navigation_service.dart';

void main() {
  return runApp(
    MultiProvider(
      providers: [
        Provider<NavigationService>.value(value: NavigationManager()),
        Provider<NavigationRouteService>.value(value: NavigationRouteManager()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Material App',
          navigatorKey: context.read<NavigationService>().navigatorKey,
          onGenerateRoute: context.read<NavigationRouteService>().generateRoute,
          home: const Splash(),
        );
      },
    );
  }
}
