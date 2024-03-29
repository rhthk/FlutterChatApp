// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactHiveAdapter extends TypeAdapter<ContactHive> {
  @override
  final int typeId = 1;

  @override
  ContactHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContactHive()
      ..firstName = fields[0] as String
      ..lastName = fields[1] as String
      ..status = fields[2] as String
      ..number = fields[3] as int
      ..url = fields[4] as String
      ..lastAvtive = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, ContactHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.number)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.lastAvtive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
