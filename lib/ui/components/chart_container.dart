import 'package:flutter/material.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';

class ChartContainer extends StatelessWidget {
  final Widget chart;

  const ChartContainer({
    Key? key,
    required this.chart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var containerWidth = MediaQuery.of(context).size.width;
    // var containerHeight = MediaQuery.of(context).size.height;
    return Align(
      child: Container(

        padding: EdgeInsets.fromLTRB(
            0,
            context.resources.dimension.edgeDefaultMargin,
            context.resources.dimension.bigMargin,
            context.resources.dimension.edgeDefaultMargin),
        child: Container(
          //padding: const EdgeInsets.only(top: 10),
          child: chart,
        ),
      ),
    );
  }
}
