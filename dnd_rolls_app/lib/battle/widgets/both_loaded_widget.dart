import 'package:dnd_rolls_app/battle/bloc/battle_bloc.dart';
import 'package:dnd_rolls_app/character/choose_character_screen.dart';
import 'package:dnd_rolls_app/enemy/choose_enemy_screen.dart';
import 'package:dnd_rolls_app/macros/characters_macros_screen.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/model/enemy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildBothLoaded(BuildContext context, BothLoadedState state) {
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
                        'Бой',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: ListView(
                          children: [
                            CharactersMacrosScreen(
                                characters: state.characters,
                                isSelectable: false,),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Center(
                                child: ElevatedButton(
                                    onPressed: () async {
                                      List<Character> characters =
                                          await showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  const Dialog(
                                                    child:
                                                        ChooseCharacterScreen(),
                                                  ));
                                      if (characters.isNotEmpty) {
                                        BlocProvider.of<BattleBloc>(context)
                                            .add(LoadCharactersEvent(
                                                characters));
                                      }
                                    },
                                    child: const Text('Выбрать персонажей')),
                              ),
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
                            children: [
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.enemies.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(state.enemies[index].name),
                                    );
                                  }),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Center(
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        List<Enemy> enemies = await showDialog(
                                            context: context,
                                            builder: (context) => const Dialog(
                                                  child: ChooseEnemyScreen(),
                                                ));
                                        if (enemies.isNotEmpty) {
                                          BlocProvider.of<BattleBloc>(context)
                                              .add(LoadEnemiesEvent(enemies));
                                        }
                                      },
                                      child: const Text('Выбрать врагов')),
                                ),
                              ),
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
                BlocProvider.of<BattleBloc>(context)
                    .add(const StartBattleEvent());
              },
              child: const Text('Начать бой')),
        )
      ],
    ),
  );
}
