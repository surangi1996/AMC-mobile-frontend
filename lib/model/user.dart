import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String userId;
  String password;
  String role;
  bool active;
  String email;
  String contactNo;
  String uname;

  User(this.userId, this.password, this.role, this.active, this.email,
      this.contactNo, this.uname);
  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
