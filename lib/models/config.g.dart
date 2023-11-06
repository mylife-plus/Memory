// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBConfigAdapter extends TypeAdapter<DBConfig> {
  @override
  final int typeId = 0;

  @override
  DBConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBConfig(
      fields[0] as String,
      fields[1] as String,
      fields[2] as bool,
      fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DBConfig obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.theme)
      ..writeByte(1)
      ..write(obj.language)
      ..writeByte(2)
      ..write(obj.keyStored)
      ..writeByte(3)
      ..write(obj.pinCodeEnabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
