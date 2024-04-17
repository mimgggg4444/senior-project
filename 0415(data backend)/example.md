건강 상태 기록 콜렉션
콜렉션 이름: healthRecords
문서 ID: 자동 생성된 고유 ID
필드:
userId: 사용자 ID
recordDate: 기록 날짜 (Firestore Timestamp 타입)
bloodSugar: 혈당 수치
bloodPressure:
systolic: 수축기 혈압
diastolic: 이완기 혈압
weight: 체중
bmi: BMI

```
// 사용자의 현재 건강 상태 기록 저장
db.collection('healthRecords').add({
  userId: 'user123',
  recordDate: firebase.firestore.Timestamp.fromDate(new Date()),
  bloodSugar: 95,
  bloodPressure: {
    systolic: 120,
    diastolic: 80
  },
  weight: 70,
  bmi: 22.5
});
```

```
// 사용자의 최근 10개 건강 상태 기록 조회
db.collection('healthRecords')
  .where('userId', '==', 'user123')
  .orderBy('recordDate', 'desc')
  .limit(10)
  .get()
  .then((querySnapshot) => {
    querySnapshot.forEach((doc) => {
      console.log(doc.data());
    });
  });

// 특정 날짜의 사용자 건강 상태 기록 조회
const targetDate = new Date(2024, 3, 15);
db.collection('healthRecords')
  .where('userId', '==', 'user123')
  .where('recordDate', '>=', firebase.firestore.Timestamp.fromDate(targetDate))
  .where('recordDate', '<', firebase.firestore.Timestamp.fromDate(new Date(targetDate.getFullYear(), targetDate.getMonth(), targetDate.getDate() + 1)))
  .get()
  .then((querySnapshot) => {
    querySnapshot.forEach((doc) => {
      console.log(doc.data());
    });
  });
```

### 설명

healthRecords 콜렉션에 사용자의 현재 건강 상태 데이터를 날짜 기준으로 저장
필요에 따라 추가적인 필드를 정의
데이터 조회 시에는 userId와 recordDate 필드를 활용하여 사용자별, 날짜별로 데이터를 검색
최근 기록을 가져오거나 특정 날짜의 기록을 조회하는 등의 쿼리를 수행
