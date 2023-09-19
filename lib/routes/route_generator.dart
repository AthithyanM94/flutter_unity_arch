import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lume_ox_app/data/model/workflow_info.dart';
import 'package:lume_ox_app/ui/ar/ar_screen.dart';
import 'package:lume_ox_app/ui/home/home_screen.dart';
import 'package:lume_ox_app/ui/login/login_screen.dart';
import 'package:lume_ox_app/ui/splash/splash_screen.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case SplashScreen.id:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );
      case LoginScreen.id:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        );
      case HomeScreen.id:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      case ARScreen.id:
        return MaterialPageRoute(
          builder: (context) {
            return ARScreen(workFlowInfo: args as WorkFlowInfo,);
          },
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error while loading new page'),
        ),
      );
    });
  }
}
