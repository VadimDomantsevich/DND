import 'package:dnd_rolls_app/character/bloc_equatable/character_bloc.dart';
import 'package:dnd_rolls_app/macros/widgets/selectable_macros_widget.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/macros_for_character_widget.dart';

class CharactersMacrosScreen extends StatelessWidget {
  final List<Character> characters;
  final bool isSelectable;
  const CharactersMacrosScreen(
      {Key? key, required this.characters, required this.isSelectable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterBloc>(
      create: (characterContext) => CharacterBloc(
          RepositoryProvider.of<CharacterService>(characterContext),
          RepositoryProvider.of<MacrosService>(context))
        ..add(GetCharactersNamesEvent(characters)),
      child: BlocBuilder<CharacterBloc, CharacterState>(
        builder: ((context, state) {
          if (state is CharactersNamesLoadedState) {
            return ListView(
              shrinkWrap: true,
              children: [
                ...state.names.map(
                  (name) {
                    return Column(
                      children: [
                        ListTile(
                          title: Center(child: Text(name)),
                        ),
                        isSelectable
                            ? buildSelectableMacrosForCharacter(context, name)
                            : buildMacrosForCharacter(context, name)
                      ],
                    );
                  },
                ),
              ],
            );
          }
          return Container();
        }),
      ),
    );
  }
}
