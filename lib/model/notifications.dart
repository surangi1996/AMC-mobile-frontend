import 'package:json_annotation/json_annotation.dart';

part 'notifications.g.dart';

@JsonSerializable()
class Notifi {
  String notification;
  DateTime savedDate;
  bool isRead;

  Notifi(this.notification, this.savedDate, this.isRead);
  factory Notifi.fromJson(Map<String, dynamic> data) => _$NotifiFromJson(data);

  Map<String, dynamic> toJson() => _$NotifiToJson(this);
}
