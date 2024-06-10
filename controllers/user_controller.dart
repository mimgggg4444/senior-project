import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import '../services/firestore_service.dart';

class UserController {
  final FirestoreService _firestoreService = FirestoreService();


  // name데이터의 개별화를 위해 코드 수정 밑의 코드에는 name을 지웁니다.
  Future<void> saveUserData(
    String userId, // 사용자 식별자 추가
    String name,
    String id,
    int age,
    int weight,
    String guardian,
    int systolic,
    int diastolic,
    int bloodSugar,
    Timestamp timestamp, // 타임스탬프 파라미터 추가
    String nickname, // 닉네임 파라미터 추가
    String email, // 이메일 파라미터 추가
  ) async {
    final UserModel userModel = UserModel(
      name: name,
      id: id,
      age: age,
      weight: weight,
      guardian: guardian,
      systolic: systolic,
      diastolic: diastolic,
      bloodSugar: bloodSugar,
      nickname: nickname,
      // 닉네임 할당
      email: email,
      // 이메일 할당

      timestamp: timestamp,  // 타임스탬프 할당
    );

    await _firestoreService.saveToFirestore(userId, userModel); // 사용자 식별자 전달
  }
}
