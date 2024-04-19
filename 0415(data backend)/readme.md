주요 데이터와 형식


* 사용자 정보:
  *  사용자 ID(문서 ID)
  *  이름, 생년월일, 성별 등 개인 정보
  *  현재 건강 상태(혈당, 혈압, 체중, BMI 등) - 각각의 최신 측정값과 측정 시간 정보
* 활동 및 관리 기록:
  *  활동 ID(문서 ID)
  *  활동 유형(영양제 추천, 건강 상태 기록 등)
  *  활동 내용
  *  활동 날짜 및 시간
* 기록 정보:
  *  기록 ID(문서 ID)
  *  기록 유형(혈당, 혈압, 체중, BMI 등)
  *  기록 값
  *  기록 날짜 및 시간
* 일정 정보:
  *  일정 ID(문서 ID)
  *  일정 제목
  *  일정 시작/종료 날짜 및 시간
  *  일정 타입(D-day 등)

Firebase Firestore

사용자 정보, 활동 기록, 건강 기록, 일정 저장

문서 ID는 Firestore에서 자동으로 생성되는 고유 ID를 사용

각 데이터 유형별로 컬렉션을 생성하고, 그 안에 개별 문서로 데이터를 저장

문서에는 위에서 언급한 필드들을 포함

### 예

``` xml
{
  //추가
  kakaoUserId: "example",
  SelectedUserListString: "",
  

  name: "홍길동",
  birthDate: "1990-01-01",
  weight: 70,
  //추가
  tall: 170,

  healthStatus: {
    bloodSugar: 100,
    systolic: 120,
    diastolic: 80,
    dateTime: "1994-04-04",

  }
}
```

### 업데이트 된 데이터 갖고 데이터 형식 다시 생성


### 데이터 형식
``` dart
class UserModel {
  final String kakaoUserId;
  final String selectedUserListString;
  final String name;
  final String birthDate;
  final int weight;
  final int tall;
  final HealthStatus healthStatus;

  UserModel({
    required this.kakaoUserId,
    required this.selectedUserListString,
    required this.name,
    required this.birthDate,
    required this.weight,
    required this.tall,
    required this.healthStatus,
  });

  // JSON에서 UserModel 인스턴스 생성
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      kakaoUserId: json['kakaoUserId'],
      selectedUserListString: json['SelectedUserListString'],
      name: json['name'],
      birthDate: json['birthDate'],
      weight: json['weight'],
      tall: json['tall'],
      healthStatus: HealthStatus.fromJson(json['healthStatus']),
    );
  }

  // UserModel 인스턴스에서 JSON 생성
  Map<String, dynamic> toJson() => {
        'kakaoUserId': kakaoUserId,
        'SelectedUserListString': selectedUserListString,
        'name': name,
        'birthDate': birthDate,
        'weight': weight,
        'tall': tall,
        'healthStatus': healthStatus.toJson(),
      };
}

class HealthStatus {
  final int bloodSugar;
  final int systolic;
  final int diastolic;
  final String dateTime;

  HealthStatus({
    required this.bloodSugar,
    required this.systolic,
    required this.diastolic,
    required this.dateTime,
  });

  // JSON에서 HealthStatus 인스턴스 생성
  factory HealthStatus.fromJson(Map<String, dynamic> json) {
    return HealthStatus(
      bloodSugar: json['bloodSugar'],
      systolic: json['systolic'],
      diastolic: json['diastolic'],
      dateTime: json['dateTime'],
    );
  }

  // HealthStatus 인스턴스에서 JSON 생성
  Map<String, dynamic> toJson() => {
        'bloodSugar': bloodSugar,
        'systolic': systolic,
        'diastolic': diastolic,
        'dateTime': dateTime,
      };
}

```
