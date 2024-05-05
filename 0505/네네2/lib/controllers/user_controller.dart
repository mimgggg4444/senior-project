import '../models/user_model.dart';
import '../services/firestore_service.dart';

class UserController {
  final FirestoreService _firestoreService = FirestoreService();

  Future<void> saveUserData(
      String name,
      String id,
      int age,
      int weight,
      String guardian,
      int systolic,
      int diastolic,
      int bloodSugar,
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
    );

    await _firestoreService.saveToFirestore(userModel);
  }
}