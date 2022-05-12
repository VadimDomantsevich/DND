import 'package:dnd_rolls_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

Widget elevatedButtonWrap(ElevatedButton elevatedButton) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: elevatedButton,
  );
}

Widget listTileWrap(ListTile listTile) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
    child: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [AppTheme.backgroundColor, AppTheme.canvasColor],
              center: Alignment.center,
              radius: 2.5,
            ),
            border: Border.all(width: 1.0),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            boxShadow: const [
              BoxShadow(color: Color.fromARGB(255, 44, 24, 17), offset: Offset(2, 2)),
            ]),
        child: listTile),
  );
}

Widget containerRadialGradienWrap(Widget widget) {
  return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [AppTheme.backgroundColor, AppTheme.canvasColor],
          center: Alignment.center,
          radius: 0.75,
        ),
      ),
      child: widget);
}
