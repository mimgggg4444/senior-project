---
---

### 김민기 팀원 담당

1. 백엔드 데이터 형식
- 사용자 정보 활동 및 관리 기록 기록 정보 일정 정보
- 사용자 정보, 활동 및 관리 기록, 기록 정보, 일정 정보 등 각 데이터 형식에 대해 자세히 설명
- 각 데이터 형식의 필드와 용도를 명시
- 데이터 모델링 다이어그램을 사용하여 시각적으로 표현

2. Firebase 인증
- Firebase 프로젝트 설정 Kakao Talk 토큰 인증 흐름
- Kakao Talk 토큰을 이용한 인증 흐름을 단계별로 설명

3. 백엔드 로직 구현 및 실제 어플리케이션 디자인 만들기
- 백엔드 데이터 형식 구현 Kakao Talk 토큰 인증 구현
- 백엔드 데이터 형식을 구현하는 방법에 대해 설명 firestore 데이터 모델
- Kakao Talk 토큰 인증 구현 방법에 대해 설명


---
---

### MVC 모델 사용
```
lib/
  main.dart
  navigation_state.dart
  models/
    user_model.dart
  controllers/
    user_controller.dart
  services/
    firestore_service.dart
  providers/
    user_data.dart
  screens/
    business_screen.dart
    home_screen.dart
    profile_screen.dart
  widgets/
    bottom_navigation_bar.dart
    text_field_with_controller.dart
    user_box.dart

```
