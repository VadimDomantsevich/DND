import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/model/enchantment.dart';
import 'package:hive/hive.dart';

part 'weapon.g.dart';

@HiveType(typeId: 2)
class Weapon extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final DamageCube damage;
  @HiveField(2)
  final CharacteristicsEnum mainCharacteristic;
  @HiveField(3)
  final PhysicalTypeOfDamage typeOfDamage;
  @HiveField(4)
  final List<Enchantment>? enchantments;

  Weapon(this.name, this.damage, this.mainCharacteristic, this.typeOfDamage,
      {this.enchantments});
}
