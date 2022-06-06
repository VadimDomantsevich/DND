import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IncrementButtonWidget extends StatelessWidget {
  const IncrementButtonWidget({
    Key? key,
    required this.iconWidget,
    required this.isMini,
    required this.onPressed,
  }) : super(key: key);

  final Widget iconWidget;
  final bool isMini;
  final VoidCallback onPressed;

  factory IncrementButtonWidget.common({
    required VoidCallback onPressed,
  }) =>
      IncrementButtonWidget(
        iconWidget: const Icon(Icons.add),
        isMini: true,
        onPressed: onPressed,
      );

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        mini: isMini,
        tooltip: AppLocalizations.of(context)!.increment,
        onPressed: onPressed,
        child: iconWidget,
      );
}
