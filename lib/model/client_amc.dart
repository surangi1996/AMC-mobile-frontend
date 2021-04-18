import 'package:json_annotation/json_annotation.dart';

part 'client_amc.g.dart';

@JsonSerializable()
class ClientAmc {
  String amc_no;
  String category_name;
  String start_date;
  String amc_product_no;
  String product_description;
  String department_name;
  String client_id;
  String frequency;
  String mtc_start_date;
  String mtc_end_date;
  String amc_serial_no;

  ClientAmc(
      this.amc_no,
      this.category_name,
      this.start_date,
      this.amc_product_no,
      this.product_description,
      this.department_name,
      this.client_id,
      this.frequency,
      this.mtc_end_date,
      this.mtc_start_date,
      this.amc_serial_no);
  factory ClientAmc.fromJson(Map<String, dynamic> data) =>
      _$ClientAmcFromJson(data);

  Map<String, dynamic> toJson() => _$ClientAmcToJson(this);
}
