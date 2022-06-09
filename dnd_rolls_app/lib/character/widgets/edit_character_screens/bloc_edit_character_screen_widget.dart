import 'package:dnd_rolls_app/character/edit_character/edit_character_bloc.dart';
import 'package:dnd_rolls_app/character/widgets/edit_character_screens/edit_character_screen_widget.dart';
import 'package:dnd_rolls_app/character/widgets/edit_character_screens/edit_character_screen_widgets/bloc_decrement_skill_bonus_button_widget.dart';
import 'package:dnd_rolls_app/character/widgets/edit_character_screens/edit_character_screen_widgets/bloc_increment_skill_bonus_button_widget.dart';
import 'package:dnd_rolls_app/character/widgets/edit_character_screens/edit_character_screen_widgets/characteristic_widget.dart';
import 'package:dnd_rolls_app/character/widgets/edit_character_screens/edit_character_screen_widgets/edit_character_form_widget.dart';
import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/core/widgets/app_bar_title_auto_text_widget.dart';
import 'package:dnd_rolls_app/core/widgets/title_with_number_text_widget.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocEditCharacterScreenWidget extends StatelessWidget {
  const BlocEditCharacterScreenWidget({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController(text: character.name);

    return BlocProvider(
      create: (context) => EditCharacterBloc(
        context.read<CharacterService>(),
        character,
      ),
      child: BlocBuilder<EditCharacterBloc, EditCharacterState>(
        builder: (context, state) {
          return state.maybeWhen(
            valid: (
              character,
              name,
              skillBonus,
              strength,
              dexterity,
              constitution,
              intelligence,
              wisdom,
              charisma,
            ) {
              Navigator.of(context).pop();
              return Container();
            },
            orElse: () => EditCharacterScreenWidget(
              appBarTitleTextWidget: AppBarTitleAutoTextWidget(
                title:
                    '${AppLocalizations.of(context)!.editing} "${character.name}"',
              ),
              editCharacterFormWidget: EditCharacterFormWidget(
                decrementSkillBonusWidget:
                    const BlocDecrementSkillBonusButtonWidget(),
                incrementSkillBonusWidget:
                    const BlocIncrementSkillBonusButtonWidget(),
                skillBonusTextWidget: TitleWithNumberTextWidget(
                  title: AppLocalizations.of(context)!.bonus,
                  value: '${state.skillBonus}',
                ),
                strengthWidget: CharacteristicWidget(
                  characteristic: CharacteristicsEnum.strength,
                  title: AppLocalizations.of(context)!.strength,
                  value: '${state.strength}',
                ),
                dexterityWidget: CharacteristicWidget(
                  characteristic: CharacteristicsEnum.dexterity,
                  title: AppLocalizations.of(context)!.dexterity,
                  value: '${state.dexterity}',
                ),
                constitutionWidget: CharacteristicWidget(
                  characteristic: CharacteristicsEnum.constitution,
                  title: AppLocalizations.of(context)!.constitution,
                  value: '${state.constitution}',
                ),
                intelligenceWidget: CharacteristicWidget(
                  characteristic: CharacteristicsEnum.intelligence,
                  title: AppLocalizations.of(context)!.intelligence,
                  value: '${state.intelligence}',
                ),
                wisdomWidget: CharacteristicWidget(
                  characteristic: CharacteristicsEnum.wisdom,
                  title: AppLocalizations.of(context)!.wisdom,
                  value: '${state.wisdom}',
                ),
                charismaWidget: CharacteristicWidget(
                  characteristic: CharacteristicsEnum.charisma,
                  title: AppLocalizations.of(context)!.charisma,
                  value: '${state.charisma}',
                ),
                nameController: _nameController,
                onPressed: () {
                  context.read<EditCharacterBloc>().add(
                        SubmitFormEvent(
                          character: character,
                          name: _nameController.text,
                          skillBonus: state.skillBonus,
                          strength: state.strength,
                          dexterity: state.dexterity,
                          constitution: state.constitution,
                          intelligence: state.intelligence,
                          wisdom: state.wisdom,
                          charisma: state.charisma,
                        ),
                      );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
