// health_record_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class HealthRecordService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveHealthRecord(
    String userId,
    int bloodSugar,
    Map<String, int> bloodPressure,
    double weight,
    double bmi,
  ) async {
    try {
      await _firestore.collection('healthRecords').add({
        'userId': userId,
        'recordDate': Timestamp.now(),
        'bloodSugar': bloodSugar,
        'bloodPressure': {
          'systolic': bloodPressure['systolic']!,
          'diastolic': bloodPressure['diastolic']!,
        },
        'weight': weight,
        'bmi': bmi,
      });
      print('Health record saved successfully');
    } catch (e) {
      print('Error saving health record: $e');
    }
  }
}
