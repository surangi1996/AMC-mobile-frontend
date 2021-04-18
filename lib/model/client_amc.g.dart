// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_amc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientAmc _$ClientAmcFromJson(Map<String, dynamic> json) {
  return ClientAmc(
    json['amc_no'] as String,
    json['category_name'] as String,
    json['start_date'] as String,
    json['amc_product_no'] as String,
    json['product_description'] as String,
    json['department_name'] as String,
    json['client_id'] as String,
    json['frequency'] as String,
    json['mtc_end_date'] as String,
    json['mtc_start_date'] as String,
    json['amc_serial_no'] as String,
  );
}

Map<String, dynamic> _$ClientAmcToJson(ClientAmc instance) => <String, dynamic>{
      'amc_no': instance.amc_no,
      'category_name': instance.category_name,
      'start_date': instance.start_date,
      'amc_product_no': instance.amc_product_no,
      'product_description': instance.product_description,
      'department_name': instance.department_name,
      'client_id': instance.client_id,
      'frequency': instance.frequency,
      'mtc_start_date': instance.mtc_start_date,
      'mtc_end_date': instance.mtc_end_date,
      'amc_serial_no': instance.amc_serial_no,
    };
