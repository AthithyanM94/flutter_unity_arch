import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:lume_ox_app/bloc/ar/ar_bloc.dart';
import 'package:lume_ox_app/data/model/workflow_info.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';
import 'package:lume_ox_app/ui/ar/ar_screen_widget.dart';
import 'package:lume_ox_app/ui/widget/app_widgets.dart';

class ARScreen extends StatefulWidget {
  static const String id = "ar_screen";
  final WorkFlowInfo workFlowInfo;

  const ARScreen({super.key, required this.workFlowInfo});

  @override
  State<ARScreen> createState() => _ARScreenState();
}

class _ARScreenState extends State<ARScreen> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  final GlobalKey<ARScreenWidgetState> _key = GlobalKey();

  bool _isLoading = false;
  UnityWidgetController? _unityWidgetController;
  late ARScreenWidget arScreenWidget;

  @override
  void initState() {
    arScreenWidget = ARScreenWidget(key: _key, workFlowInfo: widget.workFlowInfo, sendCallToUnity: sendMessageToUNITY,);
    //_unityWidgetController!.pause();
    super.initState();
  }

  @override
  void dispose() {
    //_unityWidgetController!.unload();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loadingView = AppWidgets.getOverlayLoadingView(context);
    return Stack(children: [
      Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: AppWidgets.getTransparentAppBarWithIcons(
            context,
            context.resources.strings!.arScreenTitle ?? "",
            () {},
            const Icon(Icons.language)),
        body: arView(),
      ),
      if (_isLoading) loadingView[0],
      if (_isLoading) loadingView[1],
      _buildBody(context)
    ]);
  }

  BlocProvider<ARBloc> _buildBody(BuildContext context) {
    return BlocProvider(
        create: (context) => ARBloc(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // color: context.resources.color.colorBG,
          child: Center(
              child: BlocListener<ARBloc, ARState>(
                  listener: (context, state) {
                    if ((state is ARInitial) || (state is ARLoading)) {
                      setState(() {
                        _isLoading = true;
                      });
                      } else if ((state is RecordAnalyticsSuccess)) {
                        setState(() {
                          _isLoading = false;
                        });
                    }
                  },
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: arScreenWidget,
                  ))),
        ));
  }

  Widget arView() {
    return UnityWidget(
      onUnityCreated: onUnityCreated,
      onUnityMessage: onUnityMessage,
      onUnitySceneLoaded: onUnitySceneLoaded,
      fullscreen: false,
    );
  }

  _propogateUnityMessageToChild(String data) {
    _key.currentState!.onUnityMessageReceivedListener(data);
  }

  void sendMessageToUNITY(int workflowIdx) {
    if (kDebugMode) {
      print('sendMessageToUNITY called from one of the children - parent : idx is $workflowIdx');
    }
    _unityWidgetController?.postMessage(
      'WorkflowScreen',
      'OnWorkflowActionComplete',
      '',
    );
  }

  // Communication from Unity to Flutter
  void onUnityMessage(message) {
    if (kDebugMode) {
      print('Received message from unity: ${message.toString()}');
      _propogateUnityMessageToChild(message.toString());
    }
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    _unityWidgetController = controller;
  }

  // Communication from Unity when new scene is loaded to Flutter
  void onUnitySceneLoaded(SceneLoaded? sceneInfo) {
    if (sceneInfo != null) {
      if (kDebugMode) {
        print('Received scene loaded from unity: ${sceneInfo.name}');
        print(
            'Received scene loaded from unity buildIndex: ${sceneInfo.buildIndex}');
      }
    }
  }


}
