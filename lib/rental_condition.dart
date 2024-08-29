class RentalCondition {
  final String cancellationPolicy;
  final String minimumRentalTime;
  final String minimumRentalTimeForSpecialDays;
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
      minimumRentalTime: json['minimumRentalTime'].toString(),
      minimumRentalTimeForSpecialDays: json['minimumRentalTimeForSpecialDays'].toString(),
      tourConditions: json['tourConditions'],
    );
  }
}
