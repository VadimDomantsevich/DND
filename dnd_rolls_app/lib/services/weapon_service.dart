import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/model/weapon.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WeaponService {
  late Box<Weapon> _weapons;

  Future<void> init() async {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(WeaponAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(CharacteristicsEnumAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(DamageCubeAdapter());
    }
    _weapons = await Hive.openBox('weaponsBox');

    await _weapons.clear();
    await _weapons
        .add(Weapon('Гром', DamageCube.d8, CharacteristicsEnum.strength));
    await _weapons
        .add(Weapon('Молния', DamageCube.d8, CharacteristicsEnum.dexterity));
  }

  List<Weapon> getWeapons() {
    return _weapons.values.toList();
  }

  Weapon getWeapon(String name) {
    return _weapons.values.firstWhere((element) => element.name == name);
  }

  CreationResult addWeapon(final String name, final DamageCube damage,
      final CharacteristicsEnum characteristic) {
    final alreadyExists = _weapons.values
        .any((element) => element.name.toLowerCase() == name.toLowerCase());
    if (alreadyExists) {
      return CreationResult.alreadyExists;
    }
    try {
      _weapons.add(Weapon(name, damage, characteristic));
      return CreationResult.success;
    } catch (e) {
      return CreationResult.failure;
    }
  }

  Future<void> removeWeapon(final String name) async {
    await _weapons.values
        .firstWhere((element) => element.name == name)
        .delete();
  }

  Future<CreationResult> updateWeapon(final String name, final String newName,
      final DamageCube damage, final CharacteristicsEnum characteristic) async {
    final weaponToUpdate =
        _weapons.values.firstWhere((element) => element.name == name);
    final alreadyExists = _weapons.values.any((element) =>
        element.name.toLowerCase() == newName.toLowerCase() &&
        element != weaponToUpdate);
    if (alreadyExists) {
      return CreationResult.alreadyExists;
    }
    try {
      final index = weaponToUpdate.key as int;
      await _weapons.put(index, Weapon(newName, damage, characteristic));
      return CreationResult.success;
    } catch (e) {
      return CreationResult.failure;
    }
  }
}
