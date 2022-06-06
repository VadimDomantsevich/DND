
import 'package:dnd_rolls_app/character/bloc_equatable/character_bloc.dart';
import 'package:dnd_rolls_app/character/widgets/update_character.dart';
import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/core/themes/app_theme.dart';
import 'package:dnd_rolls_app/core/widgets/wraps.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChooseCharacterScreen extends StatefulWidget {
  const ChooseCharacterScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCharacterScreen> createState() => _ChooseCharacterScreenState();
}

class _ChooseCharacterScreenState extends State<ChooseCharacterScreen> {
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
        create: (context) => CharacterBloc(
            RepositoryProvider.of<CharacterService>(context),
            RepositoryProvider.of<MacrosService>(context),)
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
                        ),);
              }
            }
          },
          builder: (context, state) {
            return containerRadialGradienWrap(buildListView(context, state));
          },
        ),
      ),
    );
  }

  Future<void> update(BuildContext context, Character character) async {
    /* List<dynamic> result = await showDialog(
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
    } */
  }

  Widget buildListView(BuildContext context, CharacterState state) {
    if (state is CharacterLoadedState) {
      final List<Character> selectedCharacters = [];
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
                          onPressed: (newContext) async => {
                                BlocProvider.of<CharacterBloc>(context)
                                    .add(RemoveCharacterEvent(character.name))
                              },
                          backgroundColor:
                              AppTheme.deleteSlidableActionBacgroundColor,
                          foregroundColor: AppTheme.actionPaneForegroundColor,
                          icon: Icons.delete,
                          label: 'Удалить',
                        ),
                        SlidableAction(
                          onPressed: (newContext) async =>
                              {update(context, character)},
                          backgroundColor:
                              AppTheme.editSlidableActionBackgroundColor,
                          foregroundColor: AppTheme.actionPaneForegroundColor,
                          icon: Icons.create,
                          label: 'Исправить',
                        ),
                      ],
                    ),
                    child: ListTile(
                      trailing: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        BlocProvider.of<CharacterBloc>(context).add(
                            SelectCharacterEvent(
                                character, selectedCharacters,),);
                      },
                      title: Text(
                          '${character.name} ${character.skillBonus} ${character.strength} ${character.dexterity} ${character.constitution} ${character.intelligence} ${character.wisdom} ${character.charisma}',),
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
              /* List<dynamic> result = await showDialog(
                  context: context,
                  builder: (context) => const Dialog(
                        child: UpdateCharacter(),
                      ));
              if (result.isNotEmpty) {
                BlocProvider.of<CharacterBloc>(context).add(AddCharacterEvent(
                    result[0],
                    result[1],
                    result[2],
                    result[3],
                    result[4],
                    result[5],
                    result[6],
                    result[7]));
              } */
            },
          ),
        ],
      );
    } else if (state is SelectedCharacterState) {
      final List<Character> selectedCharacters = state.selectedCharacters;
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
                          onPressed: (newContext) async => {
                                BlocProvider.of<CharacterBloc>(context)
                                    .add(RemoveCharacterEvent(character.name))
                              },
                          backgroundColor:
                              AppTheme.deleteSlidableActionBacgroundColor,
                          foregroundColor: AppTheme.actionPaneForegroundColor,
                          icon: Icons.delete,
                          label: 'Удалить',
                        ),
                        SlidableAction(
                          onPressed: (newContext) async =>
                              {update(context, character)},
                          backgroundColor:
                              AppTheme.editSlidableActionBackgroundColor,
                          foregroundColor: AppTheme.actionPaneForegroundColor,
                          icon: Icons.create,
                          label: 'Исправить',
                        ),
                      ],
                    ),
                    child: ListTile(
                      trailing: selectedCharacters
                              .map((e) => e.name)
                              .where((element) => element == character.name)
                              .isNotEmpty
                          ? Icon(
                              Icons.check_circle,
                              color: Theme.of(context).primaryColor,
                            )
                          : const Icon(
                              Icons.check_circle_outline,
                            ),
                      onTap: () {
                        if (selectedCharacters.contains(character)) {
                          setState(() {
                            selectedCharacters.remove(character);
                          });
                          BlocProvider.of<CharacterBloc>(context).add(
                              UnselectCharacterEvent(
                                  character, selectedCharacters,),);
                        } else {
                          setState(() {});
                          BlocProvider.of<CharacterBloc>(context).add(
                              SelectCharacterEvent(
                                  character, selectedCharacters,),);
                        }
                      },
                      title: Text(
                          '${character.name} ${character.skillBonus} ${character.strength} ${character.dexterity} ${character.constitution} ${character.intelligence} ${character.wisdom} ${character.charisma}',),
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
              /* List<dynamic> result = await showDialog(
                  context: context,
                  builder: (context) => const Dialog(
                        child: UpdateCharacter(),
                      ));
              if (result.isNotEmpty) {
                BlocProvider.of<CharacterBloc>(context).add(AddCharacterEvent(
                    result[0],
                    result[1],
                    result[2],
                    result[3],
                    result[4],
                    result[5],
                    result[6],
                    result[7]));
              } */
            },
          ),
          elevatedButtonWrap(
            ElevatedButton(
                onPressed: () {
                  final result = state.selectedCharacters;
                  Navigator.of(context).pop(result);
                },
                child: const Text(Strings.choose),),
          )
        ],
      );
    }
    return Container();
  }
}
