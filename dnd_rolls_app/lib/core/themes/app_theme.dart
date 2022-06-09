import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color deleteSlidableActionBacgroundColor =
      const Color.fromARGB(255, 255, 98, 98);
  static Color editSlidableActionBackgroundColor =
      const Color.fromARGB(255, 100, 206, 255);
  static Color enchantSlidableActionBackgroundColor =
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
