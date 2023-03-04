### fixme:
1. [v] 로그인 시, 로그인 버튼에 비활성화 기능 추가하기
2. [v] 로그인 -> 회원가입 시, 뒤로가기 버튼 클릭하면 로그인 상단에 뒤로가기 버튼이 나타나고 있다
 - 홈화면인 로그인에서는 뒤로가기 버튼이 나타나지 않아야 하는데 뒤로가기 버튼이 나타나는 이유는 ? 
 - popAndPushNamed() 사용하여 현재 히스토리 지우고, 지정한 페이지를 push 했었는데 이로인해 스택에 signin 이 2번 쌓였다
 - pop() 처리하여 현재 히스토리 지우기로 수정
3. [v] 닉네임 입력 후 가입 완료 시, 로그인 페이지 상단에는 뒤로가기 버튼이 없어야 한다
4. [v] 모든 페이지의 if (_tryValidator()) {} 위에 _tryValidator() 중복 코드 지우기
5. [v] 로그인 -> 회원가입, 뒤로가기버튼 클릭 시, 블랙페이지 나타내고 있다

### 리펙토링:
1. [v] 모든 페이지에 변수나 메서드의 명칭 통일하기
 - _id, _password, _tryValidation 
 - 메서드 내 변수 명칭 통일하기
2. [v] 모든 페이지에서 중복으로 사용하는 코드를 파일로 분리하여 처리하기
 - signin: showToast
 - nickname: showToast

### 정리:
1. 이 전에 남은 모든 히스토리 제거하는 방법: .popUntil(ModalRoute.withName('/'));
2. 이 전에 히스토리 제거 방법: .pop();

### 에러:
1. [ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: 'package:flutter/src/services/hardware_keyboard.dart': Failed assertion: line 432 pos 16: '_pressedKeys.containsKey(event.physicalKey)': A KeyUpEvent is dispatched, but the state shows that the physical key is not pressed. If this occurs in real application, please report this bug to Flutter. If this occurs in unit tests, please ensure that simulated events follow Flutter's event model as documented in `HardwareKeyboard`. This was the event: KeyUpEvent#08e61(physicalKey: PhysicalKeyboardKey#e6f4b(usbHidUsage: "0x0007002a", debugName: "Backspace"), logicalKey: LogicalKeyboardKey#147d9(keyId: "0x100000008", keyLabel: "Backspace", debugName: "Backspace"), character: null, timeStamp: 0:00:29.481869, synthesized)
 - [X] Windows Version (Unable to confirm if installed Windows version is 10 or greater)
 - flutter upgrade
 - flutter channel master
 - flutter doctor -v