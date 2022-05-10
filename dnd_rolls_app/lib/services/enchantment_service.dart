import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/model/enchantment.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EnchantmentService {
  late Box<Enchantment> _enchantments;

  Future<void> init() async {
    if (!Hive.isAdapterRegistered(8)) {
      Hive.registerAdapter(PhysicalTypeOfDamageAdapter());
    }
    if (!Hive.isAdapterRegistered(9)) {
      Hive.registerAdapter(ElementalTypeOfDamageAdapter());
    }
    if (!Hive.isAdapterRegistered(10)) {
      Hive.registerAdapter(EnchantmentAdapter());
    }
    if (!Hive.isAdapterRegistered(11)) {
      Hive.registerAdapter(TypeOfEnchantmentAdapter());
    }

    _enchantments = await Hive.openBox('enchantmentsBox');
  }

  List<Enchantment> getEnchantments() {
    return _enchantments.values.toList();
  }

  Enchantment getEnchantment(String name) {
    return _enchantments.values.firstWhere((element) => element.name == name);
  }

  Enchantment addEnchantment(final TypeOfEnchantment typeOfEnchantment,
      {final int? hitAndDamagePlus,
      final int? diceCount,
      final DamageCube? diceType,
      final ElementalTypeOfDamage? elementalTypeOfDamage,
      final PhysicalTypeOfDamage? physicalTypeOfDamage}) {
    final name = getName(typeOfEnchantment,
        hitAndDamagePlus: hitAndDamagePlus,
        diceCount: diceCount,
        diceType: diceType,
        elementalTypeOfDamage: elementalTypeOfDamage,
        physicalTypeOfDamage: physicalTypeOfDamage);
    final alreadyExists =
        _enchantments.values.any((element) => element.name == name);
    if (!alreadyExists) {
      switch (typeOfEnchantment) {
        case TypeOfEnchantment.plusHitAndDamage:
          final enchantment = Enchantment(typeOfEnchantment, name,
              hitAndDamagePlus: hitAndDamagePlus);
          _enchantments.add(enchantment);
          return enchantment;
        case TypeOfEnchantment.extraDamageDie:
          if (physicalTypeOfDamage != null) {
            final enchantment = Enchantment(typeOfEnchantment, name,
                diceCount: diceCount,
                diceType: diceType,
                physicalTypeOfDamage: physicalTypeOfDamage);
            _enchantments.add(enchantment);
            return enchantment;
          } else {
            final enchantment = Enchantment(typeOfEnchantment, name,
                diceCount: diceCount,
                diceType: diceType,
                elementalTypeOfDamage: elementalTypeOfDamage);
            _enchantments.add(enchantment);
            return enchantment;
          }
      }
    } else {
      return _enchantments.values.firstWhere((element) => element.name == name);
    }
  }

  String getName(final TypeOfEnchantment typeOfEnchantment,
      {final int? hitAndDamagePlus,
      final int? diceCount,
      final DamageCube? diceType,
      final ElementalTypeOfDamage? elementalTypeOfDamage,
      final PhysicalTypeOfDamage? physicalTypeOfDamage}) {
    switch (typeOfEnchantment) {
      case TypeOfEnchantment.plusHitAndDamage:
        return '+ $hitAndDamagePlus к попаданию и урону';
      case TypeOfEnchantment.extraDamageDie:
        if (physicalTypeOfDamage != null) {
          return '+ ${getDiceName(diceType!)} кость ${getPhysicalTypeOfDamageString(physicalTypeOfDamage)}';
        } else {
          return '+ ${getDiceName(diceType!)} кость ${getElementalTypeOfDamageString(elementalTypeOfDamage!)}';
        }
    }
  }

  String getDiceName(DamageCube damageCube) {
    switch (damageCube) {
      case DamageCube.d4:
        return Strings.damageD4;
      case DamageCube.d6:
        return Strings.damageD6;
      case DamageCube.d8:
        return Strings.damageD8;
      case DamageCube.d10:
        return Strings.damageD10;
      case DamageCube.d12:
        return Strings.damageD12;
      case DamageCube.d6x2:
        return Strings.damage2D6;
    }
  }

  String getPhysicalTypeOfDamageString(
      PhysicalTypeOfDamage physicalTypeOfDamage) {
    switch (physicalTypeOfDamage) {
      case PhysicalTypeOfDamage.crushing:
        return '${Strings.crushingDamage} урона';
      case PhysicalTypeOfDamage.piercing:
        return '${Strings.piercingDamage} урона';
      case PhysicalTypeOfDamage.slashing:
        return '${Strings.slashingDamage} урона';
    }
  }

  String getElementalTypeOfDamageString(
      ElementalTypeOfDamage elementalTypeOfDamage) {
    switch (elementalTypeOfDamage) {
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
