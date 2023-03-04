import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NickNamePage extends StatefulWidget {
  const NickNamePage({Key? key}) : super(key: key);

  @override
  State<NickNamePage> createState() => _NickNamePageState();
}

class _NickNamePageState extends State<NickNamePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nickNameController = TextEditingController();
  String _nickName = '';

  bool _tryValidator() {
    final formValid = _formKey.currentState!.validate();
    if (formValid) {
      _formKey.currentState!.save();
      return true;
    }
    return false;
  }

  void _shoToastMsg() {
    Fluttertoast.showToast(
      msg: "회원가입을 완료하셨습니다.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('닉네임 입력',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(height: 15),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _nickName = value;
                    });
                  },
                  onSaved: (newValue) {
                    setState(() {
                      _nickName = newValue!;
                    });
                  },
                  controller: _nickNameController,
                  validator: (value) {
                    if (_nickNameController.text.isEmpty) {
                      return '닉네임을 입력해주세요.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: '닉네임 입력',
                    suffixIcon: Icon(Icons.close),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    if (_tryValidator()) {
                      Navigator.of(context).popAndPushNamed('/');
                      _shoToastMsg();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(400, 60),
                  ),
                  child: Text('가입 완료', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
