import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class MemoPage extends StatefulWidget {
  @override
  _MemoPageState createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {
  final TextEditingController _ageController = TextEditingController();
  late Future<String> _userUuidFuture; // 사용자 UUID를 가져오는 Future 변수 추가

  @override
  void initState() {
    super.initState();
    _userUuidFuture = _getUserUuid(); // initState에서 UUID를 가져오는 Future를 초기화합니다.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memo App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                hintText: 'Enter age',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveAge,
              child: Text('Save Age'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: FutureBuilder<String>(
                future: _userUuidFuture, // 사용자 UUID를 가져옵니다.
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final userUuid = snapshot.data ?? '';
                  return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(userUuid)
                        .collection('memos')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final doc = snapshot.data!.docs[index];
                            return ListTile(
                              title: Text(doc['age'].toString()),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveAge() async {
    final age = _ageController.text.trim();
    final userUuid = await _getUserUuid();

    if (age.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userUuid)
          .collection('memos')
          .add({
        'age': age,
        'createdAt': Timestamp.now(),
      });

      _ageController.clear();
    }
  }




  Future<String> _getUserUuid() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor ?? ''; // iOS 기기의 고유 ID
    } else {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id ?? ''; // Android 기기의 고유 ID
    }
  }



}
