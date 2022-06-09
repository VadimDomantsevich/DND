part of 'edit_character_bloc.dart';

@freezed
class EditCharacterState with _$EditCharacterState {
  const factory EditCharacterState.editing({
    Character? character,
    required String? name,
    required int skillBonus,
    required int strength,
    required int dexterity,
    required int constitution,
    required int intelligence,
    required int wisdom,
    required int charisma,
  }) = _EditingState;
  const factory EditCharacterState.emptyName({
    Character? character,
    required String? name,
    required int skillBonus,
    required int strength,
    required int dexterity,
    required int constitution,
    required int intelligence,
    required int wisdom,
    required int charisma,
  }) = _EmptyNameState;
  const factory EditCharacterState.nameAlreadyExists({
    Character? character,
    required String? name,
    required int skillBonus,
    required int strength,
    required int dexterity,
    required int constitution,
    required int intelligence,
    required int wisdom,
    required int charisma,
  }) = _NameAlreadyExistsState;
  const factory EditCharacterState.valid({
    Character? character,
    required String? name,
    required int skillBonus,
    required int strength,
    required int dexterity,
    required int constitution,
    required int intelligence,
    required int wisdom,
    required int charisma,
  }) = _ValidState;
}
