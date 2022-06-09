import 'package:dnd_rolls_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class TitleWithNumberTextWidget extends StatelessWidget {
  const TitleWithNumberTextWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: TextStyle(
              color: AppTheme.lightTheme.primaryColor,
              fontSize: 24,
            ),
          ),
        ],
      );
}
