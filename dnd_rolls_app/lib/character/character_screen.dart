import 'package:dnd_rolls_app/character/bloc/character_bloc.dart';
import 'package:dnd_rolls_app/character/widgets/update_character.dart';
import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.charactersScreenTitle,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            CharacterBloc(RepositoryProvider.of<CharacterService>(context))
              ..add(RegisterServiceEvent()),
        child: BlocConsumer<CharacterBloc, CharacterState>(
          listener: (context, state) {
            if (state is CharacterLoadedState) {
              if (state.error != null) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("Ошибка"),
                          content: Text(state.error!),
                        ));
              }
            }
          },
          builder: ((context, state) {
            if (state is CharacterLoadedState) {
              return ListView(
                children: [
                  ...state.characters.map(
                    (character) {
                      return Column(
                        children: [
                          Slidable(
                            key: const ValueKey(0),
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: ((newContext) async => {
                                        BlocProvider.of<CharacterBloc>(context)
                                            .add(RemoveCharacterEvent(
                                                character.name))
                                      }),
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Удалить',
                                ),
                                SlidableAction(
                                  onPressed: (((newContext) async =>
                                      {update(context, character)})),
                                  backgroundColor: Colors.blue.shade200,
                                  foregroundColor: Colors.white,
                                  icon: Icons.create,
                                  label: 'Исправить',
                                ),
                              ],
                            ),
                            child: ListTile(
                              title: Text(
                                  '${character.name} ${character.skillBonus} ${character.strength} ${character.dexterity} ${character.constitution} ${character.intelligence} ${character.wisdom} ${character.charisma}'),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Создать нового персонажа'),
                    trailing: const Icon(Icons.add_box_outlined),
                    onTap: () async {
                      List<dynamic> result = await showDialog(
                          context: context,
                          builder: (context) => const Dialog(
                                child: UpdateCharacter(),
                              ));
                      if (result.isNotEmpty) {
                        BlocProvider.of<CharacterBloc>(context).add(
                            AddCharacterEvent(
                                result[0],
                                result[1],
                                result[2],
                                result[3],
                                result[4],
                                result[5],
                                result[6],
                                result[7]));
                      }
                    },
                  ),
                ],
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }

  Future<void> update(BuildContext context, Character character) async {
    List<dynamic> result = await showDialog(
        context: context,
        builder: (context) => Dialog(
              child: UpdateCharacter(character: character),
            ));
    if (result.isNotEmpty) {
      BlocProvider.of<CharacterBloc>(context).add(UpdateCharacterEvent(
          result[0],
          result[1],
          result[2],
          result[3],
          result[4],
          result[5],
          result[6],
          result[7],
          result[8]));
    }
  }
}
