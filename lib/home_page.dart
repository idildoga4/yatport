import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tekne_sahibi/organization.dart';

const List<String> iptalPolitikasi = <String>['1 Hafta', '2 Hafta', '3 Hafta'];
const List<String> minKiralamaSuresi = <String>['2 Saat', '3 Saat', '4 Saat'];
const List<String> ozelGunler = <String>['2 Saat', '3 Saat', '4 Saat'];
const List<String> kiralamaSartlari = <String>[
  'Saatlik Tur & Yüzme Turu',
  '3 Saat',
  '4 Saat'
];
final List<String> usageConditions = [
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

String iptalPolitikasiValue = iptalPolitikasi.first;
String minKiralamaSuresiValue = minKiralamaSuresi.first;
String ozelGunlerValue = ozelGunler.first;
String kiralamaSartlariValue = kiralamaSartlari.first;
String activeTab = 'Şartlar';

class YatPortApp extends StatelessWidget {
  const YatPortApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activeTab = "Şartlar";
  late List<bool> conditionsChecked;

  @override
  void initState() {
    super.initState();

    conditionsChecked = List<bool>.filled(usageConditions.length, false);
  }

  void setActiveTab(String tab) {
    setState(() {
      activeTab = tab;
    });
  }

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
              const SizedBox(
                width: 10,
              ),
              const Center(
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 25,
                  color: Color.fromARGB(246, 43, 43, 43),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Center(
                  child: Text(
                'Taşıtlarım',
                style: GoogleFonts.interTight(
                    textStyle: const TextStyle(
                        color: Color(0xFF1A2228),
                        fontWeight: FontWeight.w600,
                        fontSize: 19)),
              )),
            ],
          ),
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
                  context,
                  setActiveTab,
                  "Taşıt Detayları"),
              const SizedBox(width: 16),
              _buildConditionTab(
                  "Şartlar",
                  activeTab == "Şartlar"
                      ? const Color.fromARGB(255, 24, 158, 253)
                      : Colors.white,
                  activeTab == "Şartlar"
                      ? Colors.blue
                      : const Color.fromARGB(38, 114, 114, 114),
                  activeTab == "Şartlar"
                      ? Colors.white
                      : const Color(0xFF526675),
                  context,
                  setActiveTab,
                  "Şartlar"),
              const SizedBox(width: 16),
              _buildConditionTab(
                  "Servisler",
                  Colors.white,
                  const Color.fromARGB(38, 114, 114, 114),
                  const Color(0xFF526675),
                  context,
                  setActiveTab,
                  "Servisler"),
              const SizedBox(width: 16),
              _buildConditionTab(
                  "Organizasyonlar",
                  Colors.white,
                  const Color.fromARGB(38, 114, 114, 114),
                  const Color(0xFF526675),
                  context,
                  setActiveTab,
                  "Organizasyonlar"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConditionTab(
      String title,
      Color backgroundColor,
      Color borderColor,
      Color textColor,
      BuildContext context,
      void Function(String) setActiveTab,
      String tabName) {
    return GestureDetector(
      onTap: () {
        setActiveTab(tabName);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrganizationPage(activeTab: tabName)),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(color: borderColor, width: 2.0),
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

  Widget buildDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Kiralama Şartları",
            style: GoogleFonts.interTight(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A2228),
            ),
          ),
          const SizedBox(height: 16),
          buildDropdownWithLabel(
            "İptal Politikası",
            iptalPolitikasiValue,
            iptalPolitikasi,
            (String? value) {
              setState(() {
                iptalPolitikasiValue = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          buildDropdownWithLabel(
            "Minimum Kiralama Süresi",
            minKiralamaSuresiValue,
            minKiralamaSuresi,
            (String? value) {
              setState(() {
                minKiralamaSuresiValue = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          buildDropdownWithLabel(
            "Özel Günler İçin Minimum Kiralama Süresi",
            ozelGunlerValue,
            ozelGunler,
            (String? value) {
              setState(() {
                ozelGunlerValue = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          buildDropdownWithLabel(
            "Tur Şartları",
            kiralamaSartlariValue,
            kiralamaSartlari,
            (String? value) {
              setState(() {
                kiralamaSartlariValue = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildDropdownWithLabel(
    String label,
    String currentValue,
    List<String> items,
    ValueChanged<String?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF526675),
              ),
            ),
            const SizedBox(width: 4),
            if (label == "İptal Politikası")
              Image.asset(
                'assets/images/info.png',
                height: 16,
                width: 16,
              ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: Color(0xFFF7F9FA),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: DropdownButton<String>(
            value: currentValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            elevation: 16,
            isExpanded: true,
            style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xFF1A2228)),
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
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
            Text(
              "Kullanım Şartları",
              style: GoogleFonts.interTight(
                  textStyle: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A2228))),
            ),
            const SizedBox(height: 10),
            Column(
              children: usageConditions.asMap().entries.map((entry) {
                int index = entry.key;
                String condition = entry.value;
                return ListTile(
                  leading: Icon(
                      conditionsChecked[index]
                          ? Icons.check_circle
                          : Icons.circle_outlined,
                      color: conditionsChecked[index]
                          ? Colors.green
                          : Colors.grey),
                  title: Text(condition,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                        color: Color(0xFF000000),
                      )),
                  onTap: () {
                    setState(() {
                      conditionsChecked[index] = !conditionsChecked[index];
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
