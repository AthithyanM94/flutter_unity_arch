import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lume_ox_app/bloc/ar/ar_bloc.dart';
import 'package:lume_ox_app/data/model/workflow_info.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:lume_ox_app/ui/components/message_panel.dart';
import 'package:lume_ox_app/ui/components/message_panel_table.dart';
import 'package:lume_ox_app/ui/components/message_question_panel.dart';
import 'package:lume_ox_app/ui/components/message_slider_panel.dart';

class ARScreenWidget extends StatefulWidget {
  const ARScreenWidget(
      {Key? key, required this.workFlowInfo, required this.sendCallToUnity})
      : super(key: key);
  final WorkFlowInfo workFlowInfo;
  final Function(int commandIdx) sendCallToUnity;

  //final UnityWidgetController unityWidgetController;
  @override
  State<ARScreenWidget> createState() => ARScreenWidgetState();
}

enum WorkflowProgressState { none, followup, discovery, valueProp }

class ARScreenWidgetState extends State<ARScreenWidget>
    with SingleTickerProviderStateMixin {
  WorkflowProgressState _workflowProgressState = WorkflowProgressState.none;

  late ARBloc _homeBloc;
  late Animation<double> _animation;
  late AnimationController _animationController;
  int currentCommandIdx = -1;
  int discoveryQuestionIdx = 0;

  @override
  void initState() {
    _homeBloc = BlocProvider.of(context);
    _homeBloc.add(LogAnalyticsEvent("", ""));

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Container(
            padding: EdgeInsets.only(
                right: context.resources.dimension.defaultMargin),
            // color: Colors.white54.withOpacity(0.1),
            color: Colors.red.withOpacity(0),
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.175,
            child: workFlowPanel(),
          )),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              padding: EdgeInsets.only(
                  bottom: context.resources.dimension.verySmallMargin),
              // color: Colors.white.withOpacity(0.1),
              color: Colors.white.withOpacity(0),
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width * 0.60,
              child: IgnorePointer(
                ignoring: false,
                child: Center(child: determineCurrentWorkflowWidget()),
              ))),
    ]);
  }

  // Widget someDummy()
  // {
  //   var currentHotspot = widget.workFlowInfo.hotspots[2];
  //   return MessageTablePanel(
  //     valueProp: currentHotspot.valueProps!,
  //     sendCallToUnity: sendMessageToUNITY,
  //   );
  // }

  Widget workFlowPanel() {
    return Center(
        //alignment: Alignment.bottomRight,
        child: FloatingActionBubble(
      // Menu items
      items: <Bubble>[
        // Floating action menu item
        Bubble(
          title: context.resources.strings!.hpTitle1,
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.build_circle_rounded,
          titleStyle: context.resources.style.whiteTextSmallStyle,
          onPress: () {
            _animationController.reverse();
          },
        ),
        // Floating action menu item
        Bubble(
          title: context.resources.strings!.hpTitle2,
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.build_circle_rounded,
          titleStyle: context.resources.style.whiteTextSmallStyle,
          onPress: () {
            _animationController.reverse();
          },
        ),
        //Floating action menu item
        Bubble(
          title: context.resources.strings!.hpTitle3,
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.build_circle_rounded,
          titleStyle: context.resources.style.whiteTextSmallStyle,
          onPress: () {
            _animationController.reverse();
          },
        ),
      ],

      // animation controller
      animation: _animation,

      // On pressed change animation state
      onPress: () => _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),

      // Floating Action button Icon color
      iconColor: Colors.blue,

      iconData: Icons.menu,
      backGroundColor: Colors.white,
    ));
  }

  void sendMessageToUNITY() {
    if (kDebugMode) {
      print('sendMessageToUNITY called from one of the children - widget');
    }
    setState(() {
      var currentHotspot = widget.workFlowInfo.hotspots[currentCommandIdx - 1];
      if (_workflowProgressState == WorkflowProgressState.followup) {
        _workflowProgressState = WorkflowProgressState.discovery;
      } else if (_workflowProgressState == WorkflowProgressState.discovery &&
          discoveryQuestionIdx >= currentHotspot.discoveryQuestions!.length) {
        _workflowProgressState = WorkflowProgressState.valueProp;
      }
      else if (_workflowProgressState == WorkflowProgressState.valueProp){
        widget.sendCallToUnity(currentCommandIdx);
        _workflowProgressState = WorkflowProgressState.none;
        discoveryQuestionIdx = 0;
      }
    });
  }

  void onUnityMessageReceivedListener(String command) {
    if (kDebugMode) {
      print("onUnityMessageReceivedListener - $command");
    }
    setState(() {
      currentCommandIdx = int.parse(command.split("_")[3]);
      //TODO: Six (6) is the number of animations in unity
      if (currentCommandIdx == 0 || currentCommandIdx == 7) {
        widget.sendCallToUnity(currentCommandIdx);
        _workflowProgressState = WorkflowProgressState.none;
      } else {
        _workflowProgressState = WorkflowProgressState.followup;
      }
    });
  }

  Widget determineCurrentWorkflowWidget() {
    switch (_workflowProgressState) {
      case WorkflowProgressState.none:
        return Container();
      case WorkflowProgressState.followup:
        var currentHotspot =
            widget.workFlowInfo.hotspots[currentCommandIdx - 1];
        String? question = currentHotspot.followUpQuestion;
        return MessagePanel(
          questionStr: question!,
          sendCallToUnity: sendMessageToUNITY,
        );
      case WorkflowProgressState.discovery:
        var currentHotspot =
            widget.workFlowInfo.hotspots[currentCommandIdx - 1];
        if (discoveryQuestionIdx < currentHotspot.discoveryQuestions!.length) {
          var currentDiscoveryQuestion =
              currentHotspot.discoveryQuestions![discoveryQuestionIdx];
          discoveryQuestionIdx++;
          String? question = currentDiscoveryQuestion.question;
          if (currentDiscoveryQuestion.type == "SCQ") {
            return MessageQuestionPanel(
              questionStr: question!,
              sendCallToUnity: sendMessageToUNITY,
            );
          } else {
            return MessageSliderPanel(
              questionStr: question!,
              sendCallToUnity: sendMessageToUNITY,
            );
          }
        }
        return Container();
      case WorkflowProgressState.valueProp:
        var currentHotspot =
        widget.workFlowInfo.hotspots[currentCommandIdx - 1];
        return MessageTablePanel(
          valueProp: currentHotspot.valueProps!,
          sendCallToUnity: sendMessageToUNITY,
        );
      default:
        return Container();
    }
  }
}
