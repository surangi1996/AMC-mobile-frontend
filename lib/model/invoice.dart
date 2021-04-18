import 'package:json_annotation/json_annotation.dart';

part 'invoice.g.dart';

@JsonSerializable()
class Invoice {
  String amcNo;
  String categoryName;
  String currencyName;
  String exchangeRate;
  String totalTax;
  String totalAmt;
  String invoiceAmount;
  String totalamountPayble;

  Invoice(this.amcNo, this.categoryName, this.currencyName, this.exchangeRate,
      this.totalTax, this.totalAmt, this.invoiceAmount, this.totalamountPayble);
  factory Invoice.fromJson(Map<String, dynamic> data) =>
      _$InvoiceFromJson(data);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}
