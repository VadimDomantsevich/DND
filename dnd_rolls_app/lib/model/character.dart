import 'package:hive/hive.dart';

part 'character.g.dart';

@HiveType(typeId: 1)
class Character extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int skillBonus;
  @HiveField(2)
  final int strength;
  @HiveField(3)
  final int dexterity;
  @HiveField(4)
  final int constitution;
  @HiveField(5)
  final int intelligence;
  @HiveField(6)
  final int wisdom;
  @HiveField(7)
  final int charisma;

  Character(this.name, this.skillBonus, this.strength, this.dexterity,
      this.constitution, this.intelligence, this.wisdom, this.charisma);
}
