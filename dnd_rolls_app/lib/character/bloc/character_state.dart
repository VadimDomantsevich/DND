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

class CharactersNamesLoadedState extends CharacterState {
  final List<String> names;

  const CharactersNamesLoadedState(this.names);
  @override
  List<Object?> get props => [names];
}

class GetCharacterState extends CharacterState {
  final Character character;

  const GetCharacterState(this.character);
  @override
  List<Object?> get props => [character];
}

class RegisteringServiceState extends CharacterState {
  @override
  List<Object> get props => [];
}
