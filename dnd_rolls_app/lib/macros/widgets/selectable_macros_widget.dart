import 'package:dnd_rolls_app/battle/battle_screen.dart';
import 'package:dnd_rolls_app/battle/bloc/battle_bloc.dart';
import 'package:dnd_rolls_app/macros/bloc/macros_bloc.dart';
import 'package:dnd_rolls_app/model/macros.dart';
import 'package:dnd_rolls_app/services/battle_service.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'update_macros.dart';

Widget buildSelectableMacrosForCharacter(
    BuildContext context, String characterName) {
  return BlocProvider<MacrosBloc>(
    create: ((macrosContext) =>
        MacrosBloc(RepositoryProvider.of<MacrosService>(macrosContext))
          ..add(LoadCharacterMacrosEvent(characterName))),
    child: BlocConsumer<MacrosBloc, MacrosState>(
      listener: (context, state) {
        if (state is MacrosLoadedState) {
          if (state.error != null) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('Ошибка'),
                      content: Text(state.error!),
                    ));
          }
        }
      },
      builder: ((context, state) {
        if (state is MacrosLoadedState) {
          return ListView(shrinkWrap: true, children: [
            ...state.macros.map(
              (macros) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: Slidable(
                        key: const ValueKey(0),
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: ((newContext) async => {
                                    BlocProvider.of<MacrosBloc>(context).add(
                                        RemoveMacrosEvent(
                                            macros.name, macros.characterName))
                                  }),
                              backgroundColor: const Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Удалить',
                            ),
                            SlidableAction(
                              onPressed: (((newContext) async =>
                                  {update(context, macros)})),
                              backgroundColor: Colors.blue.shade200,
                              foregroundColor: Colors.white,
                              icon: Icons.create,
                              label: 'Исправить',
                            ),
                          ],
                        ),
                        child: BlocBuilder<BattleBloc, BattleState>(
                          builder: (context, state) {
                            if (RepositoryProvider.of<BattleService>(context)
                                .battle
                                .whoAttacked
                                .map((e) => e.name)
                                .contains(characterName)) {
                              return ListTile(
                                title: Text(macros.name),
                              );
                            }
                            if (state is SelectedMacrosState) {
                              return ListTile(
                                trailing: state.selectedMacros == macros
                                    ? const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      )
                                    : null,
                                onTap: () {
                                  BlocProvider.of<BattleBloc>(context)
                                      .add(SelectMacrosEvent(macros));
                                },
                                title: Text(macros.name),
                              );
                            } else if (state is SelectedEnemyState) {
                              return ListTile(
                                onTap: () {
                                  BlocProvider.of<BattleBloc>(context).add(
                                      SelectMacrosEvent(macros,
                                          selectedEnemy: state.selectedEnemy,
                                          selectedIndex: state.selectedIndex));
                                },
                                title: Text(macros.name),
                              );
                            } else if (state is SelectedBothState) {
                              return ListTile(
                                trailing: state.selectedMacros == macros
                                    ? const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      )
                                    : null,
                                onTap: () {
                                  BlocProvider.of<BattleBloc>(context).add(
                                      SelectMacrosEvent(macros,
                                          selectedEnemy: state.selectedEnemy,
                                          selectedIndex: state.selectedIndex));
                                },
                                title: Text(macros.name),
                              );
                            } else {
                              return ListTile(
                                onTap: () {
                                  BlocProvider.of<BattleBloc>(context)
                                      .add(SelectMacrosEvent(macros));
                                },
                                title: Text(macros.name),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            ListTile(
              title: const Text('Создать новый макрос'),
              trailing: const Icon(Icons.add_box_outlined),
              onTap: () async {
                List<dynamic> result = await showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: UpdateMacros(
                            characterName: characterName,
                          ),
                        ),
                      );
                    });
                if (result.isNotEmpty) {
                  BlocProvider.of<MacrosBloc>(context)
                      .add(AddMacrosEvent(result[0], result[1], result[2]));
                }
              },
            )
          ]);
        } else {
          return Container();
        }
      }),
    ),
  );
}

Future<void> update(BuildContext context, Macros macros) async {
  List<dynamic> result = await showDialog(
      context: context,
      builder: (context) => Dialog(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: UpdateMacros(
                macros: macros,
                characterName: macros.characterName,
              ),
            ),
          ));
  if (result.isNotEmpty) {
    BlocProvider.of<MacrosBloc>(context)
        .add(UpdateMacrosEvent(result[0], result[1], result[2], result[3]));
  }
}
