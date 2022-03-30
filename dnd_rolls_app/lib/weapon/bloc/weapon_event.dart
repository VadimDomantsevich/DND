part of 'weapon_bloc.dart';

abstract class WeaponEvent extends Equatable {
  const WeaponEvent();

  @override
  List<Object> get props => [];
}

class LoadWeaponEvent extends WeaponEvent {
  const LoadWeaponEvent();
  @override
  List<Object> get props => [];
}

class AddWeaponEvent extends WeaponEvent {
  final String name;
  final DamageCube damage;
  final CharacteristicsEnum characteristic;

  const AddWeaponEvent(this.name, this.damage, this.characteristic);
  @override
  List<Object> get props => [name, damage, characteristic];
}

class UpdateWeaponEvent extends WeaponEvent {
  final String name;
  final String newName;
  final DamageCube damage;
  final CharacteristicsEnum characteristic;

  const UpdateWeaponEvent(
      this.name, this.newName, this.damage, this.characteristic);
  @override
  List<Object> get props => [name, newName, damage, characteristic];
}

class RemoveWeaponEvent extends WeaponEvent {
  final String name;

  const RemoveWeaponEvent(this.name);
  @override
  List<Object> get props => [name];
}

class RegisterServiceEvent extends WeaponEvent {
  @override
  List<Object> get props => [];
}
