import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/core/themes/app_theme.dart';
import 'package:dnd_rolls_app/core/widgets/wraps.dart';
import 'package:dnd_rolls_app/enemy/bloc/enemy_bloc.dart';
import 'package:dnd_rolls_app/enemy/widgets/update_enemy.dart';
import 'package:dnd_rolls_app/model/enemy.dart';
import 'package:dnd_rolls_app/services/enemy_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class EnemyScreen extends StatelessWidget {
  const EnemyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.enemyScreenTitle,
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
            return containerRadialGradienWrap(buildListView(context, state));
          }),
        ),
      ),
    );
  }

  Widget buildListView(BuildContext context, EnemyState state) {
    if (state is EnemyLoadedState) {
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
                      backgroundColor: AppTheme.deleteActionPaneBacgroundColor,
                      foregroundColor: AppTheme.actionPaneForegroundColor,
                      icon: Icons.delete,
                      label: 'Удалить',
                    ),
                    SlidableAction(
                      onPressed: (((newContext) async =>
                          {update(context, enemy)})),
                      backgroundColor: AppTheme.editActionPaneBackgroundColor,
                      foregroundColor: AppTheme.actionPaneForegroundColor,
                      icon: Icons.create,
                      label: 'Исправить',
                    ),
                  ],
                ),
                child: ListTile(
                  title:
                      Text('${enemy.name} ${enemy.health} ${enemy.armorClass}'),
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
    }
    return Container();
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
