import 'package:flutter/material.dart';
import '../../res/app_context_extension.dart';
import 'package:lume_ox_app/res/app_context_extension.dart';

class AppWidgets {
  static getAppBar(BuildContext context, String title) {
    return AppBar(
      // iconTheme: context.resources.style.appbarIconTheme,
      centerTitle: true,
      title: Text(
        title,
        // style: context.resources.style.appbarTitleStyle,
      ),
    );
  }

  static getAppBarWithSingleIcon(
      BuildContext context, String title, Function() callback, Icon iconData) {
    return AppBar(
      backgroundColor: context.resources.color.appBarColor,
      iconTheme: context.resources.style.appbarIconTheme,
      centerTitle: true,
      title: Text(
        title,
        style: context.resources.style.appBarTitleStyle,
      ),
      actions: [
        Padding(
          padding:
              EdgeInsets.only(right: context.resources.dimension.defaultMargin),
          child: GestureDetector(
            onTap: callback,
            child: iconData,
          ),
        )
      ],
    );
  }

  static getTransparentAppBarWithIcons(
      BuildContext context, String title, Function() callback, Icon iconData) {
    return AppBar(
      //centerTitle: true,
      leading: BackButton(
        style: context.resources.style.backButtonWhiteStyle,
        color: context.resources.color.colorAccent,
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      // title: Text(
      //   title,
      //   style: context.resources.style.appBarTitleStyle,
      // )
    );
  }

  static getDefaultSizedBox(BuildContext context) {
    return SizedBox(
      height: context.resources.dimension.defaultMargin,
    );
  }

  static getOverlayLoadingView(BuildContext context) {
    return [
      const Opacity(
        opacity: 0.8,
        child: ModalBarrier(dismissible: false, color: Colors.black),
      ),
      Center(
          child: CircularProgressIndicator(
        backgroundColor: context.resources.color.circularIndicatorBGColor,
        valueColor: AlwaysStoppedAnimation<Color>(
          context.resources.color.colorAccent, //<-- SEE HERE
        ),
      ))
    ];
  }

  static getCenterLoadingView(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: context.resources.color.circularIndicatorBGColor,
      valueColor: AlwaysStoppedAnimation<Color>(
        context.resources.color.colorAccent, //<-- SEE HERE
      ),
    );
  }

  static getBuildNoResult(BuildContext context, String errorMessage) {
    return Padding(
      padding: EdgeInsets.all(context.resources.dimension.defaultMargin),
      child: Center(
        child: Text(errorMessage),
      ),
    );
  }

  static animatedWidget(Widget widget, bool visible) {
    return AnimatedOpacity(
        // If the widget is visible, animate to 0.0 (invisible).
        // If the widget is hidden, animate to 1.0 (fully visible).
        opacity: visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 1000),
        child: widget);
  }
}
