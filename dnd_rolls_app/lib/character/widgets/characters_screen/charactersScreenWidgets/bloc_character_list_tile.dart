import 'package:dnd_rolls_app/character/character_bloc_freezed/character_bloc.dart';
import 'package:dnd_rolls_app/character/widgets/characters_screen/charactersScreenWidgets/character_list_tile.dart';
import 'package:dnd_rolls_app/character/widgets/edit_character_screens/bloc_edit_character_screen_widget.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCharacterListTile extends StatelessWidget {
  const BlocCharacterListTile({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) => CharacterListTile(
        character: character,
        onPressedDelete: (newContext) async => context
            .read<CharacterBloc>()
            .add(RemoveCharacterEvent(name: character.name)),
        onPressedEdit: (newContext) async {
          await showDialog(
            context: context,
            builder: (context) => Dialog(
              child: BlocEditCharacterScreenWidget(
                character: character,
              ),
            ),
          );
          //I don't know how not to use context here
          context.read<CharacterBloc>().add(const LoadCharactersEvent());
        },
      );
}
