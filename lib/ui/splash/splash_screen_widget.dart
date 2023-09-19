import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lume_ox_app/bloc/splash/splash_bloc.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';
import 'package:lume_ox_app/ui/widget/app_widgets.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  late SplashScreenBloc _splashScreenBloc;
  bool _visible = false;

  @override
  void initState() {
    _splashScreenBloc = BlocProvider.of(context);
    _splashScreenBloc.add(NavigateToLoginEvent());

    super.initState();

    Future<void>.delayed(
        const Duration(milliseconds: 100),
        () => setState(() {
              _visible = !_visible;
            }));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Here place your app logo, tagline etc..
            Center(
                child: AppWidgets.animatedWidget(
                    Image(
                      image: AssetImage(context.resources.drawable.appLogo),
                      height: MediaQuery.of(context).size.height * 0.31,
                    ),
                    _visible)),
            Center(
                child: AppWidgets.animatedWidget(
                    Text(
                      context.resources.strings!.tagline,
                      style: context.resources.style.headingTextStyle,
                    ),
                    _visible)),
            const Padding(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
            ),
            AppWidgets.getCenterLoadingView(context),
          ],
        ),
      ),
    );
  }
}
