# FaceLock

FaceLock use Apple's in-build Biometric Authentication process, it is a simple project which includes only two view controller. 
First we need to import 'LocalAuthentication', also don't forget to add 'Privacy - Face ID Usage Description' in your info Plist.
LAContect() constructor is used for Biometric Authentication.
'canEvaluatePolicy' determines if a policy can be evaluate -> check if biometric is available -> then check if password is SET or NOT -> if the password is set the it goes to 'evaluatePolicy'.
In 'eveluatePolicy' FaceId Authentication begins with animating HUD, if it is succcess in first attempt it is FINISHED,
if it is not a success on the first attempt, there will be an alert giving another change for biometric authentication.  
 ![simulator_screenshot_711D999F-00B2-4812-8974-E551FA9E18BC](https://user-images.githubusercontent.com/99708042/197956684-3b297fc4-cc0c-4ea5-88ad-4db1c124d1aa.png)
![Uploading simulator_screenshot_84ABB812-E80D-471D-A8E3-7A7FDAA0464A.png…]()
