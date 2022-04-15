import 'dart:math';

import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/core/random_generator.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/model/enemy.dart';
import 'package:dnd_rolls_app/model/strike.dart';
import 'package:dnd_rolls_app/model/weapon.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StrikeService {
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter(StrikeAdapter());
    }
  }

  String getName(String characterName, String weaponName, bool isAdvantage,
      bool isHindrance) {
    String result = '$characterName удар оружием $weaponName';
    if (isAdvantage && !isHindrance) {
      result += ' с преимуществом';
    } else if (!isAdvantage && isHindrance) {
      result += ' с помехой';
    }
    return result;
  }

  List<Strike> getStrikes(Character character, Weapon weapon) {
    return <Strike>[
      Strike(character, weapon, false, false,
          getName(character.name, weapon.name, false, false)),
      Strike(character, weapon, true, false,
          getName(character.name, weapon.name, true, false)),
      Strike(character, weapon, false, true,
          getName(character.name, weapon.name, false, true))
    ];
  }

  int attack(Strike strike, Enemy enemy) {
    int firstRoll = RandomGenerator().rollD20();
    int secondRoll;
    int roll = firstRoll;
    if (strike.isAdvantage) {
      secondRoll = RandomGenerator().rollD20();
      roll = max(firstRoll, secondRoll);
    } else if (strike.isHindrance) {
      secondRoll = RandomGenerator().rollD20();
      roll = min(firstRoll, secondRoll);
    }
    if (roll == 20) {
      print('${strike.character.name} выбрасывает 20 - критический удар!');
      return getCriticalDamage(strike, enemy);
    } else {
      int characteristicBonus = getCharacteristicBonus(strike);
      roll += strike.character.skillBonus;
      roll += characteristicBonus;
      print(
          '${strike.character.name} выбрасывает $roll + $characteristicBonus + ${strike.character.skillBonus}');
      print('на попадание по ${enemy.name}');
      if (roll >= enemy.armorClass) {
        return getDamage(strike, enemy);
      } else {
        print('и промахивается');
        return 0;
      }
    }
  }

  int getCharacteristicBonus(Strike strike) {
    switch (strike.weapon.mainCharacteristic) {
      case CharacteristicsEnum.strength:
        return ((strike.character.strength - 10) / 2).floor();
      case CharacteristicsEnum.dexterity:
        return ((strike.character.dexterity - 10) / 2).floor();
      case CharacteristicsEnum.constitution:
        return ((strike.character.constitution - 10) / 2).floor();
      case CharacteristicsEnum.intelligence:
        return ((strike.character.intelligence - 10) / 2).floor();
      case CharacteristicsEnum.wisdom:
        return ((strike.character.wisdom - 10) / 2).floor();
      case CharacteristicsEnum.charisma:
        return ((strike.character.charisma - 10) / 2).floor();
    }
  }

  int getDamage(Strike strike, Enemy enemy) {
    int weaponDamage = 0;
    switch (strike.weapon.damage) {
      case DamageCube.d4:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d4);
        break;
      case DamageCube.d6:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d6);
        break;
      case DamageCube.d8:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d8);
        break;
      case DamageCube.d10:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d10);
        break;
      case DamageCube.d12:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d12);
        break;
    }
    print('и наносит $weaponDamage урона');
    return weaponDamage;
  }

  int getCriticalDamage(Strike strike, Enemy enemy) {
    int weaponDamage = 0;
    switch (strike.weapon.damage) {
      case DamageCube.d4:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d4);
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d4);
        break;
      case DamageCube.d6:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d6);
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d6);
        break;
      case DamageCube.d8:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d8);
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d8);
        break;
      case DamageCube.d10:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d10);
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d10);
        break;
      case DamageCube.d12:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d12);
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d12);
        break;
    }
    print('и наносит $weaponDamage урона');
    return weaponDamage;
  }
}
