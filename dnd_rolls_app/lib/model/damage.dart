import 'package:dnd_rolls_app/core/constants/enums.dart';

class Damage {
  final int value;
  final PhysicalTypeOfDamage? physicalTypeOfDamage;
  final ElementalTypeOfDamage? elementalTypeOfDamage;

  Damage(this.value, {this.physicalTypeOfDamage, this.elementalTypeOfDamage});
}
