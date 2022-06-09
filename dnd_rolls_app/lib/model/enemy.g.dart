// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enemy.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EnemyAdapter extends TypeAdapter<Enemy> {
  @override
  final int typeId = 5;

  @override
  Enemy read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Enemy(
      fields[0] as String,
      fields[1] as int,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Enemy obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.health)
      ..writeByte(2)
      ..write(obj.armorClass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnemyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
