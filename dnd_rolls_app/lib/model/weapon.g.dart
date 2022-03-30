// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeaponAdapter extends TypeAdapter<Weapon> {
  @override
  final int typeId = 2;

  @override
  Weapon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weapon(
      fields[0] as String,
      fields[1] as DamageCube,
      fields[2] as CharacteristicsEnum,
    );
  }

  @override
  void write(BinaryWriter writer, Weapon obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.damage)
      ..writeByte(2)
      ..write(obj.mainCharacteristic);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeaponAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
