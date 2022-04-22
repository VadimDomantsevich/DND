part of 'battle_bloc.dart';

abstract class BattleEvent extends Equatable {
  const BattleEvent();

  @override
  List<Object?> get props => [];
}

class LoadCharactersEvent extends BattleEvent {
  final List<Character> characters;

  const LoadCharactersEvent(this.characters);
  @override
  List<Object?> get props => [characters];
}

class LoadEnemiesEvent extends BattleEvent {
  final List<Enemy> enemies;

  const LoadEnemiesEvent(this.enemies);
  @override
  List<Object?> get props => [enemies];
}

class StartBattleEvent extends BattleEvent {
  const StartBattleEvent();
  @override
  List<Object?> get props => [];
}

class SelectMacrosEvent extends BattleEvent {
  final Battle battle;
  final Macros selectedMacros;
  final Enemy? selectedEnemy;

  const SelectMacrosEvent(this.battle, this.selectedMacros,
      {this.selectedEnemy});
  @override
  List<Object?> get props => [battle, selectedMacros, selectedEnemy];
}

class SelectEnemyEvent extends BattleEvent {
  final Battle battle;
  final Enemy selectedEnemy;
  final Macros? selectedMacros;

  const SelectEnemyEvent(this.battle, this.selectedEnemy,
      {this.selectedMacros});
  @override
  List<Object?> get props => [battle, selectedEnemy, selectedMacros];
}

class AttackEvent extends BattleEvent {
  final Battle battle;
  final Macros selectedMacros;
  final Enemy selectedEnemy;

  const AttackEvent(
      this.battle, this.selectedMacros, this.selectedEnemy);
  @override
  List<Object?> get props => [battle, selectedMacros, selectedEnemy];
}

class NextTurnEvent extends BattleEvent {
  final Battle battle;

  const NextTurnEvent(this.battle);
  @override
  List<Object?> get props => [battle];
}
