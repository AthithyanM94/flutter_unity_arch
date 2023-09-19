import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lume_ox_app/bloc/home/home_bloc.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class XRBundlesList extends StatefulWidget {
  const XRBundlesList({Key? key}) : super(key: key);

  @override
  State<XRBundlesList> createState() => _XRBundlesListState();
}

class _XRBundlesListState extends State<XRBundlesList> {
  late double progressValue = 0;
  late HomeBloc _homeBloc;

  late double _containerHeight;
  late double _containerWidth;

  @override
  void initState() {
    _homeBloc = BlocProvider.of(context);

    // controller = AnimationController(
    //   /// [AnimationController]s can be created with `vsync: this` because of
    //   /// [TickerProviderStateMixin].
    //   vsync: this,
    //   duration: const Duration(seconds: 5),
    // )..addListener(() {
    //     setState(() {});
    //   });
    // controller.repeat(reverse: true);
    determinateIndicator();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _containerWidth = MediaQuery.of(context).size.width * 0.45;
    _containerHeight = MediaQuery.of(context).size.height * 0.44;

    return ListView(
        shrinkWrap: true,
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: [getCard(), getCard(), getCard()]);
  }

  Container getCard() {
    var heading = '\$2300 per month';
    var subheading = '2 bed, 1 bath, 1300 sqft';
    var cardImage = const AssetImage('assets/images/xr_b1.jpeg');
    var supportingText =
        'Beautiful home to rent, recently refurbished with modern appliances...';
    return Container(
        width: _containerWidth,
        height: _containerHeight,
        padding: EdgeInsets.all(context.resources.dimension.edgeDefaultMargin),
        child: Card(
            elevation: 4.0,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                      style: context.resources.style.xrBundleCardTitleStyle,
                      heading),
                  subtitle: Text(
                      style: context.resources.style.xrBundleCardSubTitleStyle,
                      subheading),
                  //trailing: const Icon(Icons.favorite_outline),
                ),
                SizedBox(
                  height: _containerHeight * .45,
                  child: Ink.image(
                    padding: EdgeInsets.zero,
                    image: cardImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(
                      context.resources.dimension.edgeDefaultMargin),
                  alignment: Alignment.centerLeft,
                  child: Text(supportingText, style: context.resources.style.normalTextStyle,),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left:
                                  context.resources.dimension.verySmallMargin),
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(15.0),
                          //   color: Colors.red,
                          // ),
                          width: _containerWidth * 0.2,
                          height: context.resources.dimension
                                  .downloadProgressCardHeight *
                              3,
                          //child: Center(

                          child: LinearPercentIndicator(
                            //backgroundColor: kDarkBlue,
                            // width: MediaQuery.of(context).size.width - 50,
                            animation: true,
                            lineHeight: context.resources.dimension
                                    .downloadProgressCardHeight *
                                2.5,
                            animationDuration: 2000,
                            percent: 0.9,
                            center: Text(
                              "99.0%",
                              style: context
                                  .resources.style.downloadProgressPercentStyle,
                            ),
                            barRadius: Radius.circular(
                                context.resources.dimension.verySmallMargin),
                            progressColor:
                                context.resources.color.statsCardSeparatorColor,
                          ),
                        ),
                        // child:
                      ],
                    ),
                    Column(
                      children: [
                        Row(children: [
                          SizedBox(
                            height: context.resources.dimension
                                    .downloadProgressCardHeight *
                                2.5,
                            child: IconButton(
                              icon: const Icon(Icons.save_alt),
                              onPressed: () {
                                /* ... */
                              },
                            ),
                          ),
                          SizedBox(
                            height: context.resources.dimension
                                    .downloadProgressCardHeight *
                                2.5,
                            child: IconButton(
                              icon: const Icon(Icons.view_in_ar),
                              onPressed: () {
                                _homeBloc.add(HomeFetchWorkFlow("", ""));
                              },
                            ),
                          ),
                        ])
                      ],
                    )
                  ],
                )
              ],
            )));
  }

  void determinateIndicator() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (progressValue == 1) {
          timer.cancel();
        } else {
          progressValue = progressValue + 0.1;
        }
      });
    });
  }
}
