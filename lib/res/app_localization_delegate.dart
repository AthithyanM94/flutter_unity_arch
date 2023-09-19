import 'package:flutter/material.dart';
import 'package:lume_ox_app/res/strings/english_strings.dart';
import 'package:lume_ox_app/res/strings/hindi_strings.dart';
import 'package:lume_ox_app/res/strings/strings.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<Strings> {

  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'hi'].contains(locale.languageCode);

  @override
  Future<Strings> load(Locale locale) => _load(locale);

  static Future<Strings> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return EnglishStrings();
      case 'hi':
        return HindiStrings();
      default:
        return EnglishStrings();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Strings> old) => false;

}