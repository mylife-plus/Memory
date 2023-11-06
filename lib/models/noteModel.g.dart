// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noteModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteAdapter extends TypeAdapter<Note> {
  @override
  final int typeId = 2;

  @override
  Note read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Note(
      fields[0] as String,
      fields[1] as String,
      fields[2] as DateTime,
      (fields[3] as List).cast<double>(),
      (fields[5] as Map).cast<String, dynamic>(),
      (fields[6] as List?)?.cast<String>(),
      (fields[7] as HiveList?)?.castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer
      ..writeByte(7)
      ..writeByte(5)
      ..write(obj.content)
      ..writeByte(6)
      ..write(obj.filesPath)
      ..writeByte(7)
      ..write(obj.recipient)
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
      other is NoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
