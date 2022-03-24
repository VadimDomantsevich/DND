// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characteristics.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacteristicsAdapter extends TypeAdapter<Characteristics> {
  @override
  final int typeId = 2;

  @override
  Characteristics read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Characteristics(
      strength: fields[1] as int,
      dexterity: fields[2] as int,
      constitution: fields[3] as int,
      intelligence: fields[4] as int,
      wisdom: fields[5] as int,
      charisma: fields[6] as int,
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Characteristics obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.strength)
      ..writeByte(2)
      ..write(obj.dexterity)
      ..writeByte(3)
      ..write(obj.constitution)
      ..writeByte(4)
      ..write(obj.intelligence)
      ..writeByte(5)
      ..write(obj.wisdom)
      ..writeByte(6)
      ..write(obj.charisma);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacteristicsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
