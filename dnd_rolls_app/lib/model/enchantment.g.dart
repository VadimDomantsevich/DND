// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enchantment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EnchantmentAdapter extends TypeAdapter<Enchantment> {
  @override
  final int typeId = 10;

  @override
  Enchantment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Enchantment(
      fields[0] as TypeOfEnchantment,
      fields[6] as String,
      hitAndDamagePlus: fields[1] as int?,
      diceCount: fields[2] as int?,
      diceType: fields[3] as DamageCube?,
      elementalTypeOfDamage: fields[4] as ElementalTypeOfDamage?,
      physicalTypeOfDamage: fields[5] as PhysicalTypeOfDamage?,
    );
  }

  @override
  void write(BinaryWriter writer, Enchantment obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.typeOfEnchantment)
      ..writeByte(1)
      ..write(obj.hitAndDamagePlus)
      ..writeByte(2)
      ..write(obj.diceCount)
      ..writeByte(3)
      ..write(obj.diceType)
      ..writeByte(4)
      ..write(obj.elementalTypeOfDamage)
      ..writeByte(5)
      ..write(obj.physicalTypeOfDamage)
      ..writeByte(6)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnchantmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
