import 'package:dnd_rolls_app/battle/bloc/battle_bloc.dart';
import 'package:dnd_rolls_app/battle/widgets/both_loaded_widget.dart';
import 'package:dnd_rolls_app/battle/widgets/build_battle_initial.dart';
import 'package:dnd_rolls_app/battle/widgets/characters_loaded_widget.dart';
import 'package:dnd_rolls_app/battle/widgets/enemies_loaded_widget.dart';
import 'package:dnd_rolls_app/services/battle_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({Key? key}) : super(key: key);

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            BattleBloc(RepositoryProvider.of<BattleService>(context)),
        child: BlocBuilder<BattleBloc, BattleState>(builder: ((context, state) {
          if (state is BattleInitial) {
            return buildBattleInitial(context, state);
          } else if (state is EnemiesLoadedState) {
            return buildEnemiesLoaded(context, state);
          } else if (state is CharactersLoadedState) {
            return buildCharactersLoaded(context, state);
          } else if (state is BothLoadedState) {
            return buildBothLoaded(context, state);
          }
          return Container();
        })),
      ),
    );
  }
}
