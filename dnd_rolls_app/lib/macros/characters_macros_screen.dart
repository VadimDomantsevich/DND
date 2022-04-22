import 'package:dnd_rolls_app/character/bloc/character_bloc.dart'
    as character_bloc;
import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/macros/bloc/macros_bloc.dart';
import 'package:dnd_rolls_app/macros/widgets/update_macros.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/model/macros.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/macros_for_character_widget.dart';

class CharactersMacrosScreen extends StatelessWidget {
  final List<Character> characters;
  const CharactersMacrosScreen({Key? key, required this.characters})
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
                        buildMacrosForCharacter(context, name)
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

  Future<void> update(BuildContext context, Macros macros) async {
    List<dynamic> result = await showDialog(
        context: context,
        builder: (context) => Dialog(
              child: UpdateMacros(
                macros: macros,
                characterName: macros.characterName,
              ),
            ));
    if (result.isNotEmpty) {
      BlocProvider.of<MacrosBloc>(context)
          .add(UpdateMacrosEvent(result[0], result[1], result[2], result[3]));
    }
  }
}