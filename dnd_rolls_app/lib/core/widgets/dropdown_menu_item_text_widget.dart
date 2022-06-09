import 'package:flutter/material.dart';

class DropDownMenuItemTextWidget extends StatelessWidget {
  const DropDownMenuItemTextWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) => Text(
        title,
        style: Theme.of(context).copyWith().textTheme.button,
      );
}
