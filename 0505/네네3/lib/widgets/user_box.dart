import 'package:flutter/material.dart';
import 'text_field_with_controller.dart';


class UserBox extends StatelessWidget {
  const UserBox({
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

  @override
  Widget build(BuildContext context) {
    final double bottomNavBarHeight =
        MediaQuery.of(context).padding.bottom + kBottomNavigationBarHeight;

    return Container(
      decoration: BoxDecoration(
        // color: Colors.grey[200],
        // borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Row(
            children: [
              Expanded(
                child: TextFieldWithController(
                  label: '이름',
                  hintText: '이름을 입력하세요',
                  controller: nameController,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: TextFieldWithController(
                  label: '고유번호',
                  hintText: '고유번호를 입력하세요',
                  controller: idController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: TextFieldWithController(
                  label: '나이',
                  hintText: '나이를 입력하세요',
                  controller: ageController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: TextFieldWithController(
                  label: '체중',
                  hintText: '체중을 입력하세요',
                  controller: weightController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          TextFieldWithController(
            label: '나의 보호자',
            hintText: '보호자 이름을 입력하세요',
            controller: guardianController,
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: TextFieldWithController(
                  label: '수축기',
                  hintText: '수축기를 입력하세요',
                  controller: systolicController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: TextFieldWithController(
                  label: '이완기',
                  hintText: '이완기를 입력하세요',
                  controller: diastolicController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          TextFieldWithController(
            label: '혈당',
            hintText: '혈당 수치를 입력하세요',
            controller: bloodSugarController,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
