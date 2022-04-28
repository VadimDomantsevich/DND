import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/model/macros.dart';
import 'package:dnd_rolls_app/model/strike.dart';
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
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter(StrikeAdapter());
    }
    if (!Hive.isAdapterRegistered(7)) {
      Hive.registerAdapter(MacrosAdapter());
    }
    _weapons = await Hive.openBox('weaponsBox');

    if (_weapons.isEmpty) {
      await _weapons
          .add(Weapon('Гром', DamageCube.d8, CharacteristicsEnum.strength));
      await _weapons
          .add(Weapon('Молния', DamageCube.d8, CharacteristicsEnum.dexterity));
    }
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
      //---
      final updatedWeapon = Weapon(newName, damage, characteristic);
      updateStrikes(weaponToUpdate, updatedWeapon);
      //---
      final index = weaponToUpdate.key as int;
      await _weapons.put(index, updatedWeapon);
      return CreationResult.success;
    } catch (e) {
      return CreationResult.failure;
    }
  }

  void updateStrikes(Weapon oldWeapon, Weapon updatedWeapon) async {
    Box<Strike> _strikes = await Hive.openBox('strikeBox');
    Box<Macros> _macros = await Hive.openBox('macrosBox');

    final strikesToUpdate =
        _strikes.values.where((element) => element.weapon.name == oldWeapon.name);

    for (var strike in strikesToUpdate) {
      for (var macros in _macros.values) {
        if (macros.strikes.contains(strike)) {
          macros.strikes.remove(strike);
          macros.save();
        }
      }
      strike.delete(); 
    }
  }
}
