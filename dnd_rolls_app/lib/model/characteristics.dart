import 'package:hive/hive.dart';

part 'characteristics.g.dart';

@HiveType(typeId: 2)
class Characteristics extends HiveObject {
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

  Characteristics(
      {required this.strength,
      required this.dexterity,
      required this.constitution,
      required this.intelligence,
      required this.wisdom,
      required this.charisma,
      required this.name});

  Characteristics copyWith(
          {required int strength,
          required int dexterity,
          required int constitution,
          required int intelligence,
          required int wisdom,
          required int charisma,
          required String name}) =>
      Characteristics(
          strength: strength,
          dexterity: dexterity,
          constitution: constitution,
          intelligence: intelligence,
          wisdom: wisdom,
          charisma: charisma,
          name: name);
}
