import 'package:dnd_rolls_app/character/widgets/edit_character_screens/edit_character_screen_widgets/bloc_character_name_text_form_field_widget.dart';
import 'package:dnd_rolls_app/core/widgets/elevated_button_text_widget.dart';
import 'package:dnd_rolls_app/core/widgets/elevated_button_wrap_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditCharacterFormWidget extends StatelessWidget {
  const EditCharacterFormWidget({
    Key? key,
    required this.decrementSkillBonusWidget,
    required this.onPressed,
    required this.incrementSkillBonusWidget,
    required this.skillBonusTextWidget,
    required this.strengthWidget,
    required this.dexterityWidget,
    required this.constitutionWidget,
    required this.intelligenceWidget,
    required this.wisdomWidget,
    required this.charismaWidget,
    required this.nameController,
  }) : super(key: key);

  final Widget decrementSkillBonusWidget;
  final Widget incrementSkillBonusWidget;
  final Widget skillBonusTextWidget;
  final Widget strengthWidget;
  final Widget dexterityWidget;
  final Widget constitutionWidget;
  final Widget intelligenceWidget;
  final Widget wisdomWidget;
  final Widget charismaWidget;
  final VoidCallback onPressed;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: BlocEditNameTextFormFieldWidget(
                      nameController: nameController,
                    ),
                  ),
                  decrementSkillBonusWidget,
                  skillBonusTextWidget,
                  incrementSkillBonusWidget,
                ],
              ),
            ),
            strengthWidget,
            dexterityWidget,
            constitutionWidget,
            intelligenceWidget,
            wisdomWidget,
            charismaWidget,
            ElevatedButtonWrapWidget(
              elevatedButton: ElevatedButton(
                onPressed: onPressed,
                child: ElevatedButtonTextWidget(
                  title: AppLocalizations.of(context)!.save,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
