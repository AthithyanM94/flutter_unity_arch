import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lume_ox_app/bloc/splash/splash_bloc.dart';
import 'package:lume_ox_app/ui/login/login_screen.dart';
import 'package:lume_ox_app/ui/splash/splash_screen_widget.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';

class SplashScreen extends StatelessWidget {
  static const String id = "splash_screen";
  const SplashScreen({super.key});
  //static final AppColors _appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<SplashScreenBloc> _buildBody(BuildContext context) {
    return BlocProvider(
        create: (context) => SplashScreenBloc(),
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: context.resources.color.colorBG,
            child: Center(
              child: BlocListener<SplashScreenBloc, SplashScreenState>(
                listener: (context, state) {
                  if ((state is SplashInitial) || (state is SplashLoading)) {
                    //const SplashScreenWidget();
                  } else if (state is SplashLoaded) {
                    if (state.targetScreenName == "Login") {
                      if (kDebugMode) {
                        print("I will be directed to Login");
                      }
                      navigate(context, LoginScreen.id);
                    } else {
                      if (kDebugMode) {
                        print("I will be directed to Home");
                      }
                      navigate(context, LoginScreen.id);
                    }
                  }
                  //navigate(context, "");
                },
                child: const SplashScreenWidget(),
              ),
            )));
  }

  navigate(BuildContext context, String targetScreenID) async {
    var duration = const Duration(seconds: 0);
    return Timer(
        duration,
        () => Navigator.of(context, rootNavigator: true)
            .pushReplacementNamed(targetScreenID, arguments: ""));
  }
}
