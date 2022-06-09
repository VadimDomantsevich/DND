import 'package:flutter/material.dart';

class AllLocale {
  AllLocale();

  static final all = [
    const Locale('en'),
    const Locale('ru'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'ru':
        return 'ru';
      case 'en':
      default:
        return '🇺🇸';
    }
  }
}
