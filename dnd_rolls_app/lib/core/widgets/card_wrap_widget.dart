import 'package:dnd_rolls_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CardWrapWidget extends StatelessWidget {
  const CardWrapWidget({
    Key? key,
    required this.cardWidget,
    required this.firstColor,
    required this.secondColor,
    required this.alignment,
    required this.radius,
  }) : super(key: key);

  final Widget cardWidget;
  final Color firstColor;
  final Color secondColor;
  final AlignmentGeometry alignment;
  final double radius;

  factory CardWrapWidget.common({
    required Widget cardWidget,
  }) =>
      CardWrapWidget(
        cardWidget: cardWidget,
        firstColor: AppTheme.backgroundColor,
        secondColor: AppTheme.canvasColor,
        alignment: Alignment.center,
        radius: 0.75,
      );

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [firstColor, secondColor],
              center: alignment,
              radius: radius,
            ),
            border:  Border.all(),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 44, 24, 17),
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: cardWidget,
        ),
      );
}
