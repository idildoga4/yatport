import 'package:flutter/material.dart';
import 'package:tekne_sahibi/rental_condition_widget.dart';
import 'package:tekne_sahibi/usage_conditions.dart';

class YatPortApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Mock data, replace with API data fetching in a real app
  final cancelationPolicy = "1 Hafta";
  final minRentDuration = "2 Saat";
  final specialDaysMinRentDuration = "2 Saat";
  final tourOptions = "Saatlik Tur & Yüzme Turu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBarCard(),
            const SizedBox(height: 20),
            vehicleCard(),
            const SizedBox(height: 20),
            conditionsCard(),
            const SizedBox(height: 20),
            buildDetailsCard(),
            const SizedBox(height: 20),
            buildUsageConditions(),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle save changes
                },
                child: Text('Değişiklikleri Kaydet'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAppBarCard() {
    return Card(
      color: Colors.white,
      elevation: 1.0,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(width: 15),
            const Text(
              "YatPort",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(width: 200),
            const Icon(
              Icons.notifications_outlined,
              size: 30,
            ),
            const SizedBox(width: 15),
            const Icon(Icons.list_outlined, size: 30),
          ])),
    );
  }

  Widget vehicleCard() {
    return const Card(
        color: Colors.white,
        elevation: 2.0,
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
                Text(
                  "Taşıtlarım",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                )
              ],
            )));
  }

  Widget conditionsCard() {
    return Card(
      color: Colors.white,
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Text(
                  'Taşıt Detayları',
                  style: TextStyle(color: Color.fromARGB(186, 0, 0, 0)),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Text(
                  'Şartlar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: const Text(
                  'Servisler',
                  style: TextStyle(color: Color.fromARGB(186, 0, 0, 0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  RentalConditionsWidget buildDetailsCard() {
    return RentalConditionsWidget();
  }

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget buildUsageConditions() {
    return UsageConditionsCard();
  }
}
