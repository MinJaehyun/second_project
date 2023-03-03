import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordVerifiedController = TextEditingController();
  String _id = '';
  String _password = '';
  String _passwordVerify = '';

  late bool next = false;

  bool _tryValition() {
    final verify = _formKey.currentState!.validate();
    if (verify) {
      _formKey.currentState!.save();
      return true;
    }
    return false;
  }

  // id,pass,passVerify 입력 유무 확인
  bool emptyValidate() {
    return _id.length >= 5 &&
            _password.length >= 5 &&
            _passwordVerify.length >= 5
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 30),
                // 회원가입 문구
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('아이디로 회원가입',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Text('아이디와 비밀번호는 5자 이상을 입력해주세요.',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                // 입력창 및 다음으로 btn
                Container(
                  padding: EdgeInsets.fromLTRB(45, 20, 45, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          key: ValueKey(1),
                          controller: idController,
                          validator: (value) {
                            if (_id != 'tests' || _id.isEmpty) {
                              return '잘못된 id 를 입력하셨습니다.';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            setState(() {
                              _id = newValue!;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              _id = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '아이디 입력',
                            hintText: '5글자 이상 입력해주세요.',
                            suffixIcon: idController.text.isEmpty
                                ? Icon(Icons.check_circle_outline,
                                    color: Colors.grey)
                                : Icon(Icons.check_circle_outline,
                                    color: Colors.green),
                          ),
                          // autovalidateMode: , // ?
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          key: ValueKey(2),
                          controller: passwordController,
                          validator: (value) {
                            if (_password != '12345' || _password.isEmpty) {
                              return '잘못된 password 를 입력하셨습니다.';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            setState(() {
                              _password = newValue!;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '비밀번호 입력',
                            hintText: '5글자 이상 입력해주세요.',
                            suffixIcon: passwordController.text.isEmpty
                                ? Icon(Icons.check_circle_outline,
                                    color: Colors.grey)
                                : Icon(Icons.check_circle_outline,
                                    color: Colors.green),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          key: ValueKey(3),
                          controller: passwordVerifiedController,
                          validator: (value) {
                            if (passwordController.text !=
                                passwordVerifiedController.text) {
                              return '동일한 비밀번호를 입력해주세요.';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            setState(() {
                              _passwordVerify = newValue!;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              _passwordVerify = value;
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '비밀번호 확인',
                            suffixIcon: passwordVerifiedController.text.isEmpty
                                ? Icon(Icons.check_circle_outline,
                                    color: Colors.grey)
                                : Icon(Icons.check_circle_outline,
                                    color: Colors.green),
                          ),
                        ),
                        SizedBox(height: 15),
                        OutlinedButton(
                          onPressed: !emptyValidate()
                              ? null
                              : () {
                                  _tryValition();
                                  // todo: 버튼 클릭 시, 유효성 검증하고 맞으면 로그인 페이지로 이동
                                  if (_tryValition()) {
                                    Navigator.of(context).pushNamed('/');
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(400, 60),
                            elevation: 0,
                            backgroundColor:
                                emptyValidate() ? Colors.orange : Colors.white,
                            side: BorderSide(
                                color: emptyValidate()
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                          child: Text('다음으로',
                              style: TextStyle(
                                  color: emptyValidate()
                                      ? Colors.white
                                      : Colors.grey)),
                        ),
                      ],
                    ),
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
