import 'package:flutter/material.dart';
import 'package:second_project/main6/duplicated_function/toast_msg.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  // note: GlobalKey 설정 시 currentState!.validate() 호출 불가능
  // final GlobalKey _formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController idEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  String _id = '';
  String _password = '';
  Icon _idIcon = Icon(null);
  Icon _passIcon = Icon(null);

  @override
  void initState() {
    super.initState();
    // 매번 입력 내용을 확인하기 위한 설정
    idEditingController
        .addListener(() => _onTextChanged(idEditingController.text));
    passwordEditingController
        .addListener(() => _onTextChanged(passwordEditingController.text));
  }

  // 입력 위치에 따른 icon 변경
  void _onTextChanged(String value) {
    if (value.isEmpty) {
      setState(() {
        value == idEditingController.text
            ? _idIcon = Icon(null)
            : _passIcon = Icon(null);
      });
    }
    else {
      setState(() {
        value == idEditingController.text
            ? _idIcon = Icon(Icons.close)
            : _passIcon = Icon(Icons.close);
      });
    }
  }

  // valitation 함수
  bool _tryValidation() {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
    return isValid;
  }

  // id,pass 입력 유무 확인
  bool validateEmptyForm() {
    return !_id.isEmpty && _password.length >= 5 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                // 로그인 문구
                Container(
                  child: Column(
                    children: [
                      Text('로그인',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text('로그인 하신 후 모든 서비스를 이용하실 수 있습니다.',
                          style: TextStyle(fontSize: 15, color: Colors.grey))
                    ],
                  ),
                ),
                // 아이디 입력창, 비밀번호 입력창, 로그인 버튼
                Container(
                  padding: EdgeInsets.all(35),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || value != 'tests') {
                              return '잘못된 id 를 입력하셨습니다.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              // idEditingController.text = value; // 잘못된 방법
                              _id = value;
                            });
                          },
                          onSaved: (newValue) {
                            setState(() {
                              _id = newValue!;
                            });
                          },
                          controller: idEditingController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '아이디 입력',
                            suffixIcon: Align(
                              widthFactor: 1,
                              heightFactor: 1,
                              child: _idIcon,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || value != '12345') {
                              return '잘못된 password 를 입력하셨습니다.';
                            }
                            return null;
                          },
                          obscureText: true,
                          controller: passwordEditingController,
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                          onSaved: (newValue) {
                            setState(() {
                              _password = newValue!;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '비밀번호 입력',
                            suffixIcon: Align(
                              widthFactor: 1,
                              heightFactor: 1,
                              child: _passIcon,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: !validateEmptyForm()
                              ? null
                              : () async {
                                  if (_tryValidation()) {
                                    Navigator.of(context).pushNamed('/my_page');
                                  }
                                },
                          child: Text('로그인',
                              style: validateEmptyForm()
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle(color: Colors.grey)),
                          style: ElevatedButton.styleFrom(
                              // borderSide 전체 두께와 색 설정
                              side: validateEmptyForm()
                                  ? null
                                  : BorderSide(
                                      width: 1.0,
                                      color: Colors.grey,
                                    ),
                              elevation: 0,
                              backgroundColor: validateEmptyForm()
                                  ? Colors.orange
                                  : Colors.white,
                              minimumSize: Size(400, 55)),
                        ),
                      ],
                    ),
                  ),
                ),
                // 회원가입 | 비밀번호 찾기
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/signup');
                        },
                        child: Text('회원가입 | ',
                            style: TextStyle(color: Colors.grey)),
                      ),
                      GestureDetector(
                        onTap: () {
                          // 비밀번호 찾기
                          ToastMsg.showToast(msg: '해당 기능은 준비 중 입니다');
                        },
                        child: Text('비밀번호 찾기',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
