class ImmunizationDetails {
  final int id;
  final String vaccineName;
  final int initialRangeAge;
  final int finalRangeAge;
  final String timePeriodAge;

  ImmunizationDetails({
    required this.id,
    required this.vaccineName,
    required this.initialRangeAge,
    required this.finalRangeAge,
    required this.timePeriodAge,
  });

  factory ImmunizationDetails.fromJson(Map<String, dynamic> json) {
    return ImmunizationDetails(
      id: json['id'] ?? 0,
      vaccineName: json['vaccine_name'] ?? '',
      initialRangeAge: json['initial_range_age'] ?? 0,
      finalRangeAge: json['final_range_age'] ?? 0,
      timePeriodAge: json['time_period_age'] ?? '',
    );
  }
}

class PosyanduDetails {
  final int id;
  final String name;
  final String address;

  PosyanduDetails({
    required this.id,
    required this.name,
    required this.address,
  });

  factory PosyanduDetails.fromJson(Map<String, dynamic> json) {
    return PosyanduDetails(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      address: json['address'] ?? '',
    );
  }
}

class ImmunizationSchedule {
  final int id;
  final String scheduleDate;
  final bool isObligate;
  final PosyanduDetails posyandu;
  final ImmunizationDetails immunization;

  ImmunizationSchedule({
    required this.id,
    required this.scheduleDate,
    required this.isObligate,
    required this.posyandu,
    required this.immunization,
  });

  factory ImmunizationSchedule.fromJson(Map<String, dynamic> json) {
    return ImmunizationSchedule(
      id: json['id'] ?? 0,
      scheduleDate: json['schedule_date'] ?? '',
      isObligate: json['is_obligate'] == 1,
      posyandu: PosyanduDetails.fromJson(json['posyandu'] ?? {}),
      immunization: ImmunizationDetails.fromJson(json['immunization'] ?? {}),
    );
  }
}
