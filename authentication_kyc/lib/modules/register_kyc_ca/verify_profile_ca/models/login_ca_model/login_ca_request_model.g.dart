// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_ca_request_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginCaRequestModelAdapter extends TypeAdapter<LoginCaRequestModel> {
  @override
  final int typeId = 0;

  @override
  LoginCaRequestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginCaRequestModel(
      userName: fields[0] as String,
      password: fields[1] as String,
      isRememberMe: fields[2] as bool,
      isBiometric: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LoginCaRequestModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.isRememberMe)
      ..writeByte(3)
      ..write(obj.isBiometric);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginCaRequestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
