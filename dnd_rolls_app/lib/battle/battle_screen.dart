import 'package:dnd_rolls_app/battle/bloc/battle_bloc.dart';
import 'package:dnd_rolls_app/battle/widgets/battle_is_on_widget.dart';
import 'package:dnd_rolls_app/battle/widgets/battle_is_over_widget.dart';
import 'package:dnd_rolls_app/battle/widgets/both_loaded_widget.dart';
import 'package:dnd_rolls_app/battle/widgets/build_battle_initial.dart';
import 'package:dnd_rolls_app/battle/widgets/characters_loaded_widget.dart';
import 'package:dnd_rolls_app/battle/widgets/enemies_loaded_widget.dart';
import 'package:dnd_rolls_app/battle/widgets/everyone_attacked_widget.dart';
import 'package:dnd_rolls_app/battle/widgets/selected_both_widget.dart';
import 'package:dnd_rolls_app/battle/widgets/selected_enemy_widget.dart';
import 'package:dnd_rolls_app/battle/widgets/selected_macros_widget.dart';
import 'package:dnd_rolls_app/core/widgets/wraps.dart';
import 'package:dnd_rolls_app/services/battle_service.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({Key? key}) : super(key: key);

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => BattleBloc(
            RepositoryProvider.of<BattleService>(context),
            RepositoryProvider.of<MacrosService>(context)),
        child:
            BlocConsumer<BattleBloc, BattleState>(listener: (context, state) {
          if (state is BattleIsOnState) {
            if (state.battle.enemies.isEmpty) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: Text(
                          'Бой завершён',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ));
            }
          }
        }, builder: ((context, state) {
          Widget widget = Container();
          if (state is BattleInitial) {
            widget = buildBattleInitial(context, state);
          } else if (state is EnemiesLoadedState) {
            widget = buildEnemiesLoaded(context, state);
          } else if (state is CharactersLoadedState) {
            widget = buildCharactersLoaded(context, state);
          } else if (state is BothLoadedState) {
            widget = buildBothLoaded(context, state);
          } else if (state is BattleIsOnState) {
            widget = buildBattleIsOn(context, state);
          } else if (state is SelectedEnemyState) {
            widget = buildSelectedEnemy(context, state);
          } else if (state is SelectedMacrosState) {
            widget = buildSelectedMacros(context, state);
          } else if (state is SelectedBothState) {
            widget = buildSelectedBoth(context, state);
          } else if (state is EveryoneAttackedState) {
            widget = buildEveryoneAttacked(context, state);
          } else if (state is BattleIsOverState) {
            widget = buildBattleIsOver(context, state);
          }
          return containerRadialGradienWrap(widget);
        })),
      ),
    );
  }
}
