import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../services/firebase-custom-service-save.dart';
import 'text_field_with_controller.dart';

class UserBox extends StatelessWidget {
  UserBox({
    super.key,
    required this.nameController,
    required this.idController,
    required this.ageController,
    required this.weightController,
    required this.guardianController,
    required this.systolicController,
    required this.diastolicController,
    required this.bloodSugarController,
  });

  final TextEditingController nameController;
  final TextEditingController idController;
  final TextEditingController ageController;
  final TextEditingController weightController;
  final TextEditingController guardianController;
  final TextEditingController systolicController;
  final TextEditingController diastolicController;
  final TextEditingController bloodSugarController;

  final systolicValues =
      List.generate(200, (index) => (index + 100).toString());
  final diastolicValues =
      List.generate(150, (index) => (index + 40).toString());
  final bloodSugarValues =
      List.generate(400, (index) => (index + 60).toString());



  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    String? validateValue(String? value, List<String> values) {
      if (value == null || !values.contains(value)) {
        return values.isNotEmpty ? values.first : null;
      }
      return value;
    }

//상대방 데이터 가져오는 로직
    Future<String> getOtherUserName(String userId) async {
      String otherUserId = userId == 'ktgMbo0sT6gyhgTNv8c96UZ3FVm2'
          ? 'KWjegweDuEhSVN9I6D8iRnh22kc2'
          : 'ktgMbo0sT6gyhgTNv8c96UZ3FVm2';

      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(otherUserId)
          .get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        return data['name'] ?? '상대방 이름 없음';
      } else {
        return '상대방의 이름이 없습니다.';
      }
    }

    return Container(
        decoration: BoxDecoration(
          color: Colors.grey[200], // 배경색 변경
          borderRadius: BorderRadius.circular(16.0), // 모서리 반지름 변경
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0), // 전체 패딩 값 설정
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFieldWithController(
                      label: '이름',
                      hintText: '${user.name}',
                      controller: nameController,
                    ),
                  ),
                  const SizedBox(width: 16.0),

                  Expanded(
                    child: FutureBuilder<String>(
                      future: getOtherUserName(user.name),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('에러: ${snapshot.error}');
                        } else {
                          String otherUserName = snapshot.data?.trim() ?? '';
                          return TextFieldWithController(
                            label: '나의 보호자',
                            hintText: '${user.guardian}',
                            controller: guardianController,
                          );
                        }
                      },
                    ),
                  ),

                  // 고유번호 필요한지?
                  // Expanded(
                  //   child: TextFieldWithController(
                  //     label: '고유번호',
                  //     hintText: '고유번호를 입력하세요',
                  //     controller: idController,
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWithController(
                      label: '나이',
                      hintText: '${user.age}',
                      controller: ageController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextFieldWithController(
                      label: '체중',
                      hintText: '${user.weight}',
                      controller: weightController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: '수축기',
                      ),
                      value: validateValue(
                          user.systolic.toString(), systolicValues),
                      items: systolicValues.map((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        systolicController.text = value ?? '';
                      },
                    ),
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: '이완기',
                      ),
                      value: validateValue(
                          user.diastolic.toString(), diastolicValues),
                      items: diastolicValues.map((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        diastolicController.text = value ?? '';
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: '혈당',
                      ),

                      ///
                      /// 값이 없을 경우 예외처리하는 로직입니다
                      ///
                      value: validateValue(
                          user.bloodSugar.toString(), bloodSugarValues),
                      items: bloodSugarValues.map((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        bloodSugarController.text = value ?? '';
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        FirestoreServiceCustom firestoreService = FirestoreServiceCustom();
                        await firestoreService.saveToFirestoreCustom(
                          nameController: nameController,
                          idController: idController,
                          ageController: ageController,
                          weightController: weightController,
                          guardianController: guardianController,
                          systolicController: systolicController,
                          diastolicController: diastolicController,
                          bloodSugarController: bloodSugarController,
                        );
                      },
                      child: const Text(
                        '저장',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 24.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(140, 50),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

}
