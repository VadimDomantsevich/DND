import 'package:dnd_rolls_app/model/strike.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'macros.g.dart';

@HiveType(typeId: 7)
class Macros extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String characterName;
  @HiveField(2)
  final List<Strike>? strikes;

  Macros(this.name, this.characterName, this.strikes);
}
