// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notifi _$NotifiFromJson(Map<String, dynamic> json) {
  return Notifi(
    json['notification'] as String,
    json['savedDate'] == null
        ? null
        : DateTime.parse(json['savedDate'] as String),
    json['isRead'] as bool,
  );
}

Map<String, dynamic> _$NotifiToJson(Notifi instance) => <String, dynamic>{
      'notification': instance.notification,
      'savedDate': instance.savedDate?.toIso8601String(),
      'isRead': instance.isRead,
    };
