# jp0329




## 1. notification - via firebase


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

-> 구조에 대한 설명 요청

방법 - 
a b 핸드폰 존재,

a b핸드폰 firebase 등록, -> 등록 방법 firebase의 token 자동 발급

firebase clould messaging 서비스 메시지 보내도록 요청, 
b핸드폰의 토큰을 목적지로 저장(b핸드폰에만 알림이 가도록 설정), 
b핸드폰 메시지 받고 사용자에게 알림표시


어플리케이션마다 토큰이 달라지는가?
final fCMToken = await _firebaseMessaging.getToken(); 
을 활용해서 토큰이 생성되는지 확인 요청
-> 각각의 핸드폰(또는 앱 인스턴스)마다 고유한 FCM(Firebase Cloud Messaging) 토큰이 생성됨.

생성된 코드를 4자리 고유한 번호로 바꾸고 이 번호를 통해서 a b 핸드폰을 연결하는 방법
b핸드폰의 토큰을 목적지로 저장(b핸드폰에만 알림이 가도록 설정), 

## 2. 
a핸드폰에서 b핸드폰으로 알림 보낼 수 있는 방법 요청
생성된 2개의 토큰을 갖고, 

firebase - engage - cloud messaging - send your first message - test on device(token) - 

pushnotification - cloud messaging - compose notification
위의 웹을 통해서 cloud messaging을 했다면, 이번에는 a핸드폰 버튼을 눌렀을때 b핸드폰으로 알림을 보내는 방법 요청


### 방법.
1. 


## 3.
