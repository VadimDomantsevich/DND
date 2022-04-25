import 'package:dnd_rolls_app/character/bloc/character_bloc.dart'
    as character_bloc;
import 'package:dnd_rolls_app/macros/widgets/selectable_macros_widget.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
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
    return BlocProvider<character_bloc.CharacterBloc>(
      create: (characterContext) => character_bloc.CharacterBloc(
          RepositoryProvider.of<CharacterService>(characterContext))
        ..add(character_bloc.GetCharactersNamesEvent(characters)),
      child: BlocBuilder<character_bloc.CharacterBloc,
          character_bloc.CharacterState>(
        builder: ((context, state) {
          if (state is character_bloc.CharactersNamesLoadedState) {
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
