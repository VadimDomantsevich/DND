import 'package:dnd_rolls_app/macros/bloc/macros_bloc.dart';
import 'package:dnd_rolls_app/model/macros.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'update_macros.dart';

Widget buildMacrosForCharacter(BuildContext context, String characterName) {
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
                if (state.macros.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Slidable(
                      key: const ValueKey(0),
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: ((newContext) async => {
                                  BlocProvider.of<MacrosBloc>(context).add(
                                      RemoveMacrosEvent(macros.name,
                                          macros.characterName))
                                }),
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                          ),
                          SlidableAction(
                            onPressed: (((newContext) async =>
                                {update(context, macros)})),
                            backgroundColor: Colors.blue.shade200,
                            foregroundColor: Colors.white,
                            icon: Icons.create,
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(macros.name),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
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
                        child: UpdateMacros(
                          characterName: characterName,
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
