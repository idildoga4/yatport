import 'package:flutter/material.dart';
import 'package:tekne_sahibi/rental_condition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RentalConditionsWidget extends StatefulWidget {
  @override
  _RentalConditionsWidgetState createState() => _RentalConditionsWidgetState();
}

class _RentalConditionsWidgetState extends State<RentalConditionsWidget> {
  late Future<List<RentalCondition>> rentalConditions;

  @override
  void initState() {
    super.initState();
    rentalConditions = fetchRentalConditions();
  }

  Future<List<RentalCondition>> fetchRentalConditions() async {
    final response = await http.get(Uri.parse(
        'https://66d05a85181d059277de39cc.mockapi.io/api/rent/rentalConditions'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => RentalCondition.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load rental conditions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RentalCondition>>(
      future: rentalConditions,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Hata oluştu: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          List<RentalCondition> conditions = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: conditions.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Kiralama Şartları",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        buildConditionRow("İptal Politikası",
                            conditions[index].cancellationPolicy),
                        buildConditionRow("Minimum Kiralama Süresi",
                            conditions[index].minimumRentalTime as String?),
                        buildConditionRow(
                            "Özel Günler için Minimum Kiralama Süresi",
                            conditions[index].minimumRentalTimeForSpecialDays
                                as String?),
                        buildConditionRow(
                            "Tur Şartları", conditions[index].tourConditions),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: Text('Veri bulunamadı'));
        }
      },
    );
  }
}

Widget buildConditionRow(String title, String? value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ],
    ),
  );
}
