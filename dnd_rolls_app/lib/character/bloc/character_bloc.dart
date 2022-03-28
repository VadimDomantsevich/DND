import 'package:bloc/bloc.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:equatable/equatable.dart';

import '../../model/character.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterService _characterService;
  CharacterBloc(this._characterService) : super(RegisteringServiceState()) {
    on<RegisterServiceEvent>((event, emit) async {
      await _characterService.init();
      add(const LoadCharacterEvent());
    });
    on<LoadCharacterEvent>((event, emit) {
      final characters = _characterService.getCharacters();
      emit(CharacterLoadedState(characters));
    });
    on<AddCharacterEvent>((event, emit) {
      _characterService.addCharacter(
          event.name,
          event.skillBonus,
          event.strength,
          event.dexterity,
          event.constitution,
          event.intelligence,
          event.wisdom,
          event.charisma);
      add(const LoadCharacterEvent());
    });
    on<UpdateCharacterEvent>((event, emit) {
      _characterService.updateCharacter(
          event.name,
          event.newName,
          event.skillBonus,
          event.strength,
          event.dexterity,
          event.constitution,
          event.intelligence,
          event.wisdom,
          event.charisma);
      add(const LoadCharacterEvent());
    });
    on<RemoveCharacterEvent>((event, emit) {
      _characterService.removeCharacter(event.name);
      add(const LoadCharacterEvent());
    });
  }
}
