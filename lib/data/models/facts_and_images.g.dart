// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facts_and_images.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FactsAndImagesAdapter extends TypeAdapter<FactsAndImages> {
  @override
  final int typeId = 1;

  @override
  FactsAndImages read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FactsAndImages(
      fields[0] as String,
      fields[1] as Facts,
    );
  }

  @override
  void write(BinaryWriter writer, FactsAndImages obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.images)
      ..writeByte(1)
      ..write(obj.facts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FactsAndImagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
