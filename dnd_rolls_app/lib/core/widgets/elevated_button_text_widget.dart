import 'package:flutter/material.dart';

class ElevatedButtonTextWidget extends StatelessWidget {
  const ElevatedButtonTextWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      );
}
