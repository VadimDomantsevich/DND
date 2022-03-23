import 'package:hive/hive.dart';

part 'character.g.dart';

@HiveType(typeId: 1)
class Character extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int strength;
  @HiveField(2)
  final int dexterity;
  @HiveField(3)
  final int constitution;
  @HiveField(4)
  final int intelligence;
  @HiveField(5)
  final int wisdom;
  @HiveField(6)
  final int charisma;

  Character(this.name, this.strength, this.dexterity, this.constitution,
      this.intelligence, this.wisdom, this.charisma);
}
