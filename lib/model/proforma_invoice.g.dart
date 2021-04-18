// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proforma_invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProformaInvoice _$ProformaInvoiceFromJson(Map<String, dynamic> json) {
  return ProformaInvoice(
    (json['paidAmount'] as num)?.toDouble(),
    (json['paybleAmount'] as num)?.toDouble(),
    (json['balance'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ProformaInvoiceToJson(ProformaInvoice instance) =>
    <String, dynamic>{
      'paidAmount': instance.paidAmount,
      'paybleAmount': instance.paybleAmount,
      'balance': instance.balance,
    };
