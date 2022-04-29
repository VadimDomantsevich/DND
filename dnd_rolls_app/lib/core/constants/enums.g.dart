// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacteristicsEnumAdapter extends TypeAdapter<CharacteristicsEnum> {
  @override
  final int typeId = 3;

  @override
  CharacteristicsEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CharacteristicsEnum.strength;
      case 1:
        return CharacteristicsEnum.dexterity;
      case 2:
        return CharacteristicsEnum.constitution;
      case 3:
        return CharacteristicsEnum.intelligence;
      case 4:
        return CharacteristicsEnum.wisdom;
      case 5:
        return CharacteristicsEnum.charisma;
      default:
        return CharacteristicsEnum.strength;
    }
  }

  @override
  void write(BinaryWriter writer, CharacteristicsEnum obj) {
    switch (obj) {
      case CharacteristicsEnum.strength:
        writer.writeByte(0);
        break;
      case CharacteristicsEnum.dexterity:
        writer.writeByte(1);
        break;
      case CharacteristicsEnum.constitution:
        writer.writeByte(2);
        break;
      case CharacteristicsEnum.intelligence:
        writer.writeByte(3);
        break;
      case CharacteristicsEnum.wisdom:
        writer.writeByte(4);
        break;
      case CharacteristicsEnum.charisma:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacteristicsEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DamageCubeAdapter extends TypeAdapter<DamageCube> {
  @override
  final int typeId = 4;

  @override
  DamageCube read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DamageCube.d4;
      case 1:
        return DamageCube.d6;
      case 2:
        return DamageCube.d8;
      case 3:
        return DamageCube.d10;
      case 4:
        return DamageCube.d12;
      case 5:
        return DamageCube.d6x2;
      default:
        return DamageCube.d4;
    }
  }

  @override
  void write(BinaryWriter writer, DamageCube obj) {
    switch (obj) {
      case DamageCube.d4:
        writer.writeByte(0);
        break;
      case DamageCube.d6:
        writer.writeByte(1);
        break;
      case DamageCube.d8:
        writer.writeByte(2);
        break;
      case DamageCube.d10:
        writer.writeByte(3);
        break;
      case DamageCube.d12:
        writer.writeByte(4);
        break;
      case DamageCube.d6x2:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DamageCubeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PhysicalTypeOfDamageAdapter extends TypeAdapter<PhysicalTypeOfDamage> {
  @override
  final int typeId = 8;

  @override
  PhysicalTypeOfDamage read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PhysicalTypeOfDamage.crushing;
      case 1:
        return PhysicalTypeOfDamage.piercing;
      case 2:
        return PhysicalTypeOfDamage.slashing;
      default:
        return PhysicalTypeOfDamage.crushing;
    }
  }

  @override
  void write(BinaryWriter writer, PhysicalTypeOfDamage obj) {
    switch (obj) {
      case PhysicalTypeOfDamage.crushing:
        writer.writeByte(0);
        break;
      case PhysicalTypeOfDamage.piercing:
        writer.writeByte(1);
        break;
      case PhysicalTypeOfDamage.slashing:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhysicalTypeOfDamageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
