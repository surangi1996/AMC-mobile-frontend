// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return Invoice(
    json['amcNo'] as String,
    json['categoryName'] as String,
    json['currencyName'] as String,
    json['exchangeRate'] as String,
    json['totalTax'] as String,
    json['totalAmt'] as String,
    json['invoiceAmount'] as String,
    json['totalamountPayble'] as String,
  );
}

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'amcNo': instance.amcNo,
      'categoryName': instance.categoryName,
      'currencyName': instance.currencyName,
      'exchangeRate': instance.exchangeRate,
      'totalTax': instance.totalTax,
      'totalAmt': instance.totalAmt,
      'invoiceAmount': instance.invoiceAmount,
      'totalamountPayble': instance.totalamountPayble,
    };
