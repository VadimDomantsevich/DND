import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/model/weapon.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'strike.g.dart';

@HiveType(typeId: 6)
class Strike extends HiveObject {
  @HiveField(0)
  final Character character;
  @HiveField(1)
  final Weapon weapon;
  @HiveField(2)
  final bool isAdvantage;
  @HiveField(3)
  final bool isHindrance;
  @HiveField(4)
  final String name;

  Strike(this.character, this.weapon, this.isAdvantage, this.isHindrance,
      this.name);
}
