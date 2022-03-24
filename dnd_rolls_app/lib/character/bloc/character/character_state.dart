part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharactersLoadedState extends CharacterState {
  final List<Character> characters;

  const CharactersLoadedState(this.characters);

  @override
  List<Object> get props => [characters];
}

class RegisteringServiceState extends CharacterState {
  @override
  List<Object> get props => [];
}
