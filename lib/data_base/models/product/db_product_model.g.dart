// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 2;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      title: fields[1] as String,
      discription: fields[2] as String,
      image1: fields[3] as String,
      image2: fields[4] as String,
      image3: fields[5] as String,
      image4: fields[6] as String,
      price: fields[7] as int,
      category: fields[8] as String,
      id: fields[0] as int?,
      active: fields[9] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.discription)
      ..writeByte(3)
      ..write(obj.image1)
      ..writeByte(4)
      ..write(obj.image2)
      ..writeByte(5)
      ..write(obj.image3)
      ..writeByte(6)
      ..write(obj.image4)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.category)
      ..writeByte(9)
      ..write(obj.active);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
