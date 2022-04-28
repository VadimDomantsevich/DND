import 'dart:math';

import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/core/random_generator.dart';
import 'package:dnd_rolls_app/model/battle_log.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/model/enemy.dart';
import 'package:dnd_rolls_app/model/strike.dart';
import 'package:dnd_rolls_app/model/weapon.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StrikeService {
  String logs = '';

  late Box<Strike> _strikes;
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter<Strike>(StrikeAdapter());
    }

    _strikes = await Hive.openBox('strikeBox');
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

  Strike getStrikeByName(String name) {
    return _strikes.values.firstWhere((element) => element.name == name);
  }

  List<Strike> getStrikes(Character character, Weapon weapon) {
    final strikes = <Strike>[
      Strike(character, weapon, false, false,
          getName(character.name, weapon.name, false, false)),
      Strike(character, weapon, true, false,
          getName(character.name, weapon.name, true, false)),
      Strike(character, weapon, false, true,
          getName(character.name, weapon.name, false, true))
    ];

    for (var strike in strikes) {
      if (!_strikes.values.any((element) => element.name == strike.name)) {
        _strikes.add(strike);
      }
    }
    return strikes;
  }

  BattleLog attack(Strike strike, Enemy enemy) {
    int firstRoll = RandomGenerator().rollD20();
    int secondRoll;
    int roll = firstRoll;
    logs = '';
    if (strike.isAdvantage) {
      secondRoll = RandomGenerator().rollD20();
      roll = max(firstRoll, secondRoll);
    } else if (strike.isHindrance) {
      secondRoll = RandomGenerator().rollD20();
      roll = min(firstRoll, secondRoll);
    }
    if (roll == 20) {
      logs += ('${strike.character.name} выбрасывает 20 - критический удар!');
      int damage = getCriticalDamage(strike, enemy);
      int characteristicBonus = getCharacteristicBonus(strike);
      logs += (' + модификатор: $characteristicBonus');
      damage += characteristicBonus;
      logs += (' нанося $damage урона');
      return BattleLog(logs, damage: damage);
    } else {
      int characteristicBonus = getCharacteristicBonus(strike);
      logs += ('${strike.character.name} выбрасывает $roll(D20)');
      roll += strike.character.skillBonus;
      roll += characteristicBonus;
      logs +=
          (' + бонусы характеристики: $characteristicBonus и мастерства: ${strike.character.skillBonus},');
      logs += (' итого: $roll');
      logs += (' на попадание по ${enemy.name}');
      if (roll >= enemy.armorClass) {
        int damage = getDamage(strike, enemy);
        logs += (' + модификатор: $characteristicBonus,');
        damage += characteristicBonus;
        logs += (' нанося $damage урона');
        return BattleLog(logs, damage: damage);
      } else {
        logs += (' и промахивается');
        return BattleLog(logs);
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
    logs += (' и выбрасывает на костях урона');
    switch (strike.weapon.damage) {
      case DamageCube.d4:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d4);
        logs += (' $weaponDamage(d4)');
        break;
      case DamageCube.d6:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d6);
        logs += (' $weaponDamage(d6)');
        break;
      case DamageCube.d8:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d8);
        logs += (' $weaponDamage(d8)');
        break;
      case DamageCube.d10:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d10);
        logs += (' $weaponDamage(d10)');
        break;
      case DamageCube.d12:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d12);
        logs += (' $weaponDamage(d12)');
        break;
    }

    return weaponDamage;
  }

  int getCriticalDamage(Strike strike, Enemy enemy) {
    int weaponDamage = 0;
    int secondCube = 0;
    logs += (' и выбрасывает на костях урона ');
    switch (strike.weapon.damage) {
      case DamageCube.d4:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d4);
        logs += (' $weaponDamage(d4) и');
        secondCube += RandomGenerator().rollDamage(DamageCube.d4);
        logs += (' $secondCube(d4)');
        break;
      case DamageCube.d6:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d6);
        logs += (' $weaponDamage(d6) и');
        secondCube += RandomGenerator().rollDamage(DamageCube.d6);
        logs += (' $secondCube(d6)');
        break;
      case DamageCube.d8:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d8);
        logs += (' $weaponDamage(d8) и');
        secondCube += RandomGenerator().rollDamage(DamageCube.d8);
        logs += (' $secondCube(d8)');
        break;
      case DamageCube.d10:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d10);
        logs += (' $weaponDamage(d10) и');
        secondCube += RandomGenerator().rollDamage(DamageCube.d10);
        logs += (' $secondCube(d10)');
        break;
      case DamageCube.d12:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d12);
        logs += (' $weaponDamage(d12) и');
        secondCube += RandomGenerator().rollDamage(DamageCube.d12);
        logs += (' $secondCube(d12)');
        break;
    }
    weaponDamage += secondCube;
    return weaponDamage;
  }
}
