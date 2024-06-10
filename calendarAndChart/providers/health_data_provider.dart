import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../models/HealthData.dart';

class HealthDataProvider with ChangeNotifier {
  /// 날짜별로 데이터를 그룹화하여 저장. 특정 날짜의 데이터를 가져올 때 더 빠른 검색이 가능
  final Map<DateTime, List<HealthData>> _healthDataMap = {};

  List<HealthData> get allData =>
      _healthDataMap.values.expand((data) => data).toList();

  void addHealthData(HealthData data) {
    final dateKey = DateTime(data.date.year, data.date.month, data.date.day);
    _healthDataMap[dateKey] ??= [];
    _healthDataMap[dateKey]!.add(data);
    debugPrint('입력 : ${data.date.day}');
    notifyListeners();
  }

  List<HealthData> getDataForDay(DateTime day) {
    final dateKey = DateTime(day.year, day.month, day.day);
    return _healthDataMap[dateKey] ?? [];
  }

  // 파이어베이스 데이터 불러오기
  Future<void> loadDataFromFirebase() async {
    final userId = 'ktgMbo0sT6gyhgTNv8c96UZ3FVm2'; // 사용자 ID설정
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('user_data')
        .get();

    snapshot.docs.forEach((doc) {
      final userModel = UserModel.fromMap(doc.data());
      final healthData = HealthData(
        date: userModel.timestamp!.toDate(),
        systolicBP: userModel.systolic,
        diastolicBP: userModel.diastolic,
        bloodSugar: userModel.bloodSugar,
      );
      addHealthData(healthData);
    });

    notifyListeners();
  }


}

