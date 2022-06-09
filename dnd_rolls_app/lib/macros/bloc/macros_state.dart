part of 'macros_bloc.dart';

abstract class MacrosState extends Equatable {
  const MacrosState();
}

class MacrosInitial extends MacrosState {
  @override
  List<Object?> get props => [];
}

class MacrosLoadedState extends MacrosState {
  final List<Macros> macros;
  final String? error;

  const MacrosLoadedState(this.macros, {this.error});
  @override
  List<Object?> get props => [macros, error];
}

class RegisteringServiceState extends MacrosState {
  @override
  List<Object?> get props => [];
}
