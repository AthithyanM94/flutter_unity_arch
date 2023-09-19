import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lume_ox_app/bloc/auth/auth_bloc.dart';
import 'package:lume_ox_app/ui/login/login_screen_widget.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';
import 'package:lume_ox_app/ui/widget/app_widgets.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    var loadingView = AppWidgets.getOverlayLoadingView(context);
    return Stack(children: [
      Scaffold(
        body: _buildBody(context),
      ),
      if (_isLoading)
        loadingView[0],
      if (_isLoading)
        loadingView[1],

    ]);
  }

  BlocProvider<AuthBloc> _buildBody(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: context.resources.color.colorBG,
          child: Center(
              child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if ((state is AuthInitial) || (state is AuthLoading)) {
                setState(() {
                  _isLoading = true;
                });
                if (kDebugMode) {
                  print("Auth initial or loading state");
                  //return ;
                }
              } else {
                navigate(context, "home_screen");
              }
            },
            child: const LoginScreenWidget(),
          )),
        ));
  }

  navigate(BuildContext context, String targetScreenID) async {
    var duration = const Duration(seconds: 0);
    return Timer(
        duration,
            () => Navigator.of(context, rootNavigator: true)
            .pushReplacementNamed(targetScreenID, arguments: ""));
  }
}
