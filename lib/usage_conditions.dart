import 'package:flutter/material.dart';

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
    return Card(
      color: Colors.white,
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Kullanım Şartları",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color:Color.fromARGB(220, 0, 0, 0)),
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
                  title: Text(condition),
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