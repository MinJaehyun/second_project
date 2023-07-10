import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController idEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController passwordVerifiedEditingController = TextEditingController();

  String _id = '';
  String _password = '';
  String _passwordVerify = '';

  bool _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
    return isValid;
  }

  // id, password, password_verify 입력 유무 확인
  bool validateEmptyForm() {
    return (_id.length >= 5) && (_password.length >= 5) && (_passwordVerify.length >= 5) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
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
                      Text('회원 가입', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                      Text('아이디와 비밀 번호는 5자 이상 입력해 주세요.', style: TextStyle(color: Colors.grey)),
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
                              return '잘못된 id 를 입력 하셨습니다.';
                            }
                            return null;
                          },
                          onSaved: (newValue) => setState(() => _id = newValue!),
                          onChanged: (value) => setState(() => _id = value),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '아이디 입력',
                            hintText: '5글자 이상 입력해 주세요.',
                            suffixIcon: idEditingController.text.isEmpty ? Icon(Icons.check_circle_outline, color: Colors.grey) : Icon(Icons.check_circle_outline, color: Colors.green),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: passwordEditingController,
                          validator: (value) {
                            if (value != '12345' || value!.isEmpty) {
                              return '잘못된 password 를 입력 하셨습니다.';
                            }
                            return null;
                          },
                          onSaved: (newValue) => setState(() => _password = newValue!),
                          onChanged: (value) => setState(() => _password = value),
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '비밀 번호 입력',
                            hintText: '5글자 이상 입력해 주세요.',
                            suffixIcon: passwordEditingController.text.isEmpty ? Icon(Icons.check_circle_outline, color: Colors.grey) : Icon(Icons.check_circle_outline, color: Colors.green),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: passwordVerifiedEditingController,
                          validator: (value) {
                            if (passwordEditingController.text != value) {
                              return '동일한 비밀 번호를 입력해 주세요.';
                            }
                            return null;
                          },
                          onSaved: (newValue) => setState(() => _passwordVerify = newValue!),
                          onChanged: (value) => setState(() => _passwordVerify = value),
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '비밀 번호 확인',
                            suffixIcon: passwordVerifiedEditingController.text.isEmpty ? Icon(Icons.check_circle_outline, color: Colors.grey) : Icon(Icons.check_circle_outline, color: Colors.green),
                          ),
                        ),
                        SizedBox(height: 15),
                        OutlinedButton(
                          onPressed: !validateEmptyForm()
                              ? null
                              : () {
                                  if (_tryValidation()) {
                                    Navigator.of(context).pushNamed('/nick_name_page');
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(400, 60),
                            elevation: 0,
                            backgroundColor: validateEmptyForm() ? Colors.orange : Colors.white,
                            side: BorderSide(color: validateEmptyForm() ? Colors.white : Colors.grey),
                          ),
                          child: Text('닉네임 설정 페이지로 이동', style: TextStyle(color: validateEmptyForm() ? Colors.white : Colors.grey)),
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
