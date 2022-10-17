part of 'enemy_bloc.dart';

abstract class EnemyEvent extends Equatable {
  const EnemyEvent();

  @override
  List<Object> get props => [];
}

class LoadEnemyEvent extends EnemyEvent {
  const LoadEnemyEvent();
  @override
  List<Object> get props => [];
}

class AddEnemyEvent extends EnemyEvent {
  final String name;
  final int health;
  final int armorClass;

  const AddEnemyEvent(this.name, this.health, this.armorClass);
  @override
  List<Object> get props => [name, health, armorClass];
}

class UpdateEnemyEvent extends EnemyEvent {
  final String name;
  final String newName;
  final int health;
  final int armorClass;

  const UpdateEnemyEvent(this.name, this.newName, this.health, this.armorClass);
  @override
  List<Object> get props => [name, newName, health, armorClass];
}

class RemoveEnemyEvent extends EnemyEvent {
  final String name;

  const RemoveEnemyEvent(this.name);
  @override
  List<Object> get props => [name];
}

class SelectEnemyEvent extends EnemyEvent {
  final Enemy enemy;
  final List<Enemy> selectedEnemies;
  final List<int> selectedEnemiesCount;
  const SelectEnemyEvent(
      this.enemy, this.selectedEnemies, this.selectedEnemiesCount);
  @override
  List<Object> get props => [enemy, selectedEnemies, selectedEnemiesCount];
}

class UpdateSelectedEnemyCount extends EnemyEvent {
  final List<Enemy> selectedEnemies;
  final List<int> selectedEnemiesCount;

  const UpdateSelectedEnemyCount(
      this.selectedEnemies, this.selectedEnemiesCount);
  @override
  List<Object> get props => [selectedEnemies, selectedEnemiesCount];
}

class UnselectEnemyEvent extends EnemyEvent {
  final Enemy enemy;
  final List<Enemy> selectedEnemies;
  final List<int> selectedEnemiesCount;
  const UnselectEnemyEvent(
      this.enemy, this.selectedEnemies, this.selectedEnemiesCount);
  @override
  List<Object> get props => [enemy, selectedEnemies, selectedEnemiesCount];
}

class RegisterServiceEvent extends EnemyEvent {
  @override
  List<Object> get props => [];
}
