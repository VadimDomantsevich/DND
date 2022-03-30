part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class LoadCharacterEvent extends CharacterEvent {
  const LoadCharacterEvent();

  @override
  List<Object> get props => [];
}

class AddCharacterEvent extends CharacterEvent {
  final String name;
  final int skillBonus;
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;

  const AddCharacterEvent(
      this.name,
      this.skillBonus,
      this.strength,
      this.dexterity,
      this.constitution,
      this.intelligence,
      this.wisdom,
      this.charisma);
  @override
  List<Object> get props => [
        name,
        skillBonus,
        strength,
        dexterity,
        constitution,
        intelligence,
        wisdom,
        charisma
      ];
}

class UpdateCharacterEvent extends CharacterEvent {
  final String name;
  final String newName;
  final int skillBonus;
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;

  const UpdateCharacterEvent(
      this.name,
      this.newName,
      this.skillBonus,
      this.strength,
      this.dexterity,
      this.constitution,
      this.intelligence,
      this.wisdom,
      this.charisma);
  @override
  List<Object> get props => [
        name,
        newName,
        skillBonus,
        strength,
        dexterity,
        constitution,
        intelligence,
        wisdom,
        charisma
      ];
}

class RemoveCharacterEvent extends CharacterEvent {
  final String name;

  const RemoveCharacterEvent(this.name);
  @override
  List<Object> get props => [name];
}

class RegisterServiceEvent extends CharacterEvent {
  @override
  List<Object> get props => [];
}
