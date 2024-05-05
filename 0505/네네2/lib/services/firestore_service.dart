import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveToFirestore(UserModel userModel) async {
    try {
      await _firestore.collection('users').doc().set(userModel.toMap());
    } catch (e) {
      print('Failed to save data to Firestore: $e');
    }
  }
}