import 'package:flutter/material.dart';

class ElevatedButtonWrapWidget extends StatelessWidget {
  const ElevatedButtonWrapWidget({
    Key? key,
    required this.elevatedButton,
  }) : super(key: key);

  final Widget elevatedButton;

  //Придумать бы какую красивую обёртку
  //типо одного размера всегда
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: elevatedButton,
      );
}
