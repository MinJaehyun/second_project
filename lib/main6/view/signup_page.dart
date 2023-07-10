import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController idEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController passwordVerifiedEditingController = TextEditingController();
  String _id = '';
  String _password = '';
  String _passwordVerify = '';

  bool _tryValition() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
    return isValid;
  }

  // id, password, password_verify 입력 유무 확인
  bool validateEmptyForm() {
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
            // Navigator.of(context).popAndPushNamed('/');
            // 현재 히스토리 지우고, 지정한 페이지를 push
            // 아.. 그래서 스택에 signin 이 2번 쌓이는구나..
            Navigator.of(context).pop();
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
                          controller: idEditingController,
                          validator: (value) {
                            if (value != 'tests' || value!.isEmpty) {
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
                            suffixIcon: idEditingController.text.isEmpty
                                ? Icon(Icons.check_circle_outline,
                                    color: Colors.grey)
                                : Icon(Icons.check_circle_outline,
                                    color: Colors.green),
                          ),
                          // autovalidateMode: , // ?
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: passwordEditingController,
                          validator: (value) {
                            if (value != '12345' || value!.isEmpty) {
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
                            suffixIcon: passwordEditingController.text.isEmpty
                                ? Icon(Icons.check_circle_outline,
                                    color: Colors.grey)
                                : Icon(Icons.check_circle_outline,
                                    color: Colors.green),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: passwordVerifiedEditingController,
                          validator: (value) {
                            if (passwordEditingController.text !=
                                value) {
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
                            suffixIcon: passwordVerifiedEditingController.text.isEmpty
                                ? Icon(Icons.check_circle_outline,
                                    color: Colors.grey)
                                : Icon(Icons.check_circle_outline,
                                    color: Colors.green),
                          ),
                        ),
                        SizedBox(height: 15),
                        OutlinedButton(
                          onPressed: !validateEmptyForm()
                              ? null
                              : () {
                                  if (_tryValition()) {
                                    Navigator.of(context)
                                        .pushNamed('/nick_name_page');
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(400, 60),
                            elevation: 0,
                            backgroundColor:
                            validateEmptyForm() ? Colors.orange : Colors.white,
                            side: BorderSide(
                                color: validateEmptyForm()
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                          child: Text('다음으로',
                              style: TextStyle(
                                  color: validateEmptyForm()
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
