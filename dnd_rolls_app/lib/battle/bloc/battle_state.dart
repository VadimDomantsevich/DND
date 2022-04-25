part of 'battle_bloc.dart';

abstract class BattleState extends Equatable {
  const BattleState();

  @override
  List<Object> get props => [];
}

class BattleInitial extends BattleState {}

class CharactersLoadedState extends BattleState {
  final List<Character> characters;

  const CharactersLoadedState(this.characters);
  @override
  List<Object> get props => [characters];
}

class EnemiesLoadedState extends BattleState {
  final List<Enemy> enemies;

  const EnemiesLoadedState(this.enemies);
  @override
  List<Object> get props => [enemies];
}

class BothLoadedState extends BattleState {
  final List<Character> characters;
  final List<Enemy> enemies;

  const BothLoadedState(this.characters, this.enemies);
  @override
  List<Object> get props => [characters, enemies];
}

class BattleIsOnState extends BattleState {
  final Battle battle;
  const BattleIsOnState(this.battle);
  @override
  List<Object> get props => [battle];
}

class SelectedMacrosState extends BattleState {
  final Battle battle;
  final Macros selectedMacros;

  const SelectedMacrosState(this.battle, this.selectedMacros);
  @override
  List<Object> get props => [battle, selectedMacros];
}

class SelectedEnemyState extends BattleState {
  final Battle battle;
  final Enemy selectedEnemy;
  final int selectedIndex;
  const SelectedEnemyState(this.battle, this.selectedEnemy, this.selectedIndex);
  @override
  List<Object> get props => [battle, selectedEnemy, selectedIndex];
}

class SelectedBothState extends BattleState {
  final Battle battle;
  final Macros selectedMacros;
  final Enemy selectedEnemy;
  final int selectedIndex;

  const SelectedBothState(
      this.battle, this.selectedMacros, this.selectedEnemy, this.selectedIndex);
  @override
  List<Object> get props =>
      [battle, selectedMacros, selectedEnemy, selectedIndex];
}

class EveryoneAttackedState extends BattleState {
  final Battle battle;

  const EveryoneAttackedState(this.battle);
  @override
  List<Object> get props => [battle];
}
