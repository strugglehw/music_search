// GENERATED CODE - DO NOT MODIFY BY HAND

///数据模型类，自动生成
part of 'results.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultsAdapter extends TypeAdapter<Results> {
  @override
  final int typeId = 1;

  @override
  Results read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Results(
      collectionName: fields[1] as String?,
      trackName: fields[0] as String?,
      artworkUrl100: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Results obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.collectionName)
      ..writeByte(0)
      ..write(obj.trackName)
      ..writeByte(3)
      ..write(obj.artworkUrl100);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
