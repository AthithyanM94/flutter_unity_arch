import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';
import 'package:lume_ox_app/res/app_localization_delegate.dart';
import 'package:lume_ox_app/routes/route_generator.dart';
import 'package:lume_ox_app/ui/splash/splash_screen.dart';
import 'package:flutter/services.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => AppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    if (kDebugMode) {
      print(
          "Language Selected : ${newLocale.countryCode} / ${newLocale.languageCode}");
    }
    var state = context.findAncestorStateOfType<AppState>();
    state?.setLocale(newLocale);
  }
}

class AppState extends State<App> {
  late Locale _locale;

  @override
  void initState() {
    _landScapeModeOnly();
    super.initState();
  }

  @override
  void dispose() {
    _enableRotation();
    super.dispose();
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    setState(() {
      _locale = const Locale("en");
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: context.resources.color.colorPrimary,
      ),
      initialRoute: SplashScreen.id,
      onGenerateRoute: RouteGenerator().generateRoute,
      locale: _locale,
      supportedLocales: const [
        Locale("en"),
        Locale("hi"),
      ],
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocal in supportedLocales) {
          if (supportedLocal.languageCode == locale?.languageCode &&
              supportedLocal.countryCode == locale?.countryCode) {
            return supportedLocal;
          }
        }
        return supportedLocales.first;
      },
    );
  }

  /// blocks rotation; sets orientation to: portrait
  void _landScapeModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void _enableRotation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
