
import 'package:dnd_rolls_app/character/bloc_equatable/character_bloc.dart';
import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/core/widgets/wraps.dart';
import 'package:dnd_rolls_app/macros/bloc/macros_bloc.dart';
import 'package:dnd_rolls_app/macros/widgets/update_macros.dart';
import 'package:dnd_rolls_app/model/macros.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/macros_for_character_widget.dart';

class MacrosScreen extends StatelessWidget {
  const MacrosScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.macrosScreenTitle,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: BlocProvider<CharacterBloc>(
        create: (characterContext) => CharacterBloc(
            RepositoryProvider.of<CharacterService>(characterContext),
            RepositoryProvider.of<MacrosService>(context))
          ..add(GetAllCharactersNamesEvent()),
        child: BlocBuilder<CharacterBloc,
            CharacterState>(
          builder: ((context, state) {
            if (state is CharactersNamesLoadedState) {
              return containerRadialGradienWrap(ListView(
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
              ));
            }
            return Container();
          }),
        ),
      ),
    );
  }

  Future<void> update(BuildContext context, Macros macros) async {
    /* List<dynamic> result = await showDialog(
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
    } */
  }
}
