import 'package:flutter/material.dart';
import 'package:lume_ox_app/res/colors/app_colors.dart';
import 'package:lume_ox_app/res/dimensions/app_dimensions.dart';
import 'package:lume_ox_app/res/drawables/app_drawables.dart';
import 'package:lume_ox_app/res/strings/strings.dart';
import 'package:lume_ox_app/res/styles/app_styles.dart';

class Resources {
  final BuildContext _context;

  Resources(this._context);

  Strings? get strings {
    return Localizations.of<Strings>(_context, Strings);
  }

  AppColors get color {
    return AppColors();
  }

  AppDrawables get drawable {
    return AppDrawables();
  }

  AppDimension get dimension {
    return AppDimension();
  }

  AppStyle get style {
    return AppStyle();
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
