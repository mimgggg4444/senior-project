### 혈당 수치에 따른 결과값

```text
공복 혈당 수치 (공복 혈당): 일반적으로 3.9 ~ 5.5 mmol/L
식후 2시간 혈당 수치 (식후 혈당): 7.8 mmol/L 이하로 유지하는 것이 이상적
당화혈색소 (HbA1c): 당화혈색소는 최근 2~3개월 동안의 평균 혈당 수치를 반영
일반적으로 5.7% 이하가 정상
5.7% ~ 6.4%는 당뇨 전단계
6.5% 이상은 당뇨병을 나타냅니다.
```

### 혈당 수치에 따른 결과값 code example

```dart
class BloodSugarChecker extends StatefulWidget {
  @override
  _BloodSugarCheckerState createState() => _BloodSugarCheckerState();
}

class _BloodSugarCheckerState extends State<BloodSugarChecker> {
  final TextEditingController _fastingController = TextEditingController();
  final TextEditingController _postMealController = TextEditingController();
  final TextEditingController _hba1cController = TextEditingController();

  String _result = '';

  void _calculate() {
    final double fasting = double.tryParse(_fastingController.text) ?? 0;
    final double postMeal = double.tryParse(_postMealController.text) ?? 0;
    final double hba1c = double.tryParse(_hba1cController.text) ?? 0;

    String result = '';

    if (fasting < 3.9 || fasting > 5.5) {
      result += '공복 혈당 수치가 정상 범위를 벗어났습니다.\n';
    }
    if (postMeal > 7.8) {
      result += '식후 2시간 혈당 수치가 정상 이상입니다.\n';
    }
    if (hba1c < 5.7) {
      result += '당화혈색소 수치가 정상입니다.\n';
    } else if (hba1c >= 5.7 && hba1c <= 6.4) {
      result += '당화혈색소 수치가 당뇨 전단계입니다.\n';
    } else if (hba1c > 6.5) {
      result += '당화혈색소 수치가 당뇨병 상태입니다.\n';
    }

    setState(() {
      _result = result;
    });
  }

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
