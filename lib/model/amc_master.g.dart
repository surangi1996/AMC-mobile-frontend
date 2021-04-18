// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amc_master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmcMaster _$AmcMasterFromJson(Map<String, dynamic> json) {
  return AmcMaster(
    json['amcNo'] as String,
    json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    json['frequency'] as String,
    json['exchageRate'] as bool,
    json['totalValue'] as String,
    json['totalValueLkr'] as String,
    json['remark'] as String,
    json['invDesc'] as String,
    json['savedBy'] as String,
    json['savedOn'] as String,
    json['savedIp'] as String,
  );
}

Map<String, dynamic> _$AmcMasterToJson(AmcMaster instance) => <String, dynamic>{
      'amcNo': instance.amcNo,
      'startDate': instance.startDate?.toIso8601String(),
      'frequency': instance.frequency,
      'exchageRate': instance.exchageRate,
      'totalValue': instance.totalValue,
      'totalValueLkr': instance.totalValueLkr,
      'remark': instance.remark,
      'invDesc': instance.invDesc,
      'savedBy': instance.savedBy,
      'savedOn': instance.savedOn,
      'savedIp': instance.savedIp,
    };
