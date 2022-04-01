import 'package:hive/hive.dart';

part 'enemy.g.dart';

@HiveType(typeId: 5)
class Enemy extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int health;
  @HiveField(2)
  final int armorClass;

  Enemy(this.name, this.health, this.armorClass);
}
