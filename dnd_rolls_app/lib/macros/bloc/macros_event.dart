part of 'macros_bloc.dart';

abstract class MacrosEvent extends Equatable {
  const MacrosEvent();

  @override
  List<Object> get props => [];
}

class LoadAllMacrosEvent extends MacrosEvent {
  const LoadAllMacrosEvent();
  @override
  List<Object> get props => [];
}

class LoadCharacterMacrosEvent extends MacrosEvent {
  final String characterName;
  const LoadCharacterMacrosEvent(this.characterName);
  @override
  List<Object> get props => [characterName];
}

class AddMacrosEvent extends MacrosEvent {
  final String name;
  final String characterName;
  final List<Strike> strikes;

  const AddMacrosEvent(this.name, this.characterName, this.strikes);
  @override
  List<Object> get props => [name, characterName, strikes];
}

class UpdateMacrosEvent extends MacrosEvent {
  final String name;
  final String newName;
  final String characterName;
  final List<Strike> strikes;

  const UpdateMacrosEvent(
      this.name, this.newName, this.characterName, this.strikes);
  @override
  List<Object> get props => [name, newName, characterName, strikes];
}

class RemoveMacrosEvent extends MacrosEvent {
  final String name;
  final String characterName;
  const RemoveMacrosEvent(this.name, this.characterName);
  @override
  List<Object> get props => [name];
}

class RegisterServiceEvent extends MacrosEvent {
  @override
  List<Object> get props => [];
}
