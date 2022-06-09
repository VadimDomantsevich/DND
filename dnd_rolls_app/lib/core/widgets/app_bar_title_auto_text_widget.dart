import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AppBarTitleAutoTextWidget extends StatelessWidget {
  const AppBarTitleAutoTextWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      maxLines: 2,
      style: TextStyle(
        color: Colors.brown.shade900,
      ),
    );
  }
}
