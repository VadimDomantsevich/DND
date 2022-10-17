// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'macros.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MacrosAdapter extends TypeAdapter<Macros> {
  @override
  final int typeId = 7;

  @override
  Macros read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Macros(
      fields[0] as String,
      fields[1] as String,
      (fields[2] as List).cast<Strike>(),
    );
  }

  @override
  void write(BinaryWriter writer, Macros obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.characterName)
      ..writeByte(2)
      ..write(obj.strikes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MacrosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
