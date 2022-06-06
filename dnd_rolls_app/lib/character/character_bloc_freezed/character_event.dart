part of 'character_bloc.dart';

@freezed
class CharacterEvent with _$CharacterEvent {
  const factory CharacterEvent.loadCharacters() = LoadCharactersEvent;

  const factory CharacterEvent.getAllCharactersNames() =
      GetAllCharactersNamesEvent;

  const factory CharacterEvent.getCharactersNames({
    required List<Character> characters,
  }) = GetCharactersNamesEvent;

  const factory CharacterEvent.getCharacter({
    required String characterName,
  }) = GetCharacterEvent;

  const factory CharacterEvent.addCharacter({
    required String name,
    required int skillBonus,
    required int strength,
    required int dexterity,
    required int constitution,
    required int intelligence,
    required int wisdom,
    required int charisma,
  }) = AddCharacterEvent;

  const factory CharacterEvent.updateCharacter({
    required String name,
    required String newName,
    required int skillBonus,
    required int strength,
    required int dexterity,
    required int constitution,
    required int intelligence,
    required int wisdom,
    required int charisma,
  }) = UpdateCharacterEvent;

  const factory CharacterEvent.selectCharacter({
    required Character character,
    required List<Character> selectedCharacters,
  }) = SelectCharacterEvent;

  const factory CharacterEvent.unselectCharacter({
    required Character character,
    required List<Character> selectedCharacters,
  }) = UnselectCharacterEvent;

  const factory CharacterEvent.removeCharacter({
    required String name,
  }) = RemoveCharacterEvent;

  const factory CharacterEvent.registerService() = RegisterServiceEvent;
}
