import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DecrementButtonWidget extends StatelessWidget {
  const DecrementButtonWidget({
    Key? key,
    required this.iconWidget,
    required this.isMini,
    required this.onPressed,
  }) : super(key: key);

  final Widget iconWidget;
  final bool isMini;
  final VoidCallback onPressed;

  factory DecrementButtonWidget.common({
    required VoidCallback onPressed,
  }) =>
      DecrementButtonWidget(
        iconWidget: const Icon(Icons.remove),
        isMini: true,
        onPressed: onPressed,
      );

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        mini: isMini,
        tooltip: AppLocalizations.of(context)!.decrement,
        onPressed: onPressed,
        child: iconWidget,
      );
}
