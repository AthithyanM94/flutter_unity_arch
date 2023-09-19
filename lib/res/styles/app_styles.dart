import 'package:flutter/material.dart';
import '../../res/colors/app_colors.dart';
import '../../res/dimensions/app_dimensions.dart';

class AppStyle {
  TextStyle bigHeadingTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().bigText,
      fontWeight: FontWeight.bold,
      color: AppColors().colorPrimaryText);

  TextStyle headingTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.normal,
      color: AppColors().colorPrimaryText);

  TextStyle headingTextBoldStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.bold,
      color: AppColors().colorPrimaryText);

  TextStyle subHeadingTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorPrimaryText);

  // TextStyle appbarTitleStyle =
  // TextStyle(fontFamily: 'Poppins', fontSize: AppDimension().defaultText, fontWeight: FontWeight.w600, color: AppColors().colorAppbarTitle);

  TextStyle linkTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorLink);

  TextStyle normalTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().verySmallText,
      fontWeight: FontWeight.w600,
      color: Colors.black);

  TextStyle bottomTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorPrimaryText);

  TextStyle whiteTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.w600,
      color: Colors.white);

  TextStyle whiteTextSmallStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().smallText,
      fontWeight: FontWeight.w600,
      color: Colors.white);

  TextStyle appBarTitleStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorAppbarTitle);

  TextStyle drawerHeadingStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorAppbarTitle);

  TextStyle drawerTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorSecondaryText);

  TextStyle drawerSubTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.w400,
      color: AppColors().colorPrimary.shade900);

  TextStyle statsCardTitleStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().smallText,
      fontWeight: FontWeight.w400,
      color: Color(0xff8EA3B7));

  TextStyle statsCardCNumberStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().bigText,
      fontWeight: FontWeight.w400,
      color: Color(0xff006ED3));

  TextStyle downloadProgressPercentStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().smallText,
      fontWeight: FontWeight.w600,
      color: Colors.white);

  TextStyle messagePanelButtonSupportTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().verySmallText,
      fontWeight: FontWeight.w600,
      color: Colors.black54);

  TextStyle xrBundleCardTitleStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.w600,
      color: Colors.black);

  TextStyle xrBundleCardSubTitleStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().smallText,
      fontWeight: FontWeight.w600,
      color: Colors.black54);

  //color: Color(0xff006ED3)
  IconThemeData appbarIconTheme =
      IconThemeData(color: AppColors().colorAppbarTitle);

  ButtonStyle buttonStyle = TextButton.styleFrom(
      textStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: AppDimension().mediumText,
          fontWeight: FontWeight.w600,
          color: AppColors().colorAccent),
      foregroundColor: Colors.blueAccent);

  ButtonStyle backButtonWhiteStyle = TextButton.styleFrom(
      textStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: AppDimension().mediumText,
          fontWeight: FontWeight.w600,
          color: AppColors().colorBG),
      foregroundColor: Colors.white);

}
