// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_order_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BestOrderModelAdapter extends TypeAdapter<BestOrderModel> {
  @override
  final int typeId = 1;

  @override
  BestOrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BestOrderModel(imageUrl: fields[0] as String);
  }

  @override
  void write(BinaryWriter writer, BestOrderModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BestOrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
