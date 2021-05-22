import 'package:json_annotation/json_annotation.dart';

part 'login_user.g.dart';

@JsonSerializable()
class LoginUser {
  String userId;
  String password;
  String role;
  String jwt;
  DateTime expirationTime;

  LoginUser(
      this.userId, this.password, this.role, this.jwt, this.expirationTime);
  factory LoginUser.fromJson(Map<String, dynamic> data) =>
      _$LoginUserFromJson(data);

  Map<String, dynamic> toJson() => _$LoginUserToJson(this);
}
