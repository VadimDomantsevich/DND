part of 'characteristics_bloc.dart';

abstract class CharacteristicsState extends Equatable {
  const CharacteristicsState();

  @override
  List<Object> get props => [];
}

class CharacteristicsInitial extends CharacteristicsState {}

class CharacteristicsLoadedState extends CharacteristicsState {
  final String name;
  final Characteristics characteristics;
  const CharacteristicsLoadedState(this.name, this.characteristics);
  @override
  List<Object> get props => [name, characteristics];
}
