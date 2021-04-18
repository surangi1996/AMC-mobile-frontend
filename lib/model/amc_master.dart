import 'package:json_annotation/json_annotation.dart';

part 'amc_master.g.dart';

@JsonSerializable()
class AmcMaster {
  String amcNo;
  DateTime startDate;
  String frequency;
  bool exchageRate;
  String totalValue;
  String totalValueLkr;
  String remark;
  String invDesc;
  String savedBy;
  String savedOn;
  String savedIp;

  AmcMaster(
      this.amcNo,
      this.startDate,
      this.frequency,
      this.exchageRate,
      this.totalValue,
      this.totalValueLkr,
      this.remark,
      this.invDesc,
      this.savedBy,
      this.savedOn,
      this.savedIp);
  factory AmcMaster.fromJson(Map<String, dynamic> data) =>
      _$AmcMasterFromJson(data);

  Map<String, dynamic> toJson() => _$AmcMasterToJson(this);
}
