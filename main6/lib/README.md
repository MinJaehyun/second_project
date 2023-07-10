### 구조
    main
    ㄴ LoginPage
        ㄴ helper/toast_msg - fluttertoast 패키지
        ㄴ my_page - 로그인 성공 후 이동하는 페이지
        ㄴ signup - 로그인 화면에서 회원 가입을 하기 위해 이동하는 페이지
            ㄴ nick_name_page - 닉네임 설정 페이지

### 실행 방법
    id: tests , password: 12345 입력 후, 로그인 버튼 클릭


### fixme:
1. [v] 로그인 시, 로그인 버튼에 비활성화 기능 추가
2. [v] 로그인 -> 회원가입 시, 뒤로가기 버튼 클릭하면 로그인 상단에 뒤로가기 버튼이 나타나고 있다
 - 홈 화면인 로그인에서는 뒤로가기 버튼이 나타나지 않아야 하는데 뒤로가기 버튼이 나타나는 이유는 ? 
 - popAndPushNamed() 사용하여 현재 히스토리 지우고, 지정한 페이지를 push 했었는데 이로인해 스택에 signin 이 2번 쌓였다
 - pop() 처리하여 현재 히스토리 지워서 해결

3. [v] 닉네임 입력 후 가입 완료 시, 로그인 페이지 상단에는 뒤로가기 버튼이 없어야 한다
4. [v] 모든 페이지의 if (_tryValidator()) {} 위에 _tryValidator() 중복 코드 지우기
5. [v] 로그인 -> 회원가입, 뒤로가기 버튼 클릭 시, 블랙 페이지 나타내고 있다

### 리펙토링:
1. [v] 모든 페이지에 변수나 메서드의 명칭 통일하기
 - _id, _password, _tryValidation 
 - 메서드 내 변수 명칭 통일하기
2. [v] 모든 페이지에서 중복으로 사용하는 코드를 파일로 분리하여 처리하기
 - login: showToast
 - nickname: showToast
