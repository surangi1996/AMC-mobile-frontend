import 'package:json_annotation/json_annotation.dart';

part 'receipt.g.dart';

@JsonSerializable()
class Receipt {
  String recNo;
  DateTime recDate;
  String cancelReason;
  bool cancel;
  String exchageRate;
  String description;
  String payMode;
  String total;
  String balance;
  String totalLkr;
  String balanceLkr;
  String savedBy;
  String savedIp;
  String canceledBy;
  DateTime savedOn;
  DateTime canceledOn;

  Receipt(
      this.recNo,
      this.recDate,
      this.cancelReason,
      this.cancel,
      this.exchageRate,
      this.description,
      this.payMode,
      this.balance,
      this.balanceLkr,
      this.canceledBy,
      this.canceledOn,
      this.savedBy,
      this.savedIp,
      this.savedOn,
      this.total,
      this.totalLkr);
  factory Receipt.fromJson(Map<String, dynamic> data) =>
      _$ReceiptFromJson(data);

  Map<String, dynamic> toJson() => _$ReceiptToJson(this);
}
