class ClientAmc {
  ClientAmc({
    this.amcNo,
    this.categoryName,
    this.mtcEndDate,
    this.amcProductNo,
    this.mtcStartDate,
    this.startDate,
    this.clientId,
    this.departmentName,
    this.frequency,
    this.amcSerialNo,
    this.productDescription,
  });

  String amcNo;
  String categoryName;
  String mtcEndDate;
  int amcProductNo;
  String mtcStartDate;
  String startDate;
  String clientId;
  String departmentName;
  String frequency;
  String amcSerialNo;
  String productDescription;

  factory ClientAmc.fromJson(Map<String, dynamic> json) => ClientAmc(
        amcNo: json["amc_no"],
        categoryName: json["category_name"],
        mtcEndDate: json["mtc_end_date"],
        // mtcEndDate: DateTime.parse(json["mtc_end_date"]),
        amcProductNo: json["amc_product_no"],
        mtcStartDate: json["mtc_start_date"],
        startDate: json["start_date"],
        // mtcStartDate: DateTime.parse(json["mtc_start_date"]),
        // startDate: DateTime.parse(json["start_date"]),
        clientId: json["client_id"],
        departmentName: json["department_name"],
        frequency: json["frequency"],
        amcSerialNo: json["amc_serial_no"],
        productDescription: json["product_description"],
      );
}
