part of 'weapon_bloc.dart';

abstract class WeaponEvent extends Equatable {
  const WeaponEvent();
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
  final PhysicalTypeOfDamage typeOfDamage;

  const AddWeaponEvent(
      this.name, this.damage, this.characteristic, this.typeOfDamage);
  @override
  List<Object> get props => [name, damage, characteristic, typeOfDamage];
}

class UpdateWeaponEvent extends WeaponEvent {
  final String name;
  final String newName;
  final DamageCube damage;
  final CharacteristicsEnum characteristic;
  final PhysicalTypeOfDamage typeOfDamage;
  final List<Enchantment>? enchantments;

  const UpdateWeaponEvent(this.name, this.newName, this.damage,
      this.characteristic, this.typeOfDamage, this.enchantments);
  @override
  List<Object> get props =>
      [name, newName, damage, characteristic, typeOfDamage];
}

class EnchantWeaponEvent extends WeaponEvent {
  final Weapon weapon;
  final List<Enchantment>? enchantments;

  const EnchantWeaponEvent(this.weapon, this.enchantments);
  @override
  List<Object?> get props => [weapon, enchantments];
}

class RemoveWeaponEvent extends WeaponEvent {
  final String name;

  const RemoveWeaponEvent(this.name);
  @override
  List<Object> get props => [name];
}

class SelectWeaponEvent extends WeaponEvent {
  final Weapon weapon;

  const SelectWeaponEvent(this.weapon);
  @override
  List<Object> get props => [weapon];
}

class RegisterServiceEvent extends WeaponEvent {
  @override
  List<Object> get props => [];
}
