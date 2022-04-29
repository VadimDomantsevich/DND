import 'package:hive/hive.dart';

part 'enums.g.dart';

@HiveType(typeId: 3)
enum CharacteristicsEnum {
  @HiveField(0)
  strength,
  @HiveField(1)
  dexterity,
  @HiveField(2)
  constitution,
  @HiveField(3)
  intelligence,
  @HiveField(4)
  wisdom,
  @HiveField(5)
  charisma
}
@HiveType(typeId: 4)
enum DamageCube {
  @HiveField(0)
  d4,
  @HiveField(1)
  d6,
  @HiveField(2)
  d8,
  @HiveField(3)
  d10,
  @HiveField(4)
  d12,
  @HiveField(5)
  d6x2
}
@HiveType(typeId: 8)
enum PhysicalTypeOfDamage{
  @HiveField(0)
  crushing,
  @HiveField(1)
  piercing,
  @HiveField(2)
  slashing,
}

enum CreationResult { success, failure, alreadyExists }
