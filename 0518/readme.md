###

1. 코드 리펙터링 및 코드 정리(안쓰는 모두 코드 주석처리)

---
---

### 건강 파라미터
- 건강 데이터 혈압, 혈당에 비래해서 건강 데이터 수치 조절 로직 <br>
- 혈압은 정상 120 / 경계성 140 / ~고혈압
  1. user.systolic
- 혈당 정상 80~120 / 120 ~ 위험
  1. user.bloodSugar

- 위험(빨강) 정상 (파랑) 매우 정상(초록)
  1. or 연산자 사용 위 데이터중 위험이 하나라도 해당될 경우 위험 , and 연산자사용 두개다 정상일경우 정상

``` dart
// 혈압과 혈당에 따른 진행 비율 및 색상 설정
    bool isBpNormal = user.systolic < 120 && user.diastolic < 80;
    bool isBpHigh = user.systolic >= 140 || user.diastolic >= 90;

    bool isBsNormal = user.bloodSugar >= 80 && user.bloodSugar <= 120;
    bool isBsRisky = user.bloodSugar < 80 || user.bloodSugar > 120;

    if (isBpHigh || isBsRisky) {
      progress = 1.0; // 위험: 혈압 고혈압 또는 혈당 위험일 경우 진행 비율 100%
      gaugeColor = const Color(0xFFFF0000); // 위험일 경우 빨간색
    } else if (isBpNormal && isBsNormal) {
      progress = 0.3; // 매우 정상: 혈압과 혈당 모두 정상일 경우 진행 비율 30%
      gaugeColor = const Color(0xFF00FF00); // 매우 정상일 경우 초록색
    } else {
      progress = 0.6; // 정상: 그 외의 경우 진행 비율 60%
      gaugeColor = const Color(0xFF276AEE); // 정상일 경우 파란색
    }
```
---
---

### 건강 음식 (api?)


``` dart


  void initState() {
    super.initState();
    _initUserModel();
    // 종료되고 실행되었을때 랜덤 배열 로직
    _goodFoods = getRandomGoodFoods(3);
    _badFoods = getRandomBadFoods(2);

  // user box list init
  String _goodFoods = '';
  String _badFoods = '';


  List<String> goodFoods = [
  List<String> badFoods = [

// 몸에 좋은 음식 가져오기
  String getRandomGoodFoods(int count) {
    final random = Random();
    return List.generate(
        count, (_) => goodFoods[random.nextInt(goodFoods.length)]).join(', ');
  }

// 몸에 안좋은 음식 가져오기
  String getRandomBadFoods(int count) {
    final random = Random();
    return List.generate(
        count, (_) => badFoods[random.nextInt(badFoods.length)]).join(', ');
  }

```

---
---

