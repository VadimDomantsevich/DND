import 'package:hive/hive.dart';

part 'character.g.dart';

@HiveType(typeId: 1)
class Character extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int skillBonus;

  Character(this.name, this.skillBonus);
}
