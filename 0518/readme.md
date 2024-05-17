###

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

---
---

### 건강 음식 (api?)

``` dart
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

