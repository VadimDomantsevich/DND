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

class ElementalTypeOfDamageAdapter extends TypeAdapter<ElementalTypeOfDamage> {
  @override
  final int typeId = 9;

  @override
  ElementalTypeOfDamage read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ElementalTypeOfDamage.acid;
      case 1:
        return ElementalTypeOfDamage.cold;
      case 2:
        return ElementalTypeOfDamage.fire;
      case 3:
        return ElementalTypeOfDamage.force;
      case 4:
        return ElementalTypeOfDamage.lightning;
      case 5:
        return ElementalTypeOfDamage.necrotic;
      case 6:
        return ElementalTypeOfDamage.poison;
      case 7:
        return ElementalTypeOfDamage.psychic;
      case 8:
        return ElementalTypeOfDamage.radiant;
      case 9:
        return ElementalTypeOfDamage.thunder;
      default:
        return ElementalTypeOfDamage.acid;
    }
  }

  @override
  void write(BinaryWriter writer, ElementalTypeOfDamage obj) {
    switch (obj) {
      case ElementalTypeOfDamage.acid:
        writer.writeByte(0);
        break;
      case ElementalTypeOfDamage.cold:
        writer.writeByte(1);
        break;
      case ElementalTypeOfDamage.fire:
        writer.writeByte(2);
        break;
      case ElementalTypeOfDamage.force:
        writer.writeByte(3);
        break;
      case ElementalTypeOfDamage.lightning:
        writer.writeByte(4);
        break;
      case ElementalTypeOfDamage.necrotic:
        writer.writeByte(5);
        break;
      case ElementalTypeOfDamage.poison:
        writer.writeByte(6);
        break;
      case ElementalTypeOfDamage.psychic:
        writer.writeByte(7);
        break;
      case ElementalTypeOfDamage.radiant:
        writer.writeByte(8);
        break;
      case ElementalTypeOfDamage.thunder:
        writer.writeByte(9);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ElementalTypeOfDamageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TypeOfEnchantmentAdapter extends TypeAdapter<TypeOfEnchantment> {
  @override
  final int typeId = 11;

  @override
  TypeOfEnchantment read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TypeOfEnchantment.plusHitAndDamage;
      case 1:
        return TypeOfEnchantment.extraDamageDie;
      default:
        return TypeOfEnchantment.plusHitAndDamage;
    }
  }

  @override
  void write(BinaryWriter writer, TypeOfEnchantment obj) {
    switch (obj) {
      case TypeOfEnchantment.plusHitAndDamage:
        writer.writeByte(0);
        break;
      case TypeOfEnchantment.extraDamageDie:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeOfEnchantmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
