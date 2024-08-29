class RentalCondition {
  final String cancellationPolicy;
  final int minimumRentalTime;
  final int minimumRentalTimeForSpecialDays;
  final String tourConditions;

  RentalCondition({
    required this.cancellationPolicy,
    required this.minimumRentalTime,
    required this.minimumRentalTimeForSpecialDays,
    required this.tourConditions,
  });

  factory RentalCondition.fromJson(Map<String, dynamic> json) {
    return RentalCondition(
      cancellationPolicy: json['cancellationPolicy'],
      minimumRentalTime: json['minimumRentalTime'],
      minimumRentalTimeForSpecialDays: json['minimumRentalTimeForSpecialDays'],
      tourConditions: json['tourConditions'],
    );
  }
}
