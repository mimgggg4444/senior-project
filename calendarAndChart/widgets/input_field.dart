import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const InputField({super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    /// 입력 필드를 생성하는 위젯함수
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
      // 입력 값 검증 로직
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label을 입력해주세요.';
        }
        final number = int.tryParse(value);
        if (number == null || number < 10 || number > 300) {
          return '10부터 300 사이의 값을 입력해주세요.';
        }
        // 입력 값이 유효하면 null 반환
        return null;
      },
    );
  }
}
