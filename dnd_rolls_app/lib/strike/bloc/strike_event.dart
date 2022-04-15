part of 'strike_bloc.dart';

abstract class StrikeEvent extends Equatable {
  const StrikeEvent();

  @override
  List<Object> get props => [];
}

class LoadStrikesEvent extends StrikeEvent {
  final Character character;
  final Weapon weapon;

  const LoadStrikesEvent(this.character, this.weapon);
  @override
  List<Object> get props => [character, weapon];
}

class SelectStrikeEvent extends StrikeEvent {
  final Character character;
  final Weapon weapon;
  final Strike strike;

  const SelectStrikeEvent(this.strike, this.character, this.weapon);
  @override
  List<Object> get props => [character, weapon, strike];
}

class RegisterServiceEvent extends StrikeEvent {
  final Character character;
  final Weapon weapon;

  const RegisterServiceEvent(this.character, this.weapon);
  @override
  List<Object> get props => [];
}
