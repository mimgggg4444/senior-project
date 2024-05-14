### 0514

1. 개인정보 페이지 사용자에 따라서 데이터 저장 따로 되게 하는 기능
   1. 이메일, 닉네임 카톡에서 가져오기. (이메일은 카톡 이메일, 닉네임은 카톡닉네임) -> 보여지는 정보 
   2. ?데이터 새롭게 갱신되는것이 아닌 새로운 문서를 만들고 저장 ->
   3. ~~날짜 및 시간 데이터 저장~~ ->timestamp
   4. 나의 보호자 옆에 링크 추가 -> main.dart로 이동. 보호자 선택하는 기능
   5. 나이 입력된 후, 입력값 저장되고 계속 유지, 체중도 마찬가지.
  

2. 홈 화면에서 사용자 데이터 보여주는 기능
   1. ~~저장된 데이터를 토대로 홈 화면에 보여지는 기능~~ -> usermodel
   2. ~~자동 업데이트~~ -> stateful notifyListeners
5. 개인정보 페이지 디자인
   1. xd디자인에 나온대로 디자인 -> 피커휠 (DropdownButtonFormField)



---
---

### firebase 데이터 저장 규칙
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
