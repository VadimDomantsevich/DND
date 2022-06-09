import 'package:auto_size_text/auto_size_text.dart';
import 'package:dnd_rolls_app/core/widgets/slidable_action_widget.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CharacterListTile extends StatelessWidget {
  const CharacterListTile({
    Key? key,
    required this.character,
    required this.onPressedDelete,
    required this.onPressedEdit,
  }) : super(key: key);

  final Character character;
  final SlidableActionCallback onPressedDelete;
  final SlidableActionCallback onPressedEdit;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableActionWidget.delete(onPressed: onPressedDelete),
          SlidableActionWidget.edit(onPressed: onPressedEdit),
        ],
      ),
      //'${character.name} ${character.skillBonus} ${character.strength} ${character.dexterity} ${character.constitution} ${character.intelligence} ${character.wisdom} ${character.charisma}',
      child: ListTile(
        title: Text(
          character
              .name /* '${character.name} \n${AppLocalizations.of(context)!.skillBonus}:\t${character.skillBonus}\n${AppLocalizations.of(context)!.strength}:\t${character.strength}\n${AppLocalizations.of(context)!.dexterity}:\t${character.dexterity}\n${AppLocalizations.of(context)!.constitution}:\t${character.constitution}\n${AppLocalizations.of(context)!.intelligence}:\t${character.intelligence}\n${AppLocalizations.of(context)!.wisdom}:\t${character.wisdom}\n${AppLocalizations.of(context)!.charisma}:\t${character.charisma}' */,
          style: const TextStyle(fontSize: 36),
        ),
        subtitle: Text(
          '${AppLocalizations.of(context)!.skillBonus}:\t${character.skillBonus}\n${AppLocalizations.of(context)!.strength}:\t${character.strength}\n${AppLocalizations.of(context)!.dexterity}:\t${character.dexterity}\n${AppLocalizations.of(context)!.constitution}:\t${character.constitution}\n${AppLocalizations.of(context)!.intelligence}:\t${character.intelligence}\n${AppLocalizations.of(context)!.wisdom}:\t${character.wisdom}\n${AppLocalizations.of(context)!.charisma}:\t${character.charisma}',
          //style: const TextStyle(fontSize: 20),
        ),
        /* title: AutoSizeText(
          '${character.name} \n${AppLocalizations.of(context)!.skillBonus}: ${character.skillBonus}, ' +
              '${AppLocalizations.of(context)!.strength}: ${character.strength}, ' +
              '${AppLocalizations.of(context)!.dexterity}: ${character.dexterity}, ' +
              '${AppLocalizations.of(context)!.constitution}: ${character.constitution}, ' +
              '${AppLocalizations.of(context)!.intelligence}: ${character.intelligence}, ' +
              '${AppLocalizations.of(context)!.wisdom}: ${character.wisdom}, ' +
              '${AppLocalizations.of(context)!.charisma}: ${character.charisma}',
          maxLines: 3,
        ), */
      ),
    );
  }
}
