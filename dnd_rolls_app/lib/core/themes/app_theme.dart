import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xff484c7f);
  static Color lightPrimaryColor = const Color(0xffac8daf);
  static Color lightAccentColor = const Color(0xffddb6c6);
  static Color lightParticlesColor = const Color(0xff062743);
  static Color deleteActionPaneBacgroundColor =
      const Color.fromARGB(255, 255, 98, 98);
  static Color editActionPaneBackgroundColor =
      const Color.fromARGB(255, 100, 206, 255);
  static Color enchantActionPaneBackgroundColor =
      const Color.fromARGB(255, 216, 182, 149);
  static const actionPaneForegroundColor = Colors.white;
  static Color backgroundColor = const Color.fromARGB(255, 253, 238, 213);
  static Color canvasColor = const Color.fromARGB(255, 255, 225, 173);

  const AppTheme._();
  static final lightTheme = ThemeData(
    primarySwatch: Colors.brown,
    textTheme: GoogleFonts.aliceTextTheme(),
    scaffoldBackgroundColor: backgroundColor,
    dialogBackgroundColor: backgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    canvasColor: canvasColor,
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
