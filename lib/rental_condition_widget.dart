import 'package:flutter/material.dart';
import 'package:tekne_sahibi/rental_condition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RentalConditionsWidget extends StatefulWidget {
  @override
  _RentalConditionsWidgetState createState() => _RentalConditionsWidgetState();
}

class _RentalConditionsWidgetState extends State<RentalConditionsWidget> {
  late Future<RentalCondition> rentalCondition;

  @override
  void initState() {
    super.initState();
    rentalCondition = fetchRentalConditions();
  }

  Future<RentalCondition> fetchRentalConditions() async {
    final response = await http.get(Uri.parse(
        'https://b0df0867-2db8-4fcc-8477-87fb0a9b13aa.mock.pstmn.io'));

    if (response.statusCode == 200) {
      return RentalCondition.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load rental conditions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RentalCondition>(
      future: rentalCondition,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Hata oluştu: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          RentalCondition? condition = snapshot.data;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kiralama Şartları",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    buildConditionRow(
                        "İptal Politikası", condition?.cancellationPolicy),
                    buildConditionRow("Minimum Kiralama Süresi",
                        condition?.minimumRentalTime),
                    buildConditionRow(
                        "Özel Günler için Minimum Kiralama Süresi",
                        condition?.minimumRentalTimeForSpecialDays),
                    buildConditionRow(
                        "Tur Şartları", condition?.tourConditions),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(child: Text('Veri bulunamadı'));
        }
      },
    );
  }

  Widget buildConditionRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
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
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
