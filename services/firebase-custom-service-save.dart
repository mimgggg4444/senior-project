import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ocare/controllers/user_controller.dart';

class FirestoreServiceCustom {
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final UserController userController = UserController();

  Future<void> saveToFirestoreCustom({
    required TextEditingController nameController,
    required TextEditingController idController,
    required TextEditingController ageController,
    required TextEditingController weightController,
    required TextEditingController guardianController,
    required TextEditingController systolicController,
    required TextEditingController diastolicController,
    required TextEditingController bloodSugarController,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      final timestamp = Timestamp.now();

      if (userId == 'ktgMbo0sT6gyhgTNv8c96UZ3FVm2' ||
          userId == 'KWjegweDuEhSVN9I6D8iRnh22kc2') {
        String targetUserId = userId == 'ktgMbo0sT6gyhgTNv8c96UZ3FVm2'
            ? 'KWjegweDuEhSVN9I6D8iRnh22kc2'
            : 'ktgMbo0sT6gyhgTNv8c96UZ3FVm2';

        await userController.saveUserData(
          targetUserId,
          nameController.text,
          idController.text,
          int.tryParse(ageController.text) ?? 0,
          int.tryParse(weightController.text) ?? 0,
          guardianController.text,
          int.tryParse(systolicController.text) ?? 0,
          int.tryParse(diastolicController.text) ?? 0,
          int.tryParse(bloodSugarController.text) ?? 0,
          timestamp,
          nicknameController.text,
          emailController.text,
        );
      }

      await userController.saveUserData(
        userId,
        nameController.text,
        idController.text,
        int.tryParse(ageController.text) ?? 0,
        int.tryParse(weightController.text) ?? 0,
        guardianController.text,
        int.tryParse(systolicController.text) ?? 0,
        int.tryParse(diastolicController.text) ?? 0,
        int.tryParse(bloodSugarController.text) ?? 0,
        timestamp,
        nicknameController.text,
        emailController.text,
      );
    } else {
      // 로그인하지 않은 경우 처리 로직 추가
      return;
    }
  }
}