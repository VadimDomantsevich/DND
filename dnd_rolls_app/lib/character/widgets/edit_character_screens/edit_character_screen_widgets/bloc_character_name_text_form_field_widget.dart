import 'package:dnd_rolls_app/character/edit_character/edit_character_bloc.dart';
import 'package:dnd_rolls_app/core/widgets/name_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocEditNameTextFormFieldWidget extends StatelessWidget {
  const BlocEditNameTextFormFieldWidget({
    Key? key,
    required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EditCharacterBloc>().state;
    String? errorText = '';
    state.when(
      editing: (
        _,
        name,
        skillBonus,
        strength,
        dexterity,
        constitution,
        intelligence,
        wisdom,
        charisma,
      ) {
        errorText = null;
      },
      emptyName: (
        _,
        name,
        skillBonus,
        strength,
        dexterity,
        constitution,
        intelligence,
        wisdom,
        charisma,
      ) {
        errorText = AppLocalizations.of(context)!.fieldIsEmpty;
      },
      nameAlreadyExists: (
        _,
        name,
        skillBonus,
        strength,
        dexterity,
        constitution,
        intelligence,
        wisdom,
        charisma,
      ) {
        errorText = AppLocalizations.of(context)!.characterAlreadyExists;
      },
      valid: (
        _,
        name,
        skillBonus,
        strength,
        dexterity,
        constitution,
        intelligence,
        wisdom,
        charisma,
      ) {
        errorText = null;
      },
    );
    return NameTextFormFieldWidget.character(
      labelText: AppLocalizations.of(context)!.characterName,
      errorText: errorText,
      nameController: nameController,
    );
  }
}
