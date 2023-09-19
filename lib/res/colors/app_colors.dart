import 'package:flutter/material.dart';
import 'colors.dart';

class AppColors implements BaseColors{
  final Map<int, Color> _primary =
  {
    50:const Color.fromRGBO(37, 52, 83, 0.1),
    100:const Color.fromRGBO(37, 52, 83, 0.2),
    200:const Color.fromRGBO(37, 52, 83, 0.3),
    300:const Color.fromRGBO(37, 52, 83, 0.4),
    400:const Color.fromRGBO(37, 52, 83, 0.5),
    500:const Color.fromRGBO(37, 52, 83, 0.6),
    600:const Color.fromRGBO(37, 52, 83, 0.7),
    700:const Color.fromRGBO(37, 52, 83, 0.8),
    800:const Color.fromRGBO(37, 52, 83, 0.9),
    900:const Color.fromRGBO(37, 52, 83, 1.0),
  };

  @override
  MaterialColor get colorAccent => Colors.blue;

  @override
  MaterialColor get colorPrimary => MaterialColor(0xFFFFFF,_primary);

  @override
  Color get colorPrimaryText => const Color.fromRGBO(37, 52, 83, 1.0);

  @override
  Color get appBarColor => Colors.blue;//const Color.fromRGBO(37, 52, 83, 1.0);

  @override
  Color get colorSecondaryText => const Color(0xff3b3b3b);

  @override
  Color get colorAppbarTitle => Colors.white;

  @override
  Color get colorLink => Colors.indigo;

  @override
  Color get colorBG => const Color(0xffefefef);

  @override
  Color get countryBottomLabel => const Color(0x9dffc107);

  @override
  Color get countrySelectionBorderColor => const Color(0xffff69f8);

  @override
  Color get circularIndicatorBGColor => const Color.fromRGBO(37, 52, 83, 0.1);

  @override
  Color get statsCardSeparatorColor => const Color(0xff369FFF);

  @override
  Color get sliderActiveColor => const Color(0x802196f3);

  @override
  Color get sliderInActiveColor => const Color(0xff226cad);

  @override
  Color get sliderBGColor => const Color(0xff0075fa);
}