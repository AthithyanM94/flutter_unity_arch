import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lume_ox_app/app.dart';
import 'package:lume_ox_app/bloc/home/home_bloc.dart';
import 'package:lume_ox_app/data/model/workflow_info.dart';
import 'package:lume_ox_app/ui/home/home_screen_widget.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';
import 'package:lume_ox_app/ui/navigation_drawer/navigation_action.dart';
import 'package:lume_ox_app/ui/navigation_drawer/navigation_drawer.dart';
import 'package:lume_ox_app/ui/widget/app_widgets.dart';
import 'package:lume_ox_app/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var loadingView = AppWidgets.getOverlayLoadingView(context);
    return Stack(children: [
      Scaffold(
        appBar: AppWidgets.getAppBarWithSingleIcon(
            context, context.resources.strings?.home ?? "", () {
          //_moveToCountryListScreen();
        }, const Icon(Icons.language)),
        drawer: LumeOXNavigationDrawer(
          countryMenuClick: (events) {
            Navigator.pop(context);
            switch (events) {
              case NavigationAction.englishLang:
                App.setLocale(context, const Locale("en"));
                break;
              case NavigationAction.hindiLang:
                App.setLocale(context, const Locale("hi"));
              case NavigationAction.medium:
                Utility.launchURL("https://x.medium.com/");
                break;
              case NavigationAction.linkedIn:
                Utility.launchURL("https://in.linkedin.com/in/x-card");
                break;
              case NavigationAction.github:
                Utility.launchURL("https://github.com/x");
                break;
              default:
            }
          },
        ),
        body: _buildBody(context),
      ),
      if (_isLoading) loadingView[0],
      if (_isLoading) loadingView[1],
    ]);
  }

  BlocProvider<HomeBloc> _buildBody(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeBloc(),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              image: DecorationImage(
                  image: AssetImage(context.resources.drawable.appBG),
                  fit: BoxFit.cover,
                  opacity: 0.3)),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
         // color: context.resources.color.colorBG,
          child: Center(
              child: BlocListener<HomeBloc, HomeState>(
                  listener: (context, state) {
                    if ((state is HomeInitial) || (state is HomeLoading)) {
                      setState(() {
                        _isLoading = true;
                      });
                    } else if ((state is HomeFetchWorkflowSuccess)) {
                      setState(() {
                        _isLoading = false;
                        navigate(context, "ar_screen", state.workFlowInfo);
                      });
                    }
                  },
                  child: const Align(
                    alignment: Alignment.topCenter,
                    child: HomeScreenWidget(),
                  ))),
        ));
  }

  navigate(BuildContext context, String targetScreenID, WorkFlowInfo info) async {
    var duration = const Duration(seconds: 0);
    return Timer(
        duration,
            () => Navigator.of(context, rootNavigator: true)
            .pushNamed(targetScreenID, arguments: info));
  }
}
