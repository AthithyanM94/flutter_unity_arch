import 'package:lume_ox_app/res/data/data.dart';
import 'package:flutter/material.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';

class StatisticsGrid extends StatefulWidget {
  const StatisticsGrid({Key? key}) : super(key: key);

  @override
  State<StatisticsGrid> createState() => _StatisticsGridState();
}

class _StatisticsGridState extends State<StatisticsGrid> {
  late double _containerHeight;
  late double _containerWidth;

  @override
  Widget build(BuildContext context) {
    _containerWidth = MediaQuery.of(context).size.width * 0.50;
    _containerHeight = MediaQuery.of(context).size.height * 0.50;

    return GridView.count(
        controller: ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        mainAxisSpacing: context.resources.dimension.defaultMargin,
        crossAxisSpacing: context.resources.dimension.defaultMargin,
        childAspectRatio: 1.80,
        padding: EdgeInsets.all(context.resources.dimension.defaultMargin),
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(4, (index) {
          return Container(

              padding: EdgeInsets.all(context.resources.dimension.imageBorderRadius),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.resources.dimension.imageBorderRadius),
                color: kLightBlue,
              ),
              child: statsContentView(context)
          );
        }));
  }

  Widget statsContentView(BuildContext context) {
    return Column(

      children: [
        Text(
          statistics[0].title,
          maxLines: 2,
          softWrap: true,
          style: context.resources.style.statsCardTitleStyle,
        ),
        SizedBox(height: _containerHeight * 0.03,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: _containerHeight * 0.08,
              width: _containerWidth * 0.01,
              decoration: BoxDecoration(
                  color: context.resources.color.statsCardSeparatorColor,
                  borderRadius: BorderRadius.circular(context.resources.dimension.edgeDefaultMargin)),
            ),
            Text(
              statistics[0].number,
              style: context.resources.style.statsCardCNumberStyle
            )
          ],
        )
      ],
    );
  }
}