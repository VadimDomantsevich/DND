import 'package:hive_flutter/hive_flutter.dart';

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

  Character(
    this.name,
    this.skillBonus,
    this.strength,
    this.dexterity,
    this.constitution,
    this.intelligence,
    this.wisdom,
    this.charisma,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Character &&
      other.name == name &&
      other.skillBonus == skillBonus &&
      other.strength == strength &&
      other.dexterity == dexterity &&
      other.constitution == constitution &&
      other.intelligence == intelligence &&
      other.wisdom == wisdom &&
      other.charisma == charisma;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      skillBonus.hashCode ^
      strength.hashCode ^
      dexterity.hashCode ^
      constitution.hashCode ^
      intelligence.hashCode ^
      wisdom.hashCode ^
      charisma.hashCode;
  }
}
