import 'dart:math';

import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/core/random_generator.dart';
import 'package:dnd_rolls_app/model/battle_log.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/model/damage.dart';
import 'package:dnd_rolls_app/model/enchantment.dart';
import 'package:dnd_rolls_app/model/enemy.dart';
import 'package:dnd_rolls_app/model/macros.dart';
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

  bool isStrikeExist(String name) {
    return _strikes.values.any((element) => element.name == name);
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

  Future<List<Strike>> newWeaponMacrosStrikes(
      Macros macros, Weapon oldWeapon, Weapon newWeapon) async {
    List<Strike> newStrikes = [];
    Strike newStrike;
    for (var strike in macros.strikes) {
      if (strike.weapon.name == oldWeapon.name) {
        newStrike = Strike(
            strike.character,
            newWeapon,
            strike.isAdvantage,
            strike.isHindrance,
            getName(strike.character.name, newWeapon.name, strike.isAdvantage,
                strike.isHindrance));
        newStrikes.add(newStrike);
      } else {
        newStrikes.add(strike);
      }
    }
    final strikesToUpdate = _strikes.values
        .where((element) => element.weapon.name == oldWeapon.name);
    for (var strike in strikesToUpdate) {
      int index = strike.key as int;
      await _strikes.put(
          index,
          Strike(
              strike.character,
              newWeapon,
              strike.isAdvantage,
              strike.isHindrance,
              getName(strike.character.name, newWeapon.name, strike.isAdvantage,
                  strike.isHindrance)));
    }
    return newStrikes;
  }

  Future<List<Strike>> deleteWeaponMacrosStrikes(
      Macros macros, Weapon weapon) async {
    List<Strike> newStrikes = [];
    for (var strike in macros.strikes) {
      if (strike.weapon.name != weapon.name) {
        newStrikes.add(strike);
      }
    }
    final strikesToDelete =
        _strikes.values.where((element) => element.weapon.name == weapon.name);
    for (var strike in strikesToDelete) {
      int index = strike.key as int;
      _strikes.delete(index);
    }
    return newStrikes;
  }

  BattleLog attack(Strike strike, Enemy enemy) {
    int firstRoll = RandomGenerator().rollD20();
    int secondRoll;
    int roll = firstRoll;
    logs = '';
    List<Damage> damageList = [];
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
      logs +=
          (' нанося $damage ${getTypeOfDamageName(strike.weapon.typeOfDamage)} урона');
      damageList.add(
          Damage(damage, physicalTypeOfDamage: strike.weapon.typeOfDamage));
      damageList.addAll(getEnchantmentsDamage(strike, enemy, true));
      int finalDamage = 0;
      for (var element in damageList) {
        finalDamage += element.value;
      }
      logs += '\nВсего: $finalDamage урона';

      return BattleLog(logs, damage: damageList);
    } else {
      int characteristicBonus = getCharacteristicBonus(strike);
      logs += ('${strike.character.name} выбрасывает $roll(D20)');
      roll += strike.character.skillBonus;
      roll += characteristicBonus;
      logs +=
          (' + бонусы характеристики: $characteristicBonus и мастерства: ${strike.character.skillBonus},');
      //Enchantments

      if (strike.weapon.enchantments != null &&
          strike.weapon.enchantments!
              .any((element) => element.hitAndDamagePlus != null)) {
        logs += ' + бонусы зачарования: ';
        for (var enchant in strike.weapon.enchantments!) {
          if (enchant.hitAndDamagePlus != null) {
            logs += '+ ${enchant.hitAndDamagePlus} ';
            roll += enchant.hitAndDamagePlus!;
          }
        }
      }

      logs += ('\nИтого: $roll');
      logs += (' на попадание по ${enemy.name}');
      if (roll >= enemy.armorClass) {
        int damage = getDamage(strike, enemy);
        logs += (' + модификатор: $characteristicBonus,');
        damage += characteristicBonus;
        //Enchantments
        if (strike.weapon.enchantments != null &&
            strike.weapon.enchantments!
                .any((element) => element.hitAndDamagePlus != null)) {
          logs += ' + бонусы зачарования: ';
          for (var enchant in strike.weapon.enchantments!) {
            if (enchant.hitAndDamagePlus != null) {
              logs += '+ ${enchant.hitAndDamagePlus} ';
              damage += enchant.hitAndDamagePlus!;
            }
          }
        }
        logs +=
            (' нанося\n- $damage ${getTypeOfDamageName(strike.weapon.typeOfDamage)} урона');
        damageList.add(
            Damage(damage, physicalTypeOfDamage: strike.weapon.typeOfDamage));
        damageList.addAll(getEnchantmentsDamage(strike, enemy, false));
        int finalDamage = 0;
        for (var element in damageList) {
          finalDamage += element.value;
        }
        logs += '\nВсего: $finalDamage урона';
        return BattleLog(logs, damage: damageList);
      } else {
        logs += (' и промахивается');
        return BattleLog(logs);
      }
    }
  }

  String getTypeOfDamageName(PhysicalTypeOfDamage typeOfDamage) {
    switch (typeOfDamage) {
      case PhysicalTypeOfDamage.crushing:
        return Strings.crushingDamage;
      case PhysicalTypeOfDamage.piercing:
        return Strings.piercingDamage;
      case PhysicalTypeOfDamage.slashing:
        return Strings.slashingDamage;
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
      case DamageCube.d6x2:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d6);
        logs += (' $weaponDamage(d6) и');
        final secondCube = RandomGenerator().rollDamage(DamageCube.d6);
        logs += (' $secondCube(d6)');
        weaponDamage += secondCube;
        break;
    }

    return weaponDamage;
  }

  List<Damage> getEnchantmentsDamage(
      Strike strike, Enemy enemy, bool isCritical) {
    int damage = 0;
    List<Damage> damageList = [];
    if (strike.weapon.enchantments != null &&
        strike.weapon.enchantments!
            .any((element) => element.diceCount != null)) {
      for (var enchant in strike.weapon.enchantments!) {
        switch (enchant.typeOfEnchantment) {
          case TypeOfEnchantment.plusHitAndDamage:
            break;
          case TypeOfEnchantment.extraDamageDie:
            int index = 0;
            int currentDamage = 0;
            logs += '\n';
            if (isCritical) {
              while (index < enchant.diceCount! * 2) {
                damage = RandomGenerator().rollDamage(enchant.diceType!);
                logs += ' + $damage${getDamageCubeString(enchant.diceType!)}';
                currentDamage += damage;
                index++;
              }
            } else {
              while (index < enchant.diceCount!) {
                damage = RandomGenerator().rollDamage(enchant.diceType!);
                logs += ' + $damage${getDamageCubeString(enchant.diceType!)}';
                currentDamage += damage;
                index++;
              }
            }

            logs += '\n- $currentDamage ${getTypeOfDamageString(enchant)}';
            damageList.add(Damage(currentDamage,
                physicalTypeOfDamage: enchant.physicalTypeOfDamage,
                elementalTypeOfDamage: enchant.elementalTypeOfDamage));
        }
      }
      return damageList;
    } else {
      return [];
    }
  }

  String getTypeOfDamageString(Enchantment enchantment) {
    if (enchantment.physicalTypeOfDamage != null) {
      switch (enchantment.physicalTypeOfDamage!) {
        case PhysicalTypeOfDamage.crushing:
          return Strings.crushingDamage + ' урона';
        case PhysicalTypeOfDamage.piercing:
          return Strings.piercingDamage + ' урона';
        case PhysicalTypeOfDamage.slashing:
          return Strings.slashingDamage + ' урона';
      }
    } else {
      switch (enchantment.elementalTypeOfDamage!) {
        case ElementalTypeOfDamage.acid:
          return Strings.acidDamage;
        case ElementalTypeOfDamage.cold:
          return Strings.coldDamage;
        case ElementalTypeOfDamage.fire:
          return Strings.fireDamage;
        case ElementalTypeOfDamage.force:
          return Strings.forceDamage;
        case ElementalTypeOfDamage.lightning:
          return Strings.lightningDamage;
        case ElementalTypeOfDamage.necrotic:
          return Strings.necroticDamage;
        case ElementalTypeOfDamage.poison:
          return Strings.poisonDamage;
        case ElementalTypeOfDamage.psychic:
          return Strings.psychicDamage;
        case ElementalTypeOfDamage.radiant:
          return Strings.radiantDamage;
        case ElementalTypeOfDamage.thunder:
          return Strings.thunderDamage;
      }
    }
  }

  String getDamageCubeString(DamageCube damageCube) {
    switch (damageCube) {
      case DamageCube.d4:
        return '(d4)';
      case DamageCube.d6:
        return '(d6)';
      case DamageCube.d8:
        return '(d8)';
      case DamageCube.d10:
        return '(d10)';
      case DamageCube.d12:
        return '(d12)';
      case DamageCube.d6x2:
        return '(2d6)';
    }
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
      case DamageCube.d6x2:
        weaponDamage += RandomGenerator().rollDamage(DamageCube.d6);
        logs += (' $weaponDamage(d6) и');
        secondCube += RandomGenerator().rollDamage(DamageCube.d6);
        logs += (' $secondCube(d6) и');
        weaponDamage += secondCube;
        secondCube = RandomGenerator().rollDamage(DamageCube.d6);
        logs += (' $secondCube(d6) и');
        weaponDamage += secondCube;
        secondCube = RandomGenerator().rollDamage(DamageCube.d6);
        logs += (' $secondCube(d6)');
        weaponDamage += secondCube;
        return weaponDamage;
    }
    weaponDamage += secondCube;
    return weaponDamage;
  }
}
