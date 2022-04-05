// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strike.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StrikeAdapter extends TypeAdapter<Strike> {
  @override
  final int typeId = 6;

  @override
  Strike read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Strike(
      fields[0] as Character,
      fields[1] as Weapon,
      fields[2] as bool,
      fields[3] as bool,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Strike obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.character)
      ..writeByte(1)
      ..write(obj.weapon)
      ..writeByte(2)
      ..write(obj.isAdvantage)
      ..writeByte(3)
      ..write(obj.isHindrance)
      ..writeByte(4)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StrikeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
