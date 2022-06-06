part of 'edit_character_bloc.dart';

@freezed
class EditCharacterEvent with _$EditCharacterEvent {
  const factory EditCharacterEvent.init({
    Character? character,
  }) = InitEvent;
  const factory EditCharacterEvent.incrementSkillBonus() =
      IncrementSkillBonusEvent;
  const factory EditCharacterEvent.decrementSkillBonus() =
      DecrementSkillBonusEvent;
  const factory EditCharacterEvent.incrementCharacteristic({
    required CharacteristicsEnum characteristic,
  }) = IncrementCharacteristicEvent;
  const factory EditCharacterEvent.decrementCharacteristic({
    required CharacteristicsEnum characteristic,
  }) = DecrementCharacteristicEvent;
  const factory EditCharacterEvent.submitForm({
    Character? character,
    required String? name,
    required int skillBonus,
    required int strength,
    required int dexterity,
    required int constitution,
    required int intelligence,
    required int wisdom,
    required int charisma,
  }) = SubmitFormEvent;
}
