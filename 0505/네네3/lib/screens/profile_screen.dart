import 'package:flutter/material.dart';
import '../navigation_state.dart';
import 'package:bottomnavigationv1/controllers/user_controller.dart';
import '../widgets/user_box.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.navigationState});

  final NavigationState navigationState;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _guardianController = TextEditingController();
  final TextEditingController _systolicController = TextEditingController();
  final TextEditingController _diastolicController = TextEditingController();
  final TextEditingController _bloodSugarController = TextEditingController();

  final UserController _userController = UserController();

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _guardianController.dispose();
    _systolicController.dispose();
    _diastolicController.dispose();
    _bloodSugarController.dispose();
    super.dispose();
  }

  Future<void> _saveToFirestore() async {
    await _userController.saveUserData(
      _nameController.text,
      _idController.text,
      int.tryParse(_ageController.text) ?? 0,
      int.tryParse(_weightController.text) ?? 0,
      _guardianController.text,
      int.tryParse(_systolicController.text) ?? 0,
      int.tryParse(_diastolicController.text) ?? 0,
      int.tryParse(_bloodSugarController.text) ?? 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: ListView(
          // Column 대신 ListView 사용
          padding: const EdgeInsets.all(16.0),
          children: [
            UserBox(
              nameController: _nameController,
              idController: _idController,
              ageController: _ageController,
              weightController: _weightController,
              guardianController: _guardianController,
              systolicController: _systolicController,
              diastolicController: _diastolicController,
              bloodSugarController: _bloodSugarController,
            ),
            SizedBox(height: 16.0),
            _buildButtonSection(context),
            _buildSettingsText(),
            _buildPushNotificationSetting(),
            _buildPrivacyAndMarketingSettings(),
            SizedBox(height: 80.0), // 바텀 패딩 추가
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveToFirestore,
        child: const Icon(Icons.save),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.only(left: 27),
        child: Text(
          '내 정보',
          style: TextStyle(fontSize: 50.0),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 27.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFEFEFEF),
            radius: 22.5,
            child: const Icon(
              Icons.notifications,
              color: Color(0xFF8E8B8B),
              size: 22.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 통계 버튼
          ElevatedButton(
            onPressed: () {
              // 통계 버튼 클릭 시 동작
            },
            child: Text('통계'),
          ),
          // 캘린더 버튼
          ElevatedButton(
            onPressed: () {
              // 캘린더 버튼 클릭 시 동작
            },
            child: Text('캘린더'),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '설정',
            style: TextStyle(
              fontSize: 50.0,
            ),
          ),
        ],
      ),
    );
  }

  bool isSwitched = true; // 초기값을 true로 설정
  Widget _buildPushNotificationSetting() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Push 알림',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Switch(
            value: isSwitched, // Switch 상태를 isSwitched 변수로 관리
            onChanged: (value) {
              setState(() {
                isSwitched = value; // Switch를 토글할 때 isSwitched의 값을 업데이트
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyAndMarketingSettings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27.0),
      child: ExpansionTile(
        title: Text(
          '개인정보 활용 및 마케팅 수신',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '개인정보 활용 동의',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '서비스 제공을 위해 필수적인 개인정보 수집에 동의합니다.',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  '마케팅 수신 동의',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '이벤트 및 프로모션 정보를 수신하는 것에 동의합니다.',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
