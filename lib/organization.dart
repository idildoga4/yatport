import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tekne_sahibi/home_page.dart';

final List<String> usageConditionsOrganization = [
  "Dışardan catering firması getirilemez",
  "Mangal Yapılamaz",
  "Yüzme turları için yüzme turu seçeneğini seçmeniz gerekmektedir",
  "Dışardan catering firması getirilemez",
  "Mangal Yapılamaz",
  "Yüzme turları için yüzme turu seçeneğini seçmeniz gerekmektedir",
  "Dışardan catering firması getirilemez",
  "Mangal Yapılamaz",
  "Yüzme turları için yüzme turu seçeneğini seçmeniz gerekmektedir",
  "Dışardan catering firması getirilemez",
  "Mangal Yapılamaz",
  "Yüzme turları için yüzme turu seçeneğini seçmeniz gerekmektedir",
  "Dışardan catering firması getirilemez",
  "Mangal Yapılamaz",
  "Yüzme turları için yüzme turu seçeneğini seçmeniz gerekmektedir",
];

class OrganizationPage extends StatefulWidget {
  const OrganizationPage({super.key, required String activeTab});

  @override
  _OrganizationPageState createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
  late List<bool> conditionsCheckedOrganization;

  @override
  void initState() {
    super.initState();
    conditionsCheckedOrganization =
        List<bool>.filled(usageConditionsOrganization.length, false);
  }

  void showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: const Text("Kaydedildi. İyi eğlenceler!"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Center(
            child: Text('Kapat'),
          ),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(
              height: 5,
            ),
            buildUsageConditions(),
            const SizedBox(height: 5),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showAlertDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  minimumSize: const Size(350, 65),
                ),
                child: const Text('Değişiklikleri Kaydet',
                    style: TextStyle(fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget conditionsCard() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildConditionTab(
                  "Taşıt Detayları",
                  Colors.white,
                  const Color.fromARGB(38, 114, 114, 114),
                  const Color(0xFF526675),
                  context),
              const SizedBox(width: 16),
              _buildConditionTab(
                  "Şartlar",
                  const Color.fromARGB(255, 24, 158, 253),
                  const Color.fromARGB(255, 24, 158, 253),
                  Colors.white,
                  context),
              const SizedBox(width: 16),
              _buildConditionTab(
                  "Servisler",
                  Colors.white,
                  const Color.fromARGB(38, 114, 114, 114),
                  const Color(0xFF526675),
                  context),
              const SizedBox(width: 16),
              _buildConditionTab(
                "Organizasyonlar",
                Colors.white,
                const Color.fromARGB(38, 114, 114, 114),
                const Color(0xFF526675),
                context,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConditionTab(String title, Color backgroundColor,
      Color borderColor, Color textColor, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == "Şartlar") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else if (title == "Organizasyonlar") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    OrganizationPage(activeTab: "Organizasyonlar")),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Text(
          title,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontFamily: 'inter',
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAppBarCard() {
    return Container(
      color: Colors.white,
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
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              const Center(
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 25,
                  color: Color.fromARGB(246, 43, 43, 43),
                ),
              ),
              const SizedBox(width: 10),
              Center(
                child: Text(
                  'Taşıtlarım',
                  style: GoogleFonts.interTight(
                    textStyle: const TextStyle(
                      color: Color(0xFF1A2228),
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUsageConditions() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Organizasyonlar",
                  style: GoogleFonts.interTight(
                    textStyle: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A2228),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Image.asset("assets/images/info.png", height: 16, width: 16),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children:
                  usageConditionsOrganization.asMap().entries.map((entry) {
                int index = entry.key;
                String condition = entry.value;
                return ListTile(
                  leading: Icon(
                    conditionsCheckedOrganization[index]
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: conditionsCheckedOrganization[index]
                        ? Colors.green
                        : Colors.grey,
                  ),
                  title: Text(
                    condition,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      color: Color(0xFF000000),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      conditionsCheckedOrganization[index] =
                          !conditionsCheckedOrganization[index];
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
