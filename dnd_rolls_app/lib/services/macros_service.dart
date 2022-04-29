import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/model/macros.dart';
import 'package:dnd_rolls_app/model/strike.dart';
import 'package:dnd_rolls_app/model/weapon.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MacrosService {
  late Box<Macros> _macros;
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(8)) {
      Hive.registerAdapter(PhysicalTypeOfDamageAdapter());
    }
    if (!Hive.isAdapterRegistered(7)) {
      Hive.registerAdapter(MacrosAdapter());
    }
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter(StrikeAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(WeaponAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(CharacteristicsEnumAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(DamageCubeAdapter());
    }
    _macros = await Hive.openBox('macrosBox');
  }

  List<Macros> getCharacterMacros(String characterName) {
    return _macros.values
        .where((element) => element.characterName == characterName)
        .toList();
  }

  Macros getMacros(String name, String characterName) {
    return _macros.values.firstWhere((element) =>
        element.name == name && element.characterName == characterName);
  }

  List<Macros> getAllMacros() {
    return _macros.values.toList();
  }

  CreationResult addMacros(final String name, final String characterName,
      final List<Strike> strikes) {
    final alreadyExists = _macros.values.any((element) =>
        element.name.toLowerCase() == name.toLowerCase() &&
        element.characterName == characterName);
    if (alreadyExists) {
      return CreationResult.alreadyExists;
    }
    try {
      _macros.add(Macros(name, characterName, strikes));
      return CreationResult.success;
    } catch (e) {
      return CreationResult.failure;
    }
  }

  Future<void> removeMacros(
      final String name, final String characterName) async {
    final macros = _macros.values.firstWhere((element) =>
        element.name == name && element.characterName == characterName);

    await macros.delete();
  }

  Future<CreationResult> updateMacros(final String name, final String newName,
      final String characterName, final List<Strike> strikes) async {
    final macrosToUpdate = _macros.values.firstWhere((element) =>
        element.name == name && element.characterName == characterName);
    final alreadyExists = _macros.values.any((element) =>
        element.name.toLowerCase() == newName.toLowerCase() &&
        element.characterName == characterName &&
        element != macrosToUpdate);
    if (alreadyExists) {
      return CreationResult.alreadyExists;
    }
    try {
      final index = macrosToUpdate.key as int;
      await _macros.put(index, Macros(newName, characterName, strikes));
      return CreationResult.success;
    } catch (e) {
      return CreationResult.failure;
    }
  }
}
