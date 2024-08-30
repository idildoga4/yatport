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

  String? selectedCancellationPolicy;
  String? selectedMinimumRentalTime;
  String? selectedMinimumRentalTimeForSpecialDays;
  String? selectedTourConditions;

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

          // API'dan gelen verileri başlatıyoruz.
          selectedCancellationPolicy ??= conditions[0].cancellationPolicy;
          selectedMinimumRentalTime ??= conditions[0].minimumRentalTime;
          selectedMinimumRentalTimeForSpecialDays ??=
              conditions[0].minimumRentalTimeForSpecialDays;
          selectedTourConditions ??= conditions[0].tourConditions;

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Card(
                  shadowColor: Color.fromARGB(5, 0, 0, 0),
                  color: Colors.white,
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Kiralama Şartları',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 13),
                        buildConditionRow(
                            'İptal Politikası',
                            selectedCancellationPolicy,
                            ['1 Hafta', '2 Hafta', 'Sunday'], (newValue) {
                          setState(() {
                            selectedCancellationPolicy = newValue!;
                          });
                        }),
                        buildConditionRow(
                            'Minimum Kiralama Süresi',
                            selectedMinimumRentalTime,
                            ['2 Saat', '3 Saat', '98'], (newValue) {
                          setState(() {
                            selectedMinimumRentalTime = newValue!;
                          });
                        }),
                        buildConditionRow(
                            'Özel Günler için Minimum Kiralama Süresi',
                            selectedMinimumRentalTimeForSpecialDays,
                            ['2 Saat', '3 Saat', '55'], (newValue) {
                          setState(() {
                            selectedMinimumRentalTimeForSpecialDays = newValue!;
                          });
                        }),
                        buildConditionRow(
                            'Tur Şartları',
                            selectedTourConditions,
                            ['Saatlik Tur', 'Yüzme Turu', 'Gasoline'],
                            (newValue) {
                          setState(() {
                            selectedTourConditions = newValue!;
                          });
                        }),
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

  Widget buildConditionRow(String label, String? value, List<String> options,
      ValueChanged<String?>? onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromARGB(127, 0, 0, 0)),
          ),
          const SizedBox(height: 8),
          Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border:
                    Border.all(color: const Color.fromARGB(139, 224, 224, 224)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  isExpanded: true,
                  onChanged: onChanged,
                  items: options.map<DropdownMenuItem<String>>((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black)),
                    );
                  }).toList(),
                  icon: const Icon(
                    Icons.expand_more_outlined,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
