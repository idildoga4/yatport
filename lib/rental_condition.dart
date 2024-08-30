class RentalCondition {
  late final String cancellationPolicy;
  late final String minimumRentalTime;
  late final String minimumRentalTimeForSpecialDays;
  late final String tourConditions;

  RentalCondition({
    required this.cancellationPolicy,
    required this.minimumRentalTime,
    required this.minimumRentalTimeForSpecialDays,
    required this.tourConditions,
  });

  factory RentalCondition.fromJson(Map<String, dynamic> json) {
    return RentalCondition(
      cancellationPolicy: json['cancellationPolicy'],
      minimumRentalTime: json['minimumRentalTime'].toString(),
      minimumRentalTimeForSpecialDays:
          json['minimumRentalTimeForSpecialDays'].toString(),
      tourConditions: json['tourConditions'],
    );
  }
}
