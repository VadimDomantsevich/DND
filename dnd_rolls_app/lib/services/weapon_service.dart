import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/model/macros.dart';
import 'package:dnd_rolls_app/model/strike.dart';
import 'package:dnd_rolls_app/model/weapon.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WeaponService {
  late Box<Weapon> _weapons;
  late Box<Weapon> _seedWeapons;

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
    if (!Hive.isAdapterRegistered(8)) {
      Hive.registerAdapter(PhysicalTypeOfDamageAdapter());
    }
    _weapons = await Hive.openBox('weaponsBox');
    _seedWeapons = await Hive.openBox('seedWeaponsBox');

    if (_weapons.isEmpty) {
      await _weapons.add(Weapon('Гром', DamageCube.d8,
          CharacteristicsEnum.strength, PhysicalTypeOfDamage.slashing));
      await _weapons.add(Weapon('Молния', DamageCube.d8,
          CharacteristicsEnum.dexterity, PhysicalTypeOfDamage.slashing));
    }

    if (_seedWeapons.isEmpty) {
      fillSeedWeapons();
    }
  }

  List<Weapon> getWeapons() {
    return _weapons.values.toList();
  }

  Weapon getWeapon(String name) {
    return _weapons.values.firstWhere((element) => element.name == name);
  }

  CreationResult addWeapon(
      final String name,
      final DamageCube damage,
      final CharacteristicsEnum characteristic,
      final PhysicalTypeOfDamage typeOfDamage) {
    final alreadyExists = _weapons.values
        .any((element) => element.name.toLowerCase() == name.toLowerCase());
    if (alreadyExists) {
      return CreationResult.alreadyExists;
    }
    try {
      _weapons.add(Weapon(name, damage, characteristic, typeOfDamage));
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

  Future<CreationResult> updateWeapon(
      final String name,
      final String newName,
      final DamageCube damage,
      final CharacteristicsEnum characteristic,
      final PhysicalTypeOfDamage typeOfDamage) async {
    final weaponToUpdate =
        _weapons.values.firstWhere((element) => element.name == name);
    final alreadyExists = _weapons.values.any((element) =>
        element.name.toLowerCase() == newName.toLowerCase() &&
        element != weaponToUpdate);
    if (alreadyExists) {
      return CreationResult.alreadyExists;
    }
    try {
      final updatedWeapon =
          Weapon(newName, damage, characteristic, typeOfDamage);
      //updateStrikes(weaponToUpdate, updatedWeapon);

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

    final strikesToUpdate = _strikes.values
        .where((element) => element.weapon.name == oldWeapon.name);

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

  void fillSeedWeapons() async {
    fillSimpleMeleeWeapons();
    fillSimpleRangedWeapons();
    fillMilitaryMeleeWeapons();
    fillMilitaryRangedWeapons();
  }

  void fillSimpleMeleeWeapons() async {
    await _seedWeapons.add(Weapon('Боевой посох', DamageCube.d6,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.crushing));
    await _seedWeapons.add(Weapon('Булава', DamageCube.d6,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.crushing));
    await _seedWeapons.add(Weapon('Дубинка', DamageCube.d4,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.crushing));
    await _seedWeapons.add(Weapon('Кинжал', DamageCube.d4,
        CharacteristicsEnum.dexterity, PhysicalTypeOfDamage.piercing));
    await _seedWeapons.add(Weapon('Копьё', DamageCube.d6,
        CharacteristicsEnum.dexterity, PhysicalTypeOfDamage.piercing));
    await _seedWeapons.add(Weapon('Лёгкий молот', DamageCube.d4,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.crushing));
    await _seedWeapons.add(Weapon('Метательное копьё', DamageCube.d6,
        CharacteristicsEnum.dexterity, PhysicalTypeOfDamage.piercing));
    await _seedWeapons.add(Weapon('Палица', DamageCube.d8,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.crushing));
    await _seedWeapons.add(Weapon('Ручной топор', DamageCube.d6,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.slashing));
    await _seedWeapons.add(Weapon('Серп', DamageCube.d4,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.slashing));
  }

  void fillSimpleRangedWeapons() async {
    await _seedWeapons.add(Weapon('Арбалет, лёгкий', DamageCube.d8,
        CharacteristicsEnum.dexterity, PhysicalTypeOfDamage.piercing));
    await _seedWeapons.add(Weapon('Дротик', DamageCube.d4,
        CharacteristicsEnum.dexterity, PhysicalTypeOfDamage.piercing));
    await _seedWeapons.add(Weapon('Короткий лук', DamageCube.d6,
        CharacteristicsEnum.dexterity, PhysicalTypeOfDamage.piercing));
    await _seedWeapons.add(Weapon('Праща', DamageCube.d4,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.crushing));
  }

  void fillMilitaryMeleeWeapons() async {
    await _seedWeapons.add(Weapon('Алебарда', DamageCube.d10,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.slashing));
    await _seedWeapons.add(Weapon('Боевая кирка', DamageCube.d8,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.piercing));
    await _seedWeapons.add(Weapon('Боевой молот', DamageCube.d8,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.crushing));
    await _seedWeapons.add(Weapon('Боевой топор', DamageCube.d8,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.slashing));
    await _seedWeapons.add(Weapon('Глефа', DamageCube.d10,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.slashing));
    await _seedWeapons.add(Weapon('Двуручный меч', DamageCube.d6x2,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.slashing));
    await _seedWeapons.add(Weapon('Длинное копьё', DamageCube.d12,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.piercing));
    await _seedWeapons.add(Weapon('Длинный меч', DamageCube.d8,
        CharacteristicsEnum.dexterity, PhysicalTypeOfDamage.slashing));
    await _seedWeapons.add(Weapon('Кнут', DamageCube.d4,
        CharacteristicsEnum.dexterity, PhysicalTypeOfDamage.slashing));
    await _seedWeapons.add(Weapon('Короткий меч', DamageCube.d6,
        CharacteristicsEnum.dexterity, PhysicalTypeOfDamage.piercing));
    await _seedWeapons.add(Weapon('Молот', DamageCube.d6x2,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.crushing));
    await _seedWeapons.add(Weapon('Моргенштерн', DamageCube.d8,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.crushing));
    await _seedWeapons.add(Weapon('Пика', DamageCube.d10,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.piercing));
    await _seedWeapons.add(Weapon('Рапира', DamageCube.d8,
        CharacteristicsEnum.dexterity, PhysicalTypeOfDamage.piercing));
    await _seedWeapons.add(Weapon('Секира', DamageCube.d12,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.slashing));
    await _seedWeapons.add(Weapon('Скимитар', DamageCube.d6,
        CharacteristicsEnum.dexterity, PhysicalTypeOfDamage.slashing));
    await _seedWeapons.add(Weapon('Трезубец', DamageCube.d6,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.piercing));
    await _seedWeapons.add(Weapon('Цеп', DamageCube.d8,
        CharacteristicsEnum.strength, PhysicalTypeOfDamage.crushing));
  }

  void fillMilitaryRangedWeapons() async {
    await _seedWeapons.add(Weapon('Арбалет, ручной', DamageCube.d6,
        CharacteristicsEnum.dexterity, PhysicalTypeOfDamage.piercing));
    await _seedWeapons.add(Weapon('Арбалет, тяжёлый', DamageCube.d10,
        CharacteristicsEnum.dexterity, PhysicalTypeOfDamage.piercing));
    await _seedWeapons.add(Weapon('Длинный лук', DamageCube.d8,
        CharacteristicsEnum.dexterity, PhysicalTypeOfDamage.piercing));
  }
}
