// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['userId'] as String,
    json['password'] as String,
    json['role'] as String,
    json['active'] as bool,
    json['email'] as String,
    json['contactNo'] as String,
    json['uname'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'password': instance.password,
      'role': instance.role,
      'active': instance.active,
      'email': instance.email,
      'contactNo': instance.contactNo,
      'uname': instance.uname,
    };
