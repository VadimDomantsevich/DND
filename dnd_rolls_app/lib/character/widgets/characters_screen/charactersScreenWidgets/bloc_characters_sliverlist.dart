import 'package:dnd_rolls_app/character/character_bloc_freezed/character_bloc.dart';
import 'package:dnd_rolls_app/character/widgets/characters_screen/charactersScreenWidgets/characters_gridview_widget.dart';
import 'package:dnd_rolls_app/character/widgets/characters_screen/charactersScreenWidgets/characters_sliverlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCharactersSliverList extends StatelessWidget {
  const BlocCharactersSliverList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharacterBloc>().state;
    return state.when(
      initial: () => Container(),
      /* charactersLoaded: (characters, error) => CharactersGridViewWidget(
        characters: characters,
      ), */
      charactersLoaded: (characters, error) =>
          CharactersSliverList(characters: characters),
    );
  }
}
