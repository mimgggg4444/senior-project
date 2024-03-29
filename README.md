# jp0329




## 1. notification - firebase via


a핸드폰, b핸드폰은 4자리 코드로 네트워크 연결이 되어있음. 
한쌍의 핸드폰이라고 칭함. 
a핸드폰이 버튼눌렀음. 
b핸드폰에 a버튼이 핸드폰 눌렀다고 알림.

해당 기능이 어떤 기술로 구현되는지에 관한 설명서 요청

[Flutter Push Notifications using Firebase](https://www.youtube.com/watch?v=k0zGEbiDJcQ&ab_channel=HeyFlutter%E2%80%A4com)
-> only android firebase config

firebase - engage - cloud messaging - send your first message - test on device(token) - 

pushnotification - cloud messaging - compose notification

flutter pub add flutter local notifications

androidmanifest.xml

```xml
<meta-data
android:name=""
android:value=""
```

get firebase_api.dart
const ios, const android, const settings
add

await _localNotifications.initialize

flutter app 권한추가

initPushNotification, initLocalNotifications

=>token을 활용한 firebase에서 notification 주는 방법
해결해야하는 문제. a, b 핸드폰 연결 -> a 핸드폰에서 버튼을 눌렀을때 b핸드폰에 notification

방법과 키워드

## 2. 
