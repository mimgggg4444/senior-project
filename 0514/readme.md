### 0514

1. 개인정보 페이지 사용자에 따라서 데이터 저장 따로 되게 하는 기능
   1. 이메일, 닉네임 카톡에서 가져오기. (이메일은 카톡 이메일, 닉네임은 카톡닉네임)
3. 홈 화면에서 사용자 데이터 보여주는 기능
   1. 저장된 데이터를 토대로 홈 화면에 보여지는 기능
5. 개인정보 페이지 디자인
   1. 



### 규칙
```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    match /users/{document=**} {
      allow read, write: if false;
    }
  }
}
```
