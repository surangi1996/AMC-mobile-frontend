class Date {
  Date({
    this.date,
  });

  String date;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        date: json["date"],
      );
}
