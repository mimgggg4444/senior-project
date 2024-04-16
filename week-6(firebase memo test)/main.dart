import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:memo_app/memo_page.dart';
import 'package:testwork0412/memo_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memo App',
      home: MemoPage(),
    );
  }
}