import 'package:dnd_rolls_app/character/widgets/characters_screen/charactersScreenWidgets/bloc_character_card_widget.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:flutter/material.dart';

class CharactersGridViewWidget extends StatelessWidget {
  const CharactersGridViewWidget({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List<Character> characters;

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 1.1,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return BlocCharacterCardWidget(character: characters[index]);
              },
              childCount: characters.length,
            ),
          )
        ],
      );
}
