import 'package:dnd_rolls_app/battle/bloc/battle_bloc.dart';
import 'package:dnd_rolls_app/core/widgets/wraps.dart';
import 'package:dnd_rolls_app/macros/characters_macros_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildBattleIsOver(BuildContext context, BattleIsOverState state) {
  final ScrollController _controller = ScrollController();

  SchedulerBinding.instance?.addPostFrameCallback((_) {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  });

  return SafeArea(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DecoratedBox(
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1))),
                    child: Center(
                      child: Text(
                        'Бой завершён',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      primary: false,
                      children: [
                        ...state.battle.characters.map((character) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text(
                                      '${character.name} ${character.skillBonus} ${character.strength} ${character.dexterity} ${character.constitution} ${character.intelligence} ${character.wisdom} ${character.charisma}'),
                                ),
                              )
                            ],
                          );
                        })
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    height: 8,
                  ),
                  Expanded(
                    child: ListView(
                      primary: false,
                      children: [
                        ...state.battle.defeatedEnemies.map((enemy) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(
                                    '${enemy.name} ${enemy.health} ${enemy.armorClass}'),
                              )
                            ],
                          );
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        elevatedButtonWrap(
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<BattleBloc>(context)
                    .add(const EndBattleEvent());
              },
              child: const Text('Завершить бой')),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: ListView.builder(
                  controller: _controller,
                  primary: false,
                  itemCount: state.battle.battleLogs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.battle.battleLogs[index].logs),
                    );
                  }),
            ),
          ),
        )
      ],
    ),
  );
}
