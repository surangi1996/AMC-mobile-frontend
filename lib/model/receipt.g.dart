// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Receipt _$ReceiptFromJson(Map<String, dynamic> json) {
  return Receipt(
    json['recNo'] as String,
    json['recDate'] == null ? null : DateTime.parse(json['recDate'] as String),
    json['cancelReason'] as String,
    json['cancel'] as bool,
    json['exchageRate'] as String,
    json['description'] as String,
    json['payMode'] as String,
    json['balance'] as String,
    json['balanceLkr'] as String,
    json['canceledBy'] as String,
    json['canceledOn'] == null
        ? null
        : DateTime.parse(json['canceledOn'] as String),
    json['savedBy'] as String,
    json['savedIp'] as String,
    json['savedOn'] == null ? null : DateTime.parse(json['savedOn'] as String),
    json['total'] as String,
    json['totalLkr'] as String,
  );
}

Map<String, dynamic> _$ReceiptToJson(Receipt instance) => <String, dynamic>{
      'recNo': instance.recNo,
      'recDate': instance.recDate?.toIso8601String(),
      'cancelReason': instance.cancelReason,
      'cancel': instance.cancel,
      'exchageRate': instance.exchageRate,
      'description': instance.description,
      'payMode': instance.payMode,
      'total': instance.total,
      'balance': instance.balance,
      'totalLkr': instance.totalLkr,
      'balanceLkr': instance.balanceLkr,
      'savedBy': instance.savedBy,
      'savedIp': instance.savedIp,
      'canceledBy': instance.canceledBy,
      'savedOn': instance.savedOn?.toIso8601String(),
      'canceledOn': instance.canceledOn?.toIso8601String(),
    };
