import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  // final GlobalKey _formKey = GlobalKey<FormState>(); // 잘못된 설정
  final _formKey = GlobalKey<FormState>();
  TextEditingController idEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  late String _id = '';
  late String _password = '';
  late Icon _idIcon = Icon(null);
  late Icon _passIcon = Icon(null);

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
    if (!value.isEmpty) {
      setState(() {
        value == idEditingController.text
            ? _idIcon = Icon(Icons.close)
            : _passIcon = Icon(Icons.close);
      });
    }
  }

  // valitation 함수
  bool _tryValidation() {
    bool isValidate = _formKey.currentState!.validate();
    if (isValidate) {
      _formKey.currentState!.save();
    }
    return isValidate;
  }

  // id,pass 입력 유무 확인
  bool emptyValidate() {
    return !_id.isEmpty && !_password.isEmpty ? true : false;
  }

  // 비밀번호 찾기
  void searchPasswordToastMsg() {
    Fluttertoast.showToast(msg: "해당 기능은 준비 중 입니다",
        toastLength: Toast.LENGTH_LONG, // Android
        timeInSecForIosWeb: 1, // iOS
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white,
        fontSize: 16.0
    );
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
                          key: ValueKey(1),
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
                          key: ValueKey(2),
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
                          onPressed: () async {
                            if (_tryValidation()) {
                              Navigator.of(context).pushNamed('/my_page');
                            }
                          },
                          child: Text('로그인',
                              style: emptyValidate()
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle(color: Colors.grey)),
                          style: ElevatedButton.styleFrom(
                              // borderSide 전체 두께와 색 설정
                              side: emptyValidate()
                                  ? null
                                  : BorderSide(
                                      width: 1.0,
                                      color: Colors.grey,
                                    ),
                              elevation: 0,
                              backgroundColor: emptyValidate()
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
                          // todo: 클릭 시, 회원가입 페이지로 이동하기
                          Navigator.of(context).pushNamed('/signup');
                        },
                        child: Text('회원가입 | ',
                            style: TextStyle(color: Colors.grey)),
                      ),
                      GestureDetector(
                        onTap: () {
                          // toast msg
                          searchPasswordToastMsg();
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
