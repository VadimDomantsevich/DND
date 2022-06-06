import 'package:dnd_rolls_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class RadialGradientWrap extends StatelessWidget {
  const RadialGradientWrap({
    Key? key,
    required this.widget,
    required this.firstColor,
    required this.secondColor,
    required this.alignment,
    required this.radius,
  }) : super(key: key);

  final Widget widget;
  final Color firstColor;
  final Color secondColor;
  final AlignmentGeometry alignment;
  final double radius;

  factory RadialGradientWrap.common({
    required Widget widget,
  }) =>
      RadialGradientWrap(
        widget: widget,
        firstColor: AppTheme.backgroundColor,
        secondColor: AppTheme.canvasColor,
        alignment: Alignment.center,
        radius: 0.75,
      );

  @override
  Widget build(BuildContext context) => Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [firstColor, secondColor],
            center: alignment,
            radius: radius,
          ),
        ),
        child: widget,
      );
}
