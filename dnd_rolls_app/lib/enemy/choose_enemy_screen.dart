import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/core/widgets/elevated_button_wrap.dart';
import 'package:dnd_rolls_app/enemy/bloc/enemy_bloc.dart';
import 'package:dnd_rolls_app/enemy/widgets/update_enemy.dart';
import 'package:dnd_rolls_app/model/enemy.dart';
import 'package:dnd_rolls_app/services/enemy_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChooseEnemyScreen extends StatefulWidget {
  const ChooseEnemyScreen({Key? key}) : super(key: key);

  @override
  State<ChooseEnemyScreen> createState() => _ChooseEnemyScreenState();
}

class _ChooseEnemyScreenState extends State<ChooseEnemyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Выбор противников',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            EnemyBloc(RepositoryProvider.of<EnemyService>(context))
              ..add(RegisterServiceEvent()),
        child: BlocConsumer<EnemyBloc, EnemyState>(
          listener: (context, state) {
            if (state is EnemyLoadedState) {
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
            return buildListView(context, state);
          }),
        ),
      ),
    );
  }

  Widget buildListView(BuildContext context, EnemyState state) {
    if (state is EnemyLoadedState) {
      List<Enemy> selectedEnemies = [];
      List<int> selectedEnemiesCount = [];
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView(
          children: [
            ...state.enemies.map(
              (enemy) => Slidable(
                key: const ValueKey(1),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: ((newContext) async => {
                            BlocProvider.of<EnemyBloc>(context)
                                .add(RemoveEnemyEvent(enemy.name))
                          }),
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Удалить',
                    ),
                    SlidableAction(
                      onPressed: (((newContext) async =>
                          {update(context, enemy)})),
                      backgroundColor: Colors.blue.shade200,
                      foregroundColor: Colors.white,
                      icon: Icons.create,
                      label: 'Исправить',
                    ),
                  ],
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ListTile(
                    trailing: const Icon(
                      Icons.check_circle_outline,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      BlocProvider.of<EnemyBloc>(context).add(
                          SelectEnemyEvent(enemy, selectedEnemies,
                              selectedEnemiesCount));
                    },
                    title: Text(
                        '${enemy.name} ${enemy.health} ${enemy.armorClass}'),
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Создать нового противника'),
              trailing: const Icon(Icons.add_box_outlined),
              onTap: () async {
                List<dynamic> result = await showDialog(
                    context: context,
                    builder: (context) => const Dialog(
                          child: UpdateEnemy(),
                        ));
                if (result.isNotEmpty) {
                  BlocProvider.of<EnemyBloc>(context)
                      .add(AddEnemyEvent(result[0], result[1], result[2]));
                }
              },
            )
          ],
        ),
      );
    } else if (state is SelectedEnemyState) {
      List<Enemy> selectedEnemies = state.selectedEnemies;
      List<int> selectedEnemiesCount = state.selectedEnemiesCount;
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView(
          children: [
            ...state.enemies.map(
              (enemy) => Column(
                children: [
                  Slidable(
                    key: const ValueKey(1),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: ((newContext) async => {
                                BlocProvider.of<EnemyBloc>(context)
                                    .add(RemoveEnemyEvent(enemy.name))
                              }),
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Удалить',
                        ),
                        SlidableAction(
                          onPressed: (((newContext) async =>
                              {update(context, enemy)})),
                          backgroundColor: Colors.blue.shade200,
                          foregroundColor: Colors.white,
                          icon: Icons.create,
                          label: 'Исправить',
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ListTile(
                            trailing: selectedEnemies
                                    .map((e) => e.name)
                                    .where((element) => element == enemy.name)
                                    .isNotEmpty
                                ? const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.grey,
                                  ),
                            onTap: () {
                              if (selectedEnemies.contains(enemy)) {
                                setState(() {
                                  final index = selectedEnemies.indexOf(enemy);
                                  selectedEnemies.remove(enemy);
                                  selectedEnemiesCount.removeAt(index);
                                });
                                BlocProvider.of<EnemyBloc>(context).add(
                                    UnselectEnemyEvent(
                                        enemy,
                                        state.selectedEnemies,
                                        state.selectedEnemiesCount));
                              } else {
                                setState(() {});
                                BlocProvider.of<EnemyBloc>(context).add(
                                    SelectEnemyEvent(
                                        enemy,
                                        state.selectedEnemies,
                                        state.selectedEnemiesCount));
                              }
                            },
                            title: Text(
                                '${enemy.name} ${enemy.health} ${enemy.armorClass}'),
                          ),
                        ),
                        buildCounter(context, enemy, state)
                      ],
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              title: const Text('Создать нового противника'),
              trailing: const Icon(Icons.add_box_outlined),
              onTap: () async {
                List<dynamic> result = await showDialog(
                    context: context,
                    builder: (context) => const Dialog(
                          child: UpdateEnemy(),
                        ));
                if (result.isNotEmpty) {
                  BlocProvider.of<EnemyBloc>(context)
                      .add(AddEnemyEvent(result[0], result[1], result[2]));
                }
              },
            ),
            elevatedButtonWrap(
              ElevatedButton(
                  onPressed: () {
                    List<Enemy> result = [];
                    for (var enemy in state.selectedEnemies) {
                      int i = 0;
                      int index = state.selectedEnemies.indexOf(enemy);
                      while (i < state.selectedEnemiesCount[index]) {
                        result.add(enemy);
                        i++;
                      }
                    }
                    Navigator.of(context).pop(result);
                  },
                  child: const Text(Strings.choose)),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  Widget buildCounter(
      BuildContext context, Enemy enemy, SelectedEnemyState state) {
    if (state.selectedEnemies.contains(enemy)) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  final index = state.selectedEnemies.indexOf(enemy);
                  if (state.selectedEnemiesCount[index] > 1) {
                    setState(() {
                      state.selectedEnemiesCount[index]--;
                    });
                    BlocProvider.of<EnemyBloc>(context).add(
                        UpdateSelectedEnemyCount(
                            state.selectedEnemies, state.selectedEnemiesCount));
                  }
                },
                mini: true,
                child: const Icon(Icons.arrow_back),
              ),
              Text(
                state.selectedEnemiesCount[state.selectedEnemies.indexOf(enemy)]
                    .toString(),
              ),
              FloatingActionButton(
                onPressed: () {
                  final index = state.selectedEnemies.indexOf(enemy);
                  setState(() {
                    state.selectedEnemiesCount[index]++;
                  });

                  BlocProvider.of<EnemyBloc>(context).add(
                      UpdateSelectedEnemyCount(
                          state.selectedEnemies, state.selectedEnemiesCount));
                },
                mini: true,
                child: const Icon(Icons.arrow_forward),
              )
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Future<void> update(BuildContext context, Enemy enemy) async {
    List<dynamic> result = await showDialog(
        context: context,
        builder: (context) => Dialog(
              child: UpdateEnemy(enemy: enemy),
            ));
    if (result.isNotEmpty) {
      BlocProvider.of<EnemyBloc>(context)
          .add(UpdateEnemyEvent(result[0], result[1], result[2], result[3]));
    }
  }
}
