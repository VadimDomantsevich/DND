part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoadedState extends CharacterState {
  final List<Character> characters;

  const CharacterLoadedState(this.characters);

  @override
  List<Object> get props => [characters];
}
