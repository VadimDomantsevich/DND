import 'package:bloc/bloc.dart';
import 'package:dnd_rolls_app/battle/bloc/battle_bloc.dart';
import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_state.dart';
part 'character_event.dart';
part 'character_bloc.freezed.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterService _characterService;
  final MacrosService _macrosService;
  CharacterBloc(this._characterService, this._macrosService)
      : super(const CharacterState.initial()) {
    on<RegisterServiceEvent>(
      (event, emit) => _onRegisterServiceEvent(event, emit),
    );
    on<LoadCharactersEvent>(
      (event, emit) => _onLoadCharactersEvent(event, emit),
    );
    on<AddCharacterEvent>(
      (event, emit) => _onAddCharacterEvent(event, emit),
    );
    on<UpdateCharacterEvent>(
      (event, emit) => _onUpdateCharacterEvent(event, emit),
    );
    /* on<GetAllCharactersNamesEvent>(
      (event, emit) => _onGetAllCharactersNamesEvent(event, emit),
    );
    on<GetCharactersNamesEvent>(
      (event, emit) => _onGetCharactersNamesEvent(event, emit),
    );
    on<GetCharacterEvent>(
      (event, emit) => _onGetCharacterEvent(event, emit),
    );
    on<SelectCharacterEvent>(
      (event, emit) => _onSelectCharacterEvent(event, emit),
    );
    on<UnselectCharacterEvent>(
      (event, emit) => _onUnselectCharacterEvent(event, emit),
    ); */
    on<RemoveCharacterEvent>(
      (event, emit) => _onRemoveCharacterEvent(event, emit),
    );

    add(const RegisterServiceEvent());
  }

  Future<void> _onRegisterServiceEvent(
    RegisterServiceEvent event,
    Emitter<CharacterState> emit,
  ) async {
    await _characterService.init();
    await _macrosService.init();
    add(const LoadCharactersEvent());
  }

  void _onLoadCharactersEvent(
    LoadCharactersEvent event,
    Emitter<CharacterState> emit,
  ) {
    final characters = _characterService.getCharacters();
    emit(CharacterState.charactersLoaded(characters: characters));
  }

  void _onAddCharacterEvent(
    AddCharacterEvent event,
    Emitter<CharacterState> emit,
  ) {
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
        add(const LoadCharactersEvent());
        break;
      case CreationResult.failure:
        final characters = _characterService.getCharacters();
        emit(
          CharacterState.charactersLoaded(
            characters: characters,
            error: 'Не удалось создать',
          ),
        );
        break;
      case CreationResult.alreadyExists:
        final characters = _characterService.getCharacters();
        emit(
          CharacterState.charactersLoaded(
            characters: characters,
            error: 'Персонаж с таким именем уже существует',
          ),
        );
        break;
    }
  }

  Future<void> _onUpdateCharacterEvent(
    UpdateCharacterEvent event,
    Emitter<CharacterState> emit,
  ) async {
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
        add(const LoadCharactersEvent());
        break;
      case CreationResult.failure:
        final characters = _characterService.getCharacters();
        emit(
          CharacterState.charactersLoaded(
            characters: characters,
            error: 'Не удалось создать',
          ),
        );
        break;
      case CreationResult.alreadyExists:
        final characters = _characterService.getCharacters();
        emit(
          CharacterState.charactersLoaded(
            characters: characters,
            error: 'Персонаж с таким именем уже существует',
          ),
        );
        break;
    }
  }

  /* void _onGetAllCharactersNamesEvent(
    GetAllCharactersNamesEvent event,
    Emitter<CharacterState> emit,
  ) {
    final names = _characterService.getCharacters().map((e) => e.name).toList();
    emit(CharacterState.charactersNamesLoaded(names: names));
  }

  void _onGetCharactersNamesEvent(
    GetCharactersNamesEvent event,
    Emitter<CharacterState> emit,
  ) {
    final names = event.characters.map((e) => e.name).toList();
    emit(CharacterState.charactersNamesLoaded(names: names));
  }

  void _onGetCharacterEvent(
    GetCharacterEvent event,
    Emitter<CharacterState> emit,
  ) {
    final character = _characterService.getCharacter(event.characterName);
    emit(CharacterState.characterLoaded(character: character));
  }

  void _onSelectCharacterEvent(
    SelectCharacterEvent event,
    Emitter<CharacterState> emit,
  ) {
    final characters = _characterService.getCharacters();
    event.selectedCharacters.add(event.character);
    emit(
      CharacterState.charactersSelected(
        characters: characters,
        selectedCharacters: event.selectedCharacters,
      ),
    );
  }

  void _onUnselectCharacterEvent(
    UnselectCharacterEvent event,
    Emitter<CharacterState> emit,
  ) {
    if (event.selectedCharacters.isEmpty) {
      add(const LoadCharactersEvent());
    }
    final characters = _characterService.getCharacters();
    final index = event.selectedCharacters.indexOf(event.character);
    event.selectedCharacters.removeAt(index);

    event.selectedCharacters.isEmpty
        ? add(const LoadCharactersEvent())
        : emit(
            CharacterState.charactersSelected(
              characters: characters,
              selectedCharacters: event.selectedCharacters,
            ),
          );
  } */

  void _onRemoveCharacterEvent(
    RemoveCharacterEvent event,
    Emitter<CharacterState> emit,
  ) {
    _characterService.removeCharacter(event.name);
    add(const LoadCharactersEvent());
  }
}
