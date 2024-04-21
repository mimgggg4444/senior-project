### logic

준비물 : firebase proj, auth setting (카카오 로그인 활성화), rest api key

필요지식 : firebase auth, oauth 2.0 (토큰인증), 카카오 rest api, firebase sdk or rest api, 보안 및 인증

첫번째. 
인증

두번째.
연동

<img width="667" alt="스크린샷 2024-04-21 오후 3 49 23" src="https://github.com/mimgggg4444/senior-project/assets/66135779/21204eda-baca-46af-9604-b29064dc7c4a">




```
```

### 키 해시

keytool -exportcert -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore -storepass android -keypass android | openssl sha1 -binary | openssl base64

keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore | grep SHA1 | sed 's/SHA1://' | xxd -r -p | openssl base64


### defult pw 
pw : android
