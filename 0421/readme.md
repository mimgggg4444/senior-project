

### 키 해시

keytool -exportcert -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore -storepass android -keypass android | openssl sha1 -binary | openssl base64

keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore | grep SHA1 | sed 's/SHA1://' | xxd -r -p | openssl base64


### defult pw 
pw : android
