import 'package:dnd_rolls_app/core/themes/app_theme.dart';
import 'package:dnd_rolls_app/core/widgets/card_wrap_widget.dart';
import 'package:dnd_rolls_app/core/widgets/radial_gradient_wrap_widget.dart';
import 'package:dnd_rolls_app/core/widgets/slidable_action_widget.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget({
    Key? key,
    required this.character,
    required this.onPressedDelete,
    required this.onPressedEdit,
  }) : super(key: key);

  final Character character;
  final SlidableActionCallback onPressedDelete;
  final SlidableActionCallback onPressedEdit;

  @override
  Widget build(BuildContext context) => Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableActionWidget.delete(onPressed: onPressedDelete),
            SlidableActionWidget.edit(onPressed: onPressedEdit),
          ],
        ),
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: CardWrapWidget.common(
            cardWidget: Column(
              children: [
                Text(character.name),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3.0,
                    horizontal: 70,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(FontAwesomeIcons.handFist),
                      Text('${character.strength}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3.0,
                    horizontal: 70,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(MdiIcons.karate),
                      Text('${character.dexterity}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3.0,
                    horizontal: 70,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(FontAwesomeIcons.childReaching),
                      Text('${character.constitution}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3.0,
                    horizontal: 70,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(MdiIcons.wizardHat),
                      Text('${character.intelligence}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3.0,
                    horizontal: 70,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(FontAwesomeIcons.scroll),
                      Text('${character.wisdom}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3.0,
                    horizontal: 70,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(MdiIcons.emoticonCoolOutline),
                      Text('${character.charisma}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
