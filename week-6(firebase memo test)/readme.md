test file

memo file을 firebase storge에 올리는것을 시작으로

uuid를 활용한 각 디바이스 개인저장

uuid의 데이터를 조회해서 다른 사용자의 데이터를 가져오는 기능

###

```
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.29.0
  cloud_firestore: ^4.16.1
  device_info_plus: ^10.1.0
```

### main

```
import firebase_core.dart'; material.dart' memo_page.dart';

Future void  main  async
  WidgetsFlutterBinding ensureInitialized
  await Firebase initializeApp
  runApp MyApp

class MyApp extends StatelessWidget
  override
  Widget build BuildContext context
    return MaterialApp
      title: 'Memo App',
      home: MemoPage,
```

### MemoPage

```
import material.dart'; cloud_firestore.dart';

class MemoPage extends StatefulWidget
  override
  _MemoPageState createState() => _MemoPageState

class _MemoPageState extends State MemoPage
  final TextEditingController _ageController = TextEditingController
  List String  _userUuids
  String _selectedUserUuid

  override
  void initState
    super initState
    _getUserUuids

  override
  Widget build BuildContext context
    return Scaffold
      appBar: AppBar
        title: Text 'Memo App'
      body: Padding
        padding: const EdgeInsets all 16.0
        child: Column
          crossAxisAlignment: CrossAxisAlignment stretch,
          children


            ElevatedButton
              onPressed: _showUserList,
              child: Text 'Select User' ,


            SizedBox height: 16.0 ,
            TextField
              controller: _ageController,
              decoration: InputDecoration(
                hintText: 'Enter age',

            SizedBox height: 16.0 ,
            ElevatedButton
              onPressed: _saveAge,
              child: Text 'Save Age' ,

            SizedBox height: 16.0 ,
            Expanded
              child: _selectedUserUuid.isNotEmpty
                  ? StreamBuilder QuerySnapshot
                stream: FirebaseFirestore instance
                    .collection('users')
                    .doc(_selectedUserUuid)
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
                    else {
                    return Center(
                      child: CircularProgressIndicator(),


                  : Center(
                child: Text('Please select a user'),


  Future<void> _saveAge() async {
    final age = _ageController.text.trim();

    if (age.isNotEmpty && _selectedUserUuid.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_selectedUserUuid)
          .collection('memos')
          .add({
        'age': age,
        'createdAt': Timestamp.now(),
      });

      _ageController.clear();
    }
  }

  Future<void> _showUserList() async {
    if (_userUuids.isEmpty) {
      await _getUserUuids();
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select User'),
          content: ListView.builder(
            itemCount: _userUuids.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_userUuids[index]),
                onTap: () {
                  setState(() {
                    _selectedUserUuid = _userUuids[index];
                  });
                  Navigator.of(context).pop();


  Future<void> _getUserUuids() async {
    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    _userUuids = snapshot.docs.map((doc) => doc.id).toList();
    setState(() {});

```

###

```

```

###

```

```

###

```

```

###

```

```

###

```

```

###

```

```

###

```

```
