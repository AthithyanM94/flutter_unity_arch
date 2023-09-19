import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';

class MessagePanel extends StatefulWidget {
  const MessagePanel({Key? key, required this.questionStr, required this.sendCallToUnity}) : super(key: key);
  final String questionStr;
  final Function sendCallToUnity;

  @override
  State<MessagePanel> createState() => _MessagePanelState();
}

class _MessagePanelState extends State<MessagePanel> {
  @override
  void initState() {
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
                bottom: 0),
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
                Center(
                  child: Column(
                    children: [
                      IconButton(
                        iconSize: containerHeight * 0.1,
                        icon: Image.asset(context.resources.drawable.likeIcon),
                        onPressed: () {
                          widget.sendCallToUnity();

                        },
                      ),
                      Text(
                       context.resources.strings!.coolButtonTitle,
                        style: context
                            .resources.style.messagePanelButtonSupportTextStyle,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
