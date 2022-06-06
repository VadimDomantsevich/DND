import 'package:flutter/material.dart';

class IncrementableWidget extends StatelessWidget {
  const IncrementableWidget({
    Key? key,
    required this.textWidget,
    required this.valueWidget,
    required this.decrementButton,
    required this.incrementButton,
  }) : super(key: key);

  final Widget textWidget;
  final Widget valueWidget;
  final Widget decrementButton;
  final Widget incrementButton;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          decrementButton,
          Column(
            children: [
              textWidget,
              valueWidget,
            ],
          ),
          incrementButton,
        ],
      );
}
