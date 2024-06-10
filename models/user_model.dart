import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


// 각 유저 모델이 무슨 기능을 하는지 파악.
class UserModel with ChangeNotifier {
  String name;
  String id;
  int age;
  int weight;
  String guardian;
  int systolic;
  int diastolic;
  int bloodSugar;
  String nickname;
  String email;
  List<String>? friends;
  Timestamp? timestamp;

  UserModel({
    required this.name,
    required this.id,
    required this.age,
    required this.weight,
    required this.guardian,
    required this.systolic,
    required this.diastolic,
    required this.bloodSugar,
    required this.nickname,
    required this.email,
    this.friends,
    this.timestamp,
  });


  // usermodel 주석화 및 dispose가 추가적으로 왜 주석화 되었는지, 다른곳에서 선언되어 주석화를 했는지 확인 요청
  // 질문에 긍정일 경우 true 반환
  // UserModel(
  //     {required this.name,
  //     required this.id,
  //     required this.age,
  //     required this.weight,
  //     required this.guardian,
  //     required this.systolic,
  //     required this.diastolic,
  //     required this.bloodSugar,
  //     required this.nickname,
  //     required this.email,
  //     this.friends,
  //     this.timestamp}) {
  //   _subscription = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser?.uid)
  //       .snapshots()
  //       .listen((snapshot) {
  //     if (snapshot.exists) {
  //       final userData = snapshot.data();
  //       name = userData?['name'] ?? '';
  //       id = userData?['id'] ?? '';
  //       age = userData?['age'] ?? 0;
  //       weight = userData?['weight'] ?? 0;
  //       guardian = userData?['guardian'] ?? '';
  //       systolic = userData?['systolic'] ?? 0;
  //       diastolic = userData?['diastolic'] ?? 0;
  //       bloodSugar = userData?['bloodSugar'] ?? 0;
  //       nickname = userData?['nickname'] ?? '';
  //       email = userData?['email'] ?? '';
  //       timestamp = userData?['timestamp']; // 이 부분을 추가합니다.
  //
  //       notifyListeners();
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   _subscription.cancel();
  //   super.dispose();
  // }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      id: map['id'],
      age: map['age'],
      weight: map['weight'],
      guardian: map['guardian'],
      systolic: map['systolic'],
      diastolic: map['diastolic'],
      bloodSugar: map['bloodSugar'],
      nickname: map['nickname'] ?? '',
      email: map['email'] ?? '',
      friends: List<String>.from(map['friends'] ?? []),
      timestamp:
          map['timestamp'] != null ? (map['timestamp'] as Timestamp) : null,
    );
  }

  // map으로 데이터를 일치시켜서 저장하는 로직.

  Map<String, dynamic> toMap() {
    return {
      // nickname과 name의 차이가 뭔가?
      'name': name,

      'id': id,
      'age': age,
      'weight': weight,

      // 보호자의 data는 어떻게 저장되며, 출력은 어디에 되는지 확인해야하는 구문
      'guardian': guardian,

      'systolic': systolic,
      'diastolic': diastolic,
      'bloodSugar': bloodSugar,

      // 데이터가 name으로 저장되는지 nickname으로 저장되는지 확인 불능.
      'nickname': nickname,

      // email과 friends, 의 데이터를 가져오지 못함. ->
      'email': email,
      'friends': friends,


      'timestamp': timestamp, // 타임스탬프 필드 추가 -> home에서 저장된 시간 데이터 출력할때 필요.
    };
  }


  // firebase의 초기화.
  Future<void> initFromFirestore() async {
    final firestore = FirebaseFirestore.instance;
    final userDoc = await firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    //  userdoc가 exists일 경우 해당 각 데이터에 맞춰서 초기화후 데이터를 입력하는가?
    if (userDoc.exists) {
      final userData = userDoc.data();
      name = userData?['name'] ?? '';
      id = userData?['id'] ?? '';
      age = userData?['age'] ?? 0;
      weight = userData?['weight'] ?? 0;
      guardian = userData?['guardian'] ?? '';
      systolic = userData?['systolic'] ?? 0;
      diastolic = userData?['diastolic'] ?? 0;
      bloodSugar = userData?['bloodSugar'] ?? 0;
      nickname = userData?['nickname'] ?? '';
      email = userData?['email'] ?? '';
      timestamp = userData?['timestamp']; // 타임스탬프 추가

      notifyListeners();
    } else {
      // 사용자 문서가 없는 경우 처리
    }
  }
}
