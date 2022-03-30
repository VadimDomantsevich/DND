part of 'weapon_bloc.dart';

abstract class WeaponState extends Equatable {
  const WeaponState();

  @override
  List<Object> get props => [];
}

class WeaponInitial extends WeaponState {}

class WeaponLoadedState extends WeaponState {
  final List<Weapon> weapons;

  const WeaponLoadedState(this.weapons);
  @override
  List<Object> get props => [weapons];
}

class RegisteringServiceState extends WeaponState {
  @override
  List<Object> get props => [];
}
