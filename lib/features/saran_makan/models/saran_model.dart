class SaranMakan {
  final int budget;
  final int days;

  SaranMakan({required this.budget, required this.days});

  Map<String, dynamic> toJson() => {
        'budget': budget,
        'days': days,
      };
}
