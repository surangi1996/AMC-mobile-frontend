class AmcMaster {
  AmcMaster({
    this.amcNo,
  });

  String amcNo;

  factory AmcMaster.fromJson(Map<String, dynamic> json) => AmcMaster(
        amcNo: json["amc_no"],
      );
}
