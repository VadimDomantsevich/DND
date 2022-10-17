import 'package:dnd_rolls_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableActionWidget extends StatelessWidget {
  const SlidableActionWidget({
    Key? key,
    required this.iconWidget,
    required this.backgroundColorWidget,
    required this.foregroundColorWidget,
    required this.onPressed,
  }) : super(key: key);

  final IconData iconWidget;
  final Color backgroundColorWidget;
  final Color foregroundColorWidget;
  final SlidableActionCallback onPressed;

  factory SlidableActionWidget.delete({
    required SlidableActionCallback onPressed,
  }) =>
      SlidableActionWidget(
        iconWidget: Icons.delete,
        backgroundColorWidget: AppTheme.deleteSlidableActionBacgroundColor,
        foregroundColorWidget: AppTheme.actionPaneForegroundColor,
        onPressed: onPressed,
      );

  factory SlidableActionWidget.edit({
    required SlidableActionCallback onPressed,
  }) =>
      SlidableActionWidget(
        iconWidget: Icons.create,
        backgroundColorWidget: AppTheme.editSlidableActionBackgroundColor,
        foregroundColorWidget: AppTheme.actionPaneForegroundColor,
        onPressed: onPressed,
      );

  @override
  Widget build(BuildContext context) => SlidableAction(
        onPressed: onPressed,
        backgroundColor: backgroundColorWidget,
        foregroundColor: foregroundColorWidget,
        icon: iconWidget,
      );
}
