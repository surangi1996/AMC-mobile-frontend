import 'package:json_annotation/json_annotation.dart';

part 'proforma_invoice.g.dart';

@JsonSerializable()
class ProformaInvoice {
  double paidAmount;
  double paybleAmount;
  double balance;

  ProformaInvoice(this.paidAmount, this.paybleAmount, this.balance);
  factory ProformaInvoice.fromJson(Map<String, dynamic> data) =>
      _$ProformaInvoiceFromJson(data);

  Map<String, dynamic> toJson() => _$ProformaInvoiceToJson(this);

  totalPaybleAmount(String s) {}
}
