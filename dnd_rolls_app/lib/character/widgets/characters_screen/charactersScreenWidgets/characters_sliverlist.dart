import 'package:dnd_rolls_app/character/widgets/characters_screen/charactersScreenWidgets/bloc_character_list_tile.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:flutter/material.dart';

class CharactersSliverList extends StatelessWidget {
  const CharactersSliverList({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: BlocCharacterListTile(character: characters[index]),
            ),
            childCount: characters.length,
          ),
        ),
      ],
    );
  }
}
