import 'package:flutter/material.dart';

class LanguagePickerWidget extends StatelessWidget {
  const LanguagePickerWidget({
    Key? key,
    required this.value,
    required this.dropdownMenuItems,
  }) : super(key: key);

  final Locale value;
  final List<DropdownMenuItem<dynamic>> dropdownMenuItems;

  factory LanguagePickerWidget.common({
    required Locale value,
    required List<DropdownMenuItem<dynamic>> dropDownMenuItems,
  }) =>
      LanguagePickerWidget(
        value: value,
        dropdownMenuItems: dropDownMenuItems,
      );

  @override
  Widget build(BuildContext context) => DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          value: value,
          items: dropdownMenuItems,
          onChanged: (_) {},
        ),
      );
}
