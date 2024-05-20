// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageInHiveAdapter extends TypeAdapter<ImageInHive> {
  @override
  final int typeId = 1;

  @override
  ImageInHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageInHive(
      imagePath: (fields[1] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ImageInHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageInHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
