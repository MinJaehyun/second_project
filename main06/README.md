### 구조
    main
        ㄴ login_and_signup/LoginPage  - 로그인 페이지
            ㄴ login_and_signup/signup - 회원 가입 페이지
                ㄴ nick_name_page      - 닉네임 생성 페이지로 이동
            ㄴ my_page - 로그인 성공 후 이동하는 홈페이지
        ㄴ helper/toast_msg - 메시지 기능

### 실행법
    0. 회원 가입을 위한 DB는 제공하지 않는다
    1. 로그인 시 임시로 id: tests, password: 12345 로 로그인하여 홈페이지로 이동할 수 있다

### 추가 기능
    1. 로그인 버튼에 비활성화 기능 추가
    2. 로그인에서 회원 가입 클릭 시, 뒤로가기 버튼을 반복해서 나타내고 있는데 뒤로가기 버튼을 나타나는 이유는 ?
     - popAndPushNamed() 사용하여 현재 히스토리 지우고, 지정한 페이지를 push 했었는데 이로인해 스택에 signin 이 2번 쌓였다
     - pop() 처리하여 현재 히스토리 지워서 해결(블랙 페이지)

### 리펙토링:
    1. 모든 페이지에 변수나 메서드의 명칭 통일
     - _id, _password, _tryValidation
     - 메서드 내 변수 명칭 통일
    2. 모든 페이지에 중복 코드를 파일로 분리
     - login: showToast
     - nickname: showToast
    3. 모든 페이지의 if(_tryValidator()){} 코드 위에 _tryValidator() 중복 코드 지우기

### 결과물
![main06_result.gif](lib%2Fmain06_result.gif)