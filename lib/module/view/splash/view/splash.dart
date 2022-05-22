import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/navigation/navigation_enum.dart';
import '../../../../utils/navigation/navigation_service.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    await Future.delayed(const Duration(seconds: 1));
    WidgetsFlutterBinding.ensureInitialized();

    await context.read<NavigationService>().navigateAndRemoveUntil(path: NavigationPages.home.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.amber,
          child: const Text('Splash Screen'),
        ),
      ),
    );
  }
}
