import 'package:bloc/bloc.dart';
import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/model/enemy.dart';
import 'package:dnd_rolls_app/services/enemy_service.dart';
import 'package:equatable/equatable.dart';

part 'enemy_event.dart';
part 'enemy_state.dart';

class EnemyBloc extends Bloc<EnemyEvent, EnemyState> {
  final EnemyService _enemyService;
  EnemyBloc(this._enemyService) : super(RegisteringServiceState()) {
    on<RegisterServiceEvent>((event, emit) async {
      await _enemyService.init();
      add(const LoadEnemyEvent());
    });
    on<LoadEnemyEvent>((event, emit) {
      final enemies = _enemyService.getEnemies();
      emit(EnemyLoadedState(enemies));
    });
    on<AddEnemyEvent>((event, emit) {
      final result =
          _enemyService.addEnemy(event.name, event.health, event.armorClass);
      switch (result) {
        case CreationResult.success:
          add(const LoadEnemyEvent());
          break;
        case CreationResult.failure:
          final enemies = _enemyService.getEnemies();
          emit(EnemyLoadedState(enemies, error: 'Не удалось создать'));
          break;
        case CreationResult.alreadyExists:
          final enemies = _enemyService.getEnemies();
          emit(EnemyLoadedState(enemies,
              error: 'Противник с таким именем уже существует'));
          break;
      }
    });
    on<UpdateEnemyEvent>((event, emit) async {
      final result = await _enemyService.updateEnemy(
          event.name, event.newName, event.health, event.armorClass);
      switch (result) {
        case CreationResult.success:
          add(const LoadEnemyEvent());
          break;
        case CreationResult.failure:
          final enemies = _enemyService.getEnemies();
          emit(EnemyLoadedState(enemies, error: 'Не удалось отредактировать'));
          break;
        case CreationResult.alreadyExists:
          final enemies = _enemyService.getEnemies();
          emit(EnemyLoadedState(enemies,
              error: 'Противник с таким именем уже существует'));
          break;
      }
    });
    on<SelectEnemyEvent>((event, emit) {
      final enemies = _enemyService.getEnemies();
      event.selectedEnemies.add(event.enemy);
      event.selectedEnemiesCount.add(1);
      emit(SelectedEnemyState(
          enemies, event.selectedEnemies, event.selectedEnemiesCount));
    });
    on<UpdateSelectedEnemyCount>((event, emit) {
      final enemies = _enemyService.getEnemies();
      emit(SelectedEnemyState(
          enemies, event.selectedEnemies, event.selectedEnemiesCount));
    });
    on<UnselectEnemyEvent>((event, emit) {
      if (event.selectedEnemies.isEmpty) {
        add(const LoadEnemyEvent());
      }
      final enemies = _enemyService.getEnemies();
      final index = event.selectedEnemies.indexOf(event.enemy);
      event.selectedEnemies.removeAt(index);
      event.selectedEnemiesCount.removeAt(index);

      event.selectedEnemies.isEmpty
          ? add(const LoadEnemyEvent())
          : emit(SelectedEnemyState(
              enemies, event.selectedEnemies, event.selectedEnemiesCount));
    });
    on<RemoveEnemyEvent>((event, emit) async {
      await _enemyService.removeEnemy(event.name);
      add(const LoadEnemyEvent());
    });
  }
}
