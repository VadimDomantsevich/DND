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

class RegisteringServiceState extends EnemyState {
  @override
  List<Object?> get props => [];
}
