import 'package:dnd_rolls_app/battle/bloc/battle_bloc.dart';
import 'package:dnd_rolls_app/macros/characters_macros_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildSelectedBoth(BuildContext context, SelectedBothState state) {
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
                        'Бой: Ход ${state.battle.turn}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: ListView(
                          primary: false,
                          children: [
                            CharactersMacrosScreen(
                              characters: state.battle.characters,
                              isSelectable: true,
                            ),
                          ],
                        )),
                        Container(
                          decoration:
                              BoxDecoration(border: Border.all(width: 1)),
                          width: 8,
                        ),
                        Expanded(
                          child: ListView(
                            primary: false,
                            children: [
                              ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: state.battle.enemies.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      trailing: index == state.selectedIndex
                                          ? const Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                            )
                                          : null,
                                      onTap: () {
                                        BlocProvider.of<BattleBloc>(context)
                                            .add(SelectEnemyEvent(
                                                state.battle.enemies[index],
                                                index,
                                                selectedMacros:
                                                    state.selectedMacros));
                                      },
                                      title: Text(
                                          state.battle.enemies[index].name),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<BattleBloc>(context).add(AttackEvent(
                    state.selectedMacros,
                    state.selectedEnemy,
                    state.selectedIndex));
              },
              child: const Text('Атаковать')),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: ListView.builder(
                  controller: _controller,
                  primary: false,
                  shrinkWrap: true,
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
