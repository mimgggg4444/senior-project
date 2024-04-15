// health_record_page.dart
import 'package:flutter/material.dart';
import 'health_record_service.dart';

class HealthRecordPage extends StatefulWidget {
  @override
  _HealthRecordPageState createState() => _HealthRecordPageState();
}

class _HealthRecordPageState extends State<HealthRecordPage> {
  final HealthRecordService _healthRecordService = HealthRecordService();
  final String _userId = 'user123';

  int _bloodSugar = 95;
  int _systolicBloodPressure = 120;
  int _diastolicBloodPressure = 80;
  double _weight = 70.0;
  double _bmi = 22.5;

  void _saveHealthRecord() {
    _healthRecordService.saveHealthRecord(
      _userId,
      _bloodSugar,
      {'systolic': _systolicBloodPressure, 'diastolic': _diastolicBloodPressure},
      _weight,
      _bmi,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Record'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Blood Sugar: $_bloodSugar'),
            SizedBox(height: 8.0),
            Text('Blood Pressure: $_systolicBloodPressure / $_diastolicBloodPressure'),
            SizedBox(height: 8.0),
            Text('Weight: $_weight'),
            SizedBox(height: 8.0),
            Text('BMI: $_bmi'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveHealthRecord,
              child: Text('Save Health Record'),
            ),
          ],
        ),
      ),
    );
  }
}
