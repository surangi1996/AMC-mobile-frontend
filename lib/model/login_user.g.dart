// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUser _$LoginUserFromJson(Map<String, dynamic> json) {
  return LoginUser(
    json['userId'] as String,
    json['password'] as String,
    json['role'] as String,
    json['jwt'] as String,
    json['expirationTime'] == null
        ? null
        : DateTime.parse(json['expirationTime'] as String),
  );
}

Map<String, dynamic> _$LoginUserToJson(LoginUser instance) => <String, dynamic>{
      'userId': instance.userId,
      'password': instance.password,
      'role': instance.role,
      'jwt': instance.jwt,
      'expirationTime': instance.expirationTime?.toIso8601String(),
    };
