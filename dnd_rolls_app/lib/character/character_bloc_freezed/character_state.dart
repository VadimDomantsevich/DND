part of 'character_bloc.dart';

@freezed
class CharacterState with _$CharacterState {
  const factory CharacterState.initial() = _Initial;
  const factory CharacterState.charactersLoaded({
    required List<Character> characters,
    String? error,
  }) = _CharactersLoadedState;
  /* const factory CharacterState.charactersNamesLoaded({
    required List<String> names,
  }) = _CharactersNamesLoadedState;
  const factory CharacterState.characterLoaded({
    required Character character,
  }) = _CharacterLoadedState;
  const factory CharacterState.charactersSelected({
    required List<Character> characters,
    required List<Character> selectedCharacters,
  }) = _CharactersSelectedState; */
}
