// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactAdapter extends TypeAdapter<Contact> {
  @override
  final int typeId = 3;

  @override
  Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Contact(
      fields[0] as String,
      fields[1] as String,
      fields[2] as DateTime,
      (fields[3] as List).cast<double>(),
      fields[5] as String,
      fields[6] as String,
      fields[9] as String,
      fields[7] as String,
      fields[8] as String,
      fields[10] as DateTime?,
      fields[11] as String?,
      fields[12] as String?,
      fields[13] as String?,
      fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Contact obj) {
    writer
      ..writeByte(14)
      ..writeByte(5)
      ..write(obj.telephone)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.homeAddress)
      ..writeByte(8)
      ..write(obj.workAddress)
      ..writeByte(9)
      ..write(obj.photoPath)
      ..writeByte(10)
      ..write(obj.birthday)
      ..writeByte(11)
      ..write(obj.faith)
      ..writeByte(12)
      ..write(obj.hobby)
      ..writeByte(13)
      ..write(obj.job)
      ..writeByte(14)
      ..write(obj.firstMemory)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.dateTime)
      ..writeByte(3)
      ..write(obj.coordinates);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
