import 'package:bloc/bloc.dart';
import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/model/macros.dart';
import 'package:dnd_rolls_app/model/strike.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:equatable/equatable.dart';

part 'macros_event.dart';
part 'macros_state.dart';

class MacrosBloc extends Bloc<MacrosEvent, MacrosState> {
  final MacrosService _macrosService;
  MacrosBloc(this._macrosService) : super(RegisteringServiceState()) {
    on<RegisterServiceEvent>((event, emit) async {
      await _macrosService.init();
      add(const LoadAllMacrosEvent());
    });
    on<LoadCharacterMacrosEvent>((event, emit) {
      final macros = _macrosService.getCharacterMacros(event.characterName);
      emit(MacrosLoadedState(macros));
    });
    on<LoadAllMacrosEvent>((event, emit) {
      final macros = _macrosService.getAllMacros();
      emit(MacrosLoadedState(macros));
    });
    on<AddMacrosEvent>((event, emit) {
      final result = _macrosService.addMacros(
          event.name, event.characterName, event.strikes);
      switch (result) {
        case CreationResult.success:
          add(LoadCharacterMacrosEvent(event.characterName));
          break;
        case CreationResult.failure:
          final macros = _macrosService.getAllMacros();
          emit(MacrosLoadedState(macros, error: 'Не удалось создать'));
          break;
        case CreationResult.alreadyExists:
          final macros = _macrosService.getAllMacros();
          emit(MacrosLoadedState(macros,
              error: 'Макрос с таким именем уже существует'));
          break;
      }
    });
    on<UpdateMacrosEvent>((event, emit) async {
      final result = await _macrosService.updateMacros(
          event.name, event.newName, event.characterName, event.strikes);
      switch (result) {
        case CreationResult.success:
          add(LoadCharacterMacrosEvent(event.characterName));
          break;
        case CreationResult.failure:
          final macros = _macrosService.getAllMacros();
          emit(MacrosLoadedState(macros, error: 'Не удалось отредактировать'));
          break;
        case CreationResult.alreadyExists:
          final macros = _macrosService.getAllMacros();
          emit(MacrosLoadedState(macros,
              error: 'Макрос с таким именем уже существует'));
          break;
      }
    });
    on<RemoveMacrosEvent>((event, emit) async {
      await _macrosService.removeMacros(event.name);
      add(const LoadAllMacrosEvent());
    });
  }
}
