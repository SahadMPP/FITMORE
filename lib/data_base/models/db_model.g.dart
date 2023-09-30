// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      name: fields[1] as String,
      phoneNumber: fields[2] as String,
      email: fields[3] as String,
      password: fields[4] as String,
      city: fields[8] as String?,
      state: fields[9] as String?,
      pin: fields[10] as String?,
      profile: fields[5] as String?,
      adressname: fields[6] as String?,
      addressphnumber: fields[7] as String?,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.profile)
      ..writeByte(6)
      ..write(obj.adressname)
      ..writeByte(7)
      ..write(obj.addressphnumber)
      ..writeByte(8)
      ..write(obj.city)
      ..writeByte(9)
      ..write(obj.state)
      ..writeByte(10)
      ..write(obj.pin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      price: fields[7] as String,
      category: fields[8] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(9)
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
      ..write(obj.category);
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
