import 'package:flutter/material.dart';
import 'package:tekne_sahibi/rental_condition_widget.dart';
import 'package:tekne_sahibi/usage_conditions.dart';

class YatPortApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    showAlertDialog(BuildContext context) {
      AlertDialog alert = AlertDialog(
          content: const Text("Kaydedildi. İyi eğlenceler!"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Center(
                  child: Text('Kapat'),
                ))
          ]);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(57, 187, 206, 216),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBarCard(),
            const SizedBox(height: 10),
            vehicleCard(),
            const SizedBox(height: 10),
            conditionsCard(),
            const SizedBox(height: 10),
            buildDetailsCard(),
            const SizedBox(height: 10),
            buildUsageConditions(),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showAlertDialog(context);
                },
                child: const Text('Değişiklikleri Kaydet'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  minimumSize: const Size(350, 65),
                ),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(width: 15),
            const Text(
              "YatPort",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            const Icon(
              Icons.notifications_outlined,
              size: 30,
            ),
            const SizedBox(width: 15),
            const Icon(Icons.list_outlined, size: 30),
          ],
        ),
      ),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget conditionsCard() {
    return Card(
      color: Colors.white,
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildConditionTab("Taşıt Detayları", Colors.white,
                Colors.grey.shade300, const Color.fromARGB(186, 0, 0, 0)),
            _buildConditionTab(
                "Şartlar", Colors.blue, Colors.grey.shade300, Colors.white),
            _buildConditionTab("Servisler", Colors.white, Colors.grey.shade400,
                const Color.fromARGB(186, 0, 0, 0)),
          ],
        ),
      ),
    );
  }

  Widget _buildConditionTab(
      String title, Color backgroundColor, Color borderColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }

  Widget buildDetailsCard() {
    return RentalConditionsWidget();
  }

  Widget buildUsageConditions() {
    return UsageConditionsCard();
  }
}
