import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AppBarTitleTextWidget extends StatelessWidget {
  const AppBarTitleTextWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => AutoSizeText(
        title,
        style: Theme.of(context).copyWith().textTheme.headline4,
      );
}
