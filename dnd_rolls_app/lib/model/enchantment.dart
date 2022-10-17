import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:hive/hive.dart';

part 'enchantment.g.dart';

@HiveType(typeId: 10)
class Enchantment extends HiveObject {
  @HiveField(0)
  final TypeOfEnchantment typeOfEnchantment;
  @HiveField(1)
  final int? hitAndDamagePlus;
  @HiveField(2)
  final int? diceCount;
  @HiveField(3)
  final DamageCube? diceType;
  @HiveField(4)
  final ElementalTypeOfDamage? elementalTypeOfDamage;
  @HiveField(5)
  final PhysicalTypeOfDamage? physicalTypeOfDamage;
  @HiveField(6)
  final String name;

  Enchantment(this.typeOfEnchantment, this.name,
      {this.hitAndDamagePlus,
      this.diceCount,
      this.diceType,
      this.elementalTypeOfDamage,
      this.physicalTypeOfDamage});
}
