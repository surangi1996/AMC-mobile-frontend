class Dates {
  Dates({
    this.date,
  });

  String date;

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        date: json["date"],
      );
}
