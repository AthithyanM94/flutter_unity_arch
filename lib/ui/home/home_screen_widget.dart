import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lume_ox_app/bloc/home/home_bloc.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';
import 'package:lume_ox_app/ui/components/chart_container.dart';
import 'package:lume_ox_app/ui/components/chart_grid.dart';
import 'package:lume_ox_app/ui/components/statistics_grid.dart';
import 'package:lume_ox_app/ui/components/xr_bundles_list.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  //late HomeBloc _homeBloc;

  @override
  void initState() {
    // _homeBloc = BlocProvider.of(context);
    // _homeBloc.add(HomeFetchXRBundleList(""));
    //_authBloc.add(NavigateToLoginEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.resources.dimension.defaultMargin,
                vertical: context.resources.dimension.bigMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  context.resources.strings!.xrBundles,
                  style: context.resources.style.subHeadingTextStyle,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.44,
                    child: const XRBundlesList()),
                SizedBox(
                  height: context.resources.dimension.mediumMargin,
                ),
                Text(
                  context.resources.strings!.statsText,
                  style: context.resources.style.subHeadingTextStyle,
                ),
                SizedBox(
                  height: context.resources.dimension.mediumMargin,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.height * 0.50,
                        child: const ChartContainer(chart: BarChartContent())),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.height * 0.50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.transparent,
                        ),
                        child: const StatisticsGrid())
                  ],
                ),
              ],
            )));
  }
}
