import 'package:dnd_rolls_app/character/bloc/character_bloc.dart'
    as character_bloc;
import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/macros/bloc/macros_bloc.dart';
import 'package:dnd_rolls_app/macros/widgets/update_macros.dart';
import 'package:dnd_rolls_app/model/macros.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
      body: BlocProvider<MacrosBloc>(
        create: (macrosContext) =>
            MacrosBloc(RepositoryProvider.of<MacrosService>(macrosContext))
              ..add(RegisterServiceEvent()),
        child: BlocConsumer<MacrosBloc, MacrosState>(
          listener: (context, state) {
            if (state is MacrosLoadedState) {
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
            if (state is MacrosLoadedState) {
              return ListView(
                children: [
                  ...state.macros.map(
                    (macros) {
                      return Column(
                        children: [
                          Slidable(
                            key: const ValueKey(0),
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: ((newContext) async => {
                                        BlocProvider.of<MacrosBloc>(context)
                                            .add(RemoveMacrosEvent(macros.name))
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
                            child: ListTile(
                              title: Text(
                                  '${macros.characterName} ${macros.name}'),
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
                          builder: (context) => BlocProvider<
                                  character_bloc.CharacterBloc>(
                              create: (contextt) => character_bloc
                                  .CharacterBloc(
                                      RepositoryProvider.of<CharacterService>(
                                          context))
                                ..add(character_bloc.GetCharactersNamesEvent()),
                              child: BlocBuilder<character_bloc.CharacterBloc,
                                  character_bloc.CharacterState>(
                                builder: (context, state) {
                                  if (state is character_bloc
                                      .CharactersNamesLoadedState) {
                                    return Dialog(
                                      child: UpdateMacros(
                                        charactersNames: state.names,
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              )));
                      if (result.isNotEmpty) {
                        BlocProvider.of<MacrosBloc>(context).add(AddMacrosEvent(
                          result[0],
                          result[1],
                          result[2],
                        ));
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

  Future<void> update(BuildContext context, Macros macros) async {
    List<dynamic> result = await showDialog(
        context: context,
        builder: (context) => Dialog(
              child: UpdateMacros(macros: macros),
            ));
    if (result.isNotEmpty) {
      BlocProvider.of<MacrosBloc>(context)
          .add(UpdateMacrosEvent(result[0], result[1], result[2], result[3]));
    }
  }

  
}
