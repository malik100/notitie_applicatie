// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notitie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotitieAdapter extends TypeAdapter<Notitie> {
  @override
  final int typeId = 1;

  @override
  Notitie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notitie(
      fields[0] as String,
      fields[1] as String,
      fields[2] as int,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Notitie obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.titel)
      ..writeByte(1)
      ..write(obj.inhoud)
      ..writeByte(2)
      ..write(obj.tijdstempel)
      ..writeByte(3)
      ..write(obj.categorie);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotitieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
