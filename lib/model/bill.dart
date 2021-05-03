class ClientInvoice {
  ClientInvoice({
    this.amcNo,
    this.categoryName,
    this.currencyName,
    this.exchangeRate,
    this.totalTax,
    this.totalAmount,
    this.invoiceAmount,
    this.totalAmountPayble,
  });

  String amcNo;
  String categoryName;
  String currencyName;
  int exchangeRate;
  int totalTax;
  int totalAmount;
  int invoiceAmount;
  int totalAmountPayble;

  factory ClientInvoice.fromJson(Map<String, dynamic> json) => ClientInvoice(
        amcNo: json["amc_no"],
        categoryName: json["category_name"],
        currencyName: json["currency_name"],
        exchangeRate: json["exchange_rate"],
        totalTax: json["total_tax"],
        totalAmount: json["total_amount"],
        invoiceAmount: json["invoice_amount"],
        totalAmountPayble: json["total_amount_payble"],
      );
}
