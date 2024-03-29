import 'package:bloc/bloc.dart';
import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterService _characterService;
  final MacrosService _macrosService;
  CharacterBloc(this._characterService, this._macrosService)
      : super(RegisteringServiceState()) {
    on<RegisterServiceEvent>((event, emit) async {
      await _characterService.init();
      await _macrosService.init();
      add(const LoadCharacterEvent());
    });
    on<LoadCharacterEvent>((event, emit) {
      final characters = _characterService.getCharacters();
      emit(CharacterLoadedState(characters));
    });
    on<AddCharacterEvent>((event, emit) {
      final result = _characterService.addCharacter(
        event.name,
        event.skillBonus,
        event.strength,
        event.dexterity,
        event.constitution,
        event.intelligence,
        event.wisdom,
        event.charisma,
      );
      switch (result) {
        case CreationResult.success:
          add(const LoadCharacterEvent());
          break;
        case CreationResult.failure:
          final characters = _characterService.getCharacters();
          emit(CharacterLoadedState(characters, error: 'Не удалось создать'));
          break;
        case CreationResult.alreadyExists:
          final characters = _characterService.getCharacters();
          emit(
            CharacterLoadedState(
              characters,
              error: 'Персонаж с таким именем уже существует',
            ),
          );
          break;
      }
    });
    on<UpdateCharacterEvent>((event, emit) async {
      final result = await _characterService.updateCharacter(
        event.name,
        event.newName,
        event.skillBonus,
        event.strength,
        event.dexterity,
        event.constitution,
        event.intelligence,
        event.wisdom,
        event.charisma,
      );
      switch (result) {
        case CreationResult.success:
          if (event.name != event.newName) {
            final oldMacros = _macrosService.getCharacterMacros(event.name);
            for (final macros in oldMacros) {
              _macrosService.updateMacrosCharacterName(
                macros.name,
                macros.characterName,
                event.newName,
              );
            }
          }
          add(const LoadCharacterEvent());
          break;
        case CreationResult.failure:
          final characters = _characterService.getCharacters();
          emit(
            CharacterLoadedState(
              characters,
              error: 'Не удалось отредактировать',
            ),
          );
          break;
        case CreationResult.alreadyExists:
          final characters = _characterService.getCharacters();
          emit(
            CharacterLoadedState(
              characters,
              error: 'Персонаж с таким именем уже существует',
            ),
          );
          break;
      }
    });
    on<GetAllCharactersNamesEvent>((event, emit) async {
      if (!Hive.isAdapterRegistered(1)) {
        await _characterService.init();
      }

      final names =
          _characterService.getCharacters().map((e) => e.name).toList();
      emit(CharactersNamesLoadedState(names));
    });
    on<GetCharactersNamesEvent>((event, emit) async {
      if (!Hive.isAdapterRegistered(1)) {
        await _characterService.init();
      }
      final names = event.characters.map((e) => e.name).toList();
      emit(CharactersNamesLoadedState(names));
    });
    on<GetCharacterEvent>((event, emit) {
      final character = _characterService.getCharacter(event.characterName);
      emit(GetCharacterState(character));
    });
    on<SelectCharacterEvent>((event, emit) {
      final characters = _characterService.getCharacters();
      event.selectedCharacters.add(event.character);
      emit(SelectedCharacterState(characters, event.selectedCharacters));
    });
    on<UnselectCharacterEvent>((event, emit) {
      if (event.selectedCharacters.isEmpty) {
        add(const LoadCharacterEvent());
      }
      final characters = _characterService.getCharacters();
      final index = event.selectedCharacters.indexOf(event.character);
      event.selectedCharacters.removeAt(index);

      event.selectedCharacters.isEmpty
          ? add(const LoadCharacterEvent())
          : emit(SelectedCharacterState(characters, event.selectedCharacters));
    });
    on<RemoveCharacterEvent>((event, emit) {
      _characterService.removeCharacter(event.name);
      add(const LoadCharacterEvent());
    });

    add(RegisterServiceEvent());
  }
}
