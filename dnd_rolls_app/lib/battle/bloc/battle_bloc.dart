import 'package:bloc/bloc.dart';
import 'package:dnd_rolls_app/model/battle.dart';
import 'package:dnd_rolls_app/model/battle_log.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/model/enemy.dart';
import 'package:dnd_rolls_app/model/macros.dart';
import 'package:dnd_rolls_app/services/battle_service.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:dnd_rolls_app/services/strike_service.dart';
import 'package:equatable/equatable.dart';

part 'battle_event.dart';
part 'battle_state.dart';

class BattleBloc extends Bloc<BattleEvent, BattleState> {
  final BattleService _battleService;
  final MacrosService _macrosService;
  BattleBloc(this._battleService, this._macrosService)
      : super(BattleInitial()) {
    on<LoadCharactersEvent>((event, emit) {
      _battleService.battle.characters.clear();
      _battleService.updateCharacters(event.characters);
      _battleService.battle.whoAttacked.clear();
      if (_battleService.battle.enemies.isNotEmpty) {
        emit(BothLoadedState(
            _battleService.battle.characters, _battleService.battle.enemies));
      } else {
        emit(CharactersLoadedState(_battleService.battle.characters));
      }
    });
    on<LoadEnemiesEvent>((event, emit) {
      _battleService.updateEnemies(event.enemies);
      if (_battleService.battle.characters.isNotEmpty) {
        emit(BothLoadedState(
            _battleService.battle.characters, _battleService.battle.enemies));
      } else {
        emit(EnemiesLoadedState(_battleService.battle.enemies));
      }
    });
    on<StartBattleEvent>((event, emit) {
      _battleService.updateBattleLogs(BattleLog('Начало 1 хода'));
      emit(BattleIsOnState(_battleService.battle));
    });
    on<SelectMacrosEvent>((event, emit) {
      if (event.selectedEnemy != null) {
        emit(SelectedBothState(_battleService.battle, event.selectedMacros,
            event.selectedEnemy!, event.selectedIndex!));
      } else {
        emit(SelectedMacrosState(_battleService.battle, event.selectedMacros));
      }
    });
    on<SelectEnemyEvent>((event, emit) {
      if (event.selectedMacros != null) {
        emit(SelectedBothState(_battleService.battle, event.selectedMacros!,
            event.selectedEnemy, event.selectedIndex));
      } else {
        emit(SelectedEnemyState(
            _battleService.battle, event.selectedEnemy, event.selectedIndex));
      }
    });
    on<AttackEvent>((event, emit) {
      final StrikeService _strikeService = StrikeService();
      BattleLog battleLog;
      final selectedMacrosStrikes = _macrosService
          .getMacros(
              event.selectedMacros.name, event.selectedMacros.characterName)
          .strikes;
      for (var strike in selectedMacrosStrikes) {
        battleLog = _strikeService.attack(strike, event.selectedEnemy);
        if (battleLog.damage != null) {
          _battleService.battle.currentHealth[event.selectedIndex] -=
              battleLog.damage!;
        }
        _battleService.updateBattleLogs(battleLog);
      }
      if (_battleService.battle.currentHealth[event.selectedIndex] <= 0) {
        _battleService.battle.currentHealth.removeAt(event.selectedIndex);

        _battleService.battle.defeatedEnemies.add(event.selectedEnemy);
        _battleService.battle.enemies.removeAt(event.selectedIndex);
        if (_battleService.battle.enemies.isEmpty) {
          emit(BattleIsOverState(_battleService.battle));
        } else {
          _battleService.characterAttacked(_battleService.battle.characters
              .firstWhere((element) =>
                  element.name == event.selectedMacros.characterName));
          _battleService.isEveryoneAttacked()
              ? emit(EveryoneAttackedState(_battleService.battle))
              : emit(BattleIsOnState(_battleService.battle));
        }
      } else {
        _battleService.characterAttacked(_battleService.battle.characters
            .firstWhere((element) =>
                element.name == event.selectedMacros.characterName));
        _battleService.isEveryoneAttacked()
            ? emit(EveryoneAttackedState(_battleService.battle))
            : emit(BattleIsOnState(_battleService.battle));
      }
    });
    on<NextTurnEvent>((event, emit) {
      _battleService.startTurn();
      emit(BattleIsOnState(_battleService.battle));
    });
    on<EndBattleEvent>((event, emit) {
      _battleService.battle.battleLogs.clear();
      _battleService.battle.defeatedEnemies.clear();
      _battleService.battle.whoAttacked.clear();
      _battleService.battle.turn = 1;
      emit(BattleInitial());
    });
  }
}
