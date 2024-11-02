class Schedule {
  final String date;

  Schedule({required this.date});

  factory Schedule.fromJson(String date) {
    return Schedule(date: date);
  }

  @override
  String toString() => date;
}
