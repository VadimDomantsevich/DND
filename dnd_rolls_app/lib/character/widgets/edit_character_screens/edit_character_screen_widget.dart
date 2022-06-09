import 'package:dnd_rolls_app/core/widgets/bloc_language_picker_widget.dart';
import 'package:dnd_rolls_app/core/widgets/radial_gradient_wrap_widget.dart';
import 'package:flutter/material.dart';

class EditCharacterScreenWidget extends StatelessWidget {
  const EditCharacterScreenWidget({
    Key? key,
    required this.appBarTitleTextWidget,
    required this.editCharacterFormWidget,
  }) : super(key: key);

  final Widget appBarTitleTextWidget;
  final Widget editCharacterFormWidget;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: appBarTitleTextWidget,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: BlocLanguagePickerWidget(),
            ),
          ],
        ),
        body: RadialGradientWrap.common(
          widget: editCharacterFormWidget,
        ),
      );
}
