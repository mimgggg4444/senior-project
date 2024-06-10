import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/HealthData.dart';
import '../providers/health_data_provider.dart';
import '../widgets/input_field.dart';
import 'calendar_page.dart';
import 'chart_page.dart';

class calendarAndChart extends StatefulWidget {
  const calendarAndChart({super.key});

  @override
  _calendarAndChartState createState() => _calendarAndChartState();
}

class _calendarAndChartState extends State<calendarAndChart> {
  List<HealthData> healthDataList = []; // HealthData 객체 저장 리스트

  final _formKey = GlobalKey<FormState>(); // Form 위젯 상태 관리키
  final systolicBPController = TextEditingController();
  final diastolicBPController = TextEditingController();
  final bloodSugarController = TextEditingController();

  @override
  void dispose() {
    systolicBPController.dispose();
    diastolicBPController.dispose();
    bloodSugarController.dispose();
    super.dispose();
  }

  /// 건강 데이터 추가 함수.
  void addHealthData() {
    // 입력 값 검증
    if (_formKey.currentState!.validate()) {
      final now = DateTime.now();
      final systolicBP = int.tryParse(systolicBPController.text) ?? 0;
      final diastolicBP = int.tryParse(diastolicBPController.text) ?? 0;
      final bloodSugar = int.tryParse(bloodSugarController.text) ?? 0;

      final newData = HealthData(
        date: now,
        systolicBP: systolicBP,
        diastolicBP: diastolicBP,
        bloodSugar: bloodSugar,
      );

      Provider.of<HealthDataProvider>(context, listen: false).addHealthData(newData);
      debugPrint("추가한 데이터1: ${newData.date}");
      // systolicBPController.clear();
      // diastolicBPController.clear();
      // bloodSugarController.clear();
    }
  }

  /// 건강 데이터 추가 함수.
  void addHealthData2() {
    final random = Random();
    final startDate = DateTime(2023, 4, 17);
    final endDate = DateTime(2023, 4, 20);
    // 무작위로 날짜 생성
    final randomDay =
        startDate.add(Duration(days: random.nextInt(endDate.difference(startDate).inDays + 1)));
    // 무작위로 시간 생성
    final randomHour = random.nextInt(24);
    final randomMinute = random.nextInt(60);

    // 입력 값 검증
    if (_formKey.currentState!.validate()) {
      // final now =
      //     DateTime(randomDay.year, randomDay.month, randomDay.day, randomHour, randomMinute, 0, 0, 0);
      final now = DateTime(2024, 5, randomDay.day, randomHour, randomMinute, 0, 0, 0);
      final systolicBP = int.tryParse(systolicBPController.text) ?? 0;
      final diastolicBP = int.tryParse(diastolicBPController.text) ?? 0;
      final bloodSugar = int.tryParse(bloodSugarController.text) ?? 0;

      final newData = HealthData(
        date: now,
        systolicBP: systolicBP,
        diastolicBP: diastolicBP,
        bloodSugar: bloodSugar,
      );

      Provider.of<HealthDataProvider>(context, listen: false).addHealthData(newData);
      debugPrint("추가한 데이터2: ${newData.date}");
      // systolicBPController.clear();
      // diastolicBPController.clear();
      // bloodSugarController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Data'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // 입력 폼
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildInputFields(),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: addHealthData,
                  child: const Text('무작위 날짜 추가'),
                ),
                ElevatedButton(
                  onPressed: addHealthData2,
                  child: const Text('오늘 날짜 추가'),
                ),
                const SizedBox(height: 16.0),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChartPage()),
                    );
                  },
                  child: const Text('Chart Page'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CalendarPage()),
                    );
                  },
                  child: const Text('Calendar Page'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 혈압, 혈당 위젯
  Widget _buildInputFields() {
    return Column(
      children: [
        InputField(controller: systolicBPController, label: '수축기 혈압'),
        InputField(controller: diastolicBPController, label: '이완기 혈압'),
        InputField(controller: bloodSugarController, label: '혈당'),
      ],
    );
  }
}
