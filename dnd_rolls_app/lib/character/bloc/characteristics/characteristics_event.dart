part of 'characteristics_bloc.dart';

abstract class CharacteristicsEvent extends Equatable {
  const CharacteristicsEvent();

  @override
  List<Object> get props => [];
}

class LoadCharacteristicsEvent extends CharacteristicsEvent {
  final String name;

  const LoadCharacteristicsEvent(this.name);
  @override
  List<Object> get props => [name];
}

class ChangeCharacteristicEvent extends CharacteristicsEvent {
  final int? strength;
  final int? dexterity;
  final int? constitution;
  final int? intelligence;
  final int? wisdom;
  final int? charisma;
  final String name;

  const ChangeCharacteristicEvent(
      {this.strength,
      this.dexterity,
      this.constitution,
      this.intelligence,
      this.wisdom,
      this.charisma,
      required this.name});
  @override
  List<Object> get props => [name];
}
