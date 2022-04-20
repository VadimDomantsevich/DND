part of 'enemy_bloc.dart';

abstract class EnemyState extends Equatable {
  const EnemyState();
}

class EnemyInitial extends EnemyState {
  @override
  List<Object?> get props => [];
}

class EnemyLoadedState extends EnemyState {
  final List<Enemy> enemies;
  final String? error;

  const EnemyLoadedState(this.enemies, {this.error});
  @override
  List<Object?> get props => [enemies, error];
}

class SelectedEnemyState extends EnemyState {
  final List<Enemy> enemies;
  final List<Enemy> selectedEnemies;
  final List<int> selectedEnemiesCount;

  const SelectedEnemyState(
      this.enemies, this.selectedEnemies, this.selectedEnemiesCount);
  @override
  List<Object?> get props => [enemies, selectedEnemies, selectedEnemiesCount];
}

class RegisteringServiceState extends EnemyState {
  @override
  List<Object?> get props => [];
}
