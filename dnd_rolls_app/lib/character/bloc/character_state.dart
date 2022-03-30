part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();
}

class CharacterInitial extends CharacterState {
  @override
  List<Object?> get props => [];
}

class CharacterLoadedState extends CharacterState {
  final List<Character> characters;
  final String? error;
  const CharacterLoadedState(this.characters, {this.error});

  @override
  List<Object?> get props => [characters, error];
}

class RegisteringServiceState extends CharacterState {
  @override
  List<Object> get props => [];
}
