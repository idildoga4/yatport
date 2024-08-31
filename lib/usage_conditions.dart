import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsageConditionsCard extends StatefulWidget {
  @override
  _UsageConditionsCardState createState() => _UsageConditionsCardState();
}

class _UsageConditionsCardState extends State<UsageConditionsCard> {
  late List<bool> conditionsChecked;

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

  @override
  void initState() {
    super.initState();

    conditionsChecked = List<bool>.filled(usageConditions.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.white,
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Kullanım Şartları",
              style:GoogleFonts.inter( 
                textStyle: const TextStyle(
                  fontSize: 24,
                   fontWeight: FontWeight.bold,)),
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
                  style:const TextStyle(
                    fontSize: 16,
                      fontWeight: FontWeight.w400, 
                      fontFamily: 'Inter',
                      color: Color.fromARGB(255, 30, 33, 36), 
                  )
                  ),
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
