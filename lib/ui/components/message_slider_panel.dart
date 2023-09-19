import 'package:flutter/material.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MessageSliderPanel extends StatefulWidget {
  const MessageSliderPanel(
      {Key? key, required this.questionStr, required this.sendCallToUnity})
      : super(key: key);
  final String questionStr;
  final Function sendCallToUnity;

  @override
  State<MessageSliderPanel> createState() => _MessageSliderPanelState();
}

class _MessageSliderPanelState extends State<MessageSliderPanel> {
  late double _currentSliderValue;
  bool didCallUnity = false;

  @override
  void initState() {
    _currentSliderValue = 20;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var containerHeight = MediaQuery.of(context).size.height * 0.20;
    var containerWidth = MediaQuery.of(context).size.width * 0.50;
    return Material(
        type: MaterialType.transparency,
        child: Stack(children: <Widget>[
          Container(
            height: containerHeight,
            width: containerWidth,
            padding: EdgeInsets.only(
                left: context.resources.dimension.defaultMargin,
                top: context.resources.dimension.defaultMargin,
                right: context.resources.dimension.smallMargin,
                bottom: context.resources.dimension.smallMargin),
            // margin:
            //     EdgeInsets.only(top: context.resources.dimension.bigMargin),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white.withOpacity(1),
                borderRadius: BorderRadius.circular(
                    context.resources.dimension.bigMargin),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(
                          0, context.resources.dimension.edgeDefaultMargin),
                      blurRadius:
                          context.resources.dimension.edgeDefaultMargin),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  textAlign: TextAlign.center,
                  widget.questionStr,
                  style: context.resources.style.xrBundleCardTitleStyle,
                ),
                Center(child: customSliderView())
              ],
            ),
          )
        ]));
  }

  Widget customSliderView() {
    return Center(
      child: SfSlider(
        activeColor: context.resources.color.sliderActiveColor,
        inactiveColor: context.resources.color.sliderInActiveColor,
        showLabels: true,
        showDividers: true,
        max: 100,
        interval: 20,
        value: _currentSliderValue,
        labelPlacement: LabelPlacement.betweenTicks,
        labelFormatterCallback: (dynamic actualValue, String formattedText) {
          switch (actualValue) {
            case 0:
              return 'Low';
            case 20:
              return 'Medium';
            case 40:
              return 'High';
            case 60:
              return 'Very High';
            case 80:
              return 'Extreme';
          }
          return actualValue.toString();
        },
        onChanged: (dynamic newValue) {
          setState(
            () {
              //TODO: Find some other way to close the panel
              if (!didCallUnity) {
                didCallUnity = true;
                //_currentSliderValue = newValue;
                widget.sendCallToUnity();
              }
            },
          );
        },
      ),
    );
  }
}
