// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoModelAdapter extends TypeAdapter<ToDoModel> {
  @override
  final int typeId = 0;

  @override
  ToDoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoModel(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      createdAt: fields[3] as String?,
      completedAt: fields[4] as String?,
      isDone: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ToDoModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.completedAt)
      ..writeByte(5)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
