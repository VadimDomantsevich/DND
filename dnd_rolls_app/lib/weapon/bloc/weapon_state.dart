part of 'weapon_bloc.dart';

abstract class WeaponState extends Equatable {
  const WeaponState();
}

class WeaponInitial extends WeaponState {
  @override
  List<Object?> get props => [];
}

class WeaponLoadedState extends WeaponState {
  final List<Weapon> weapons;
  final String? error;

  const WeaponLoadedState(this.weapons, {this.error});
  @override
  List<Object?> get props => [weapons, error];
}

class RegisteringServiceState extends WeaponState {
  @override
  List<Object> get props => [];
}
