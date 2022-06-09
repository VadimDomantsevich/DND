part of 'strike_bloc.dart';

abstract class StrikeState extends Equatable {
  const StrikeState();

  @override
  List<Object> get props => [];
}

class StrikeInitial extends StrikeState {}

class StrikeLoadedState extends StrikeState {
  final List<Strike> strikes;

  const StrikeLoadedState(this.strikes);
  @override
  List<Object> get props => [strikes];
}

class SelectedStrikeState extends StrikeState {
  final List<Strike> strikes;
  final Strike strike;

  const SelectedStrikeState(this.strikes, this.strike);
  @override
  List<Object> get props => [strikes, strike];
}

class RegisteringServiceState extends StrikeState {
  @override
  List<Object> get props => [];
}
