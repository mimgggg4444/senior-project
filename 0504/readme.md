### readme

``` dart
void main() {
  // 파이어베이스 데이터베이스 레퍼런스 생성
  final DatabaseReference databaseRef = FirebaseDatabase.instance.reference();

  // 컬렉션, 컬럼, username 지정
  String collection = 'users';
  String column = 'info';
  String username = 'john_doe';

  // 저장할 데이터
  Map<String, dynamic> data = {
    'name': 'John Doe',
    'age': 25,
    'email': 'john@example.com',
  };

  // 데이터 저장
  databaseRef.child('$collection/$username/$column').set(data)
    .then((_) {
      print('Data saved successfully!');
    })
    .catchError((error) {
      print('Failed to save data: $error');
    });
}
```


``` json
{
  "users": {
    "john_doe": {
      "info": {
        "name": "John Doe",
        "age": 25,
        "email": "john@example.com"
      }
    }
  }
}
```
