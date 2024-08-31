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
      backgroundColor: const Color.fromARGB(255, 238, 243, 247),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBarCard(),
            const SizedBox(height: 10),
            vehicleCard(),
            const SizedBox(height: 5),
            conditionsCard(),
            const SizedBox(height: 3),
            buildDetailsCard(),
            const SizedBox(height: 5),
            buildUsageConditions(),
            const SizedBox(height: 5),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showAlertDialog(context);
                },
                child: const Text('Değişiklikleri Kaydet',style: TextStyle(fontSize: 15)),
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
      shadowColor: const Color.fromARGB(5, 0, 0, 0),
      color: Colors.white,
      elevation: 1.0,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/logo.png', width: 60, height: 40),
              const SizedBox(width: 10),
              Image.asset('assets/images/yatport.png', width: 80, height: 40),
              const Spacer(),
              Image.asset('assets/images/notification.png',
                  width: 30, height: 40),
              const SizedBox(width: 15),
              Image.asset('assets/images/hamburger_menu.png',
                  width: 30, height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget vehicleCard() {
    return const Card(
      shadowColor:   Color.fromARGB(5, 0, 0, 0),
      color: Colors.white,
      elevation: 2.0,
      child: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Center(
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Center(
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 25,
                  color: Color.fromARGB(246, 43, 43, 43),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Center(child: Text('Taşıtlarım', style:TextStyle(fontSize:24, fontWeight: FontWeight.bold, fontFamily: 'Inter',color:Color.fromARGB(255, 26, 34, 40))), )
            ],
          ),
        ),
      ),
    );
  }

  Widget conditionsCard() {
  return Card(
    shadowColor: const Color.fromARGB(5, 0, 0, 0),
    color: Colors.white,
    elevation: 3.0,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildConditionTab(
                "Taşıt Detayları",
                Colors.white,
                const Color.fromARGB(38, 114, 114, 114),
                const Color.fromARGB(215, 66, 82, 94),),
                const SizedBox(width: 8),
            _buildConditionTab(
                "Şartlar",
                const Color.fromARGB(255, 24, 158, 253),
                const Color.fromARGB(255, 24, 158, 253),
                 Colors.white),
                 const SizedBox(width: 8),
            _buildConditionTab(
                "Servisler",
                Colors.white,
                const Color.fromARGB(38, 114, 114, 114),
                const Color.fromARGB(215, 66, 82, 94),),
          ],
        ),
      ),
    ),
  );
}


  Widget _buildConditionTab(
      String title, Color backgroundColor, Color borderColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(40.0),
        border: Border.all(color: borderColor,width: 2.0),
        
      ),
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
          fontSize: 18,
        ),
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
