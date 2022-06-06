import 'package:flutter/material.dart';

class NameTextFormFieldWidget extends StatelessWidget {
  const NameTextFormFieldWidget({
    Key? key,
    required this.iconWidget,
    required this.labelText,
    required this.errorText,
    required this.nameController,
  }) : super(key: key);

  final Widget iconWidget;
  final String labelText;
  final String? errorText;
  final TextEditingController nameController;

  factory NameTextFormFieldWidget.character({
    required String labelText,
    required String? errorText,
    required TextEditingController nameController,
  }) =>
      NameTextFormFieldWidget(
        iconWidget: const Icon(Icons.person),
        labelText: labelText,
        errorText: errorText,
        nameController: nameController,
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        prefixIcon: iconWidget,
        labelText: labelText,
        errorText: errorText,
      ),
    );
  }
}
