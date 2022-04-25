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
  final Macros selectedMacros;
  final Enemy? selectedEnemy;
  final int? selectedIndex;
  const SelectMacrosEvent(this.selectedMacros,
      {this.selectedEnemy, this.selectedIndex});
  @override
  List<Object?> get props => [selectedMacros, selectedEnemy, selectedIndex];
}

class SelectEnemyEvent extends BattleEvent {
  final Enemy selectedEnemy;
  final int selectedIndex;
  final Macros? selectedMacros;

  const SelectEnemyEvent(this.selectedEnemy, this.selectedIndex,
      {this.selectedMacros});
  @override
  List<Object?> get props => [selectedEnemy, selectedIndex, selectedMacros];
}

class AttackEvent extends BattleEvent {
  final Macros selectedMacros;
  final Enemy selectedEnemy;
  final int selectedIndex;

  const AttackEvent(
      this.selectedMacros, this.selectedEnemy, this.selectedIndex);
  @override
  List<Object?> get props => [selectedMacros, selectedEnemy, selectedIndex];
}

class NextTurnEvent extends BattleEvent {
  final Battle battle;

  const NextTurnEvent(this.battle);
  @override
  List<Object?> get props => [battle];
}
