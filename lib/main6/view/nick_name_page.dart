import 'package:flutter/material.dart';
import 'package:second_project/main6/duplicated_function/toast_msg.dart';

class NickNamePage extends StatefulWidget {
  const NickNamePage({Key? key}) : super(key: key);

  @override
  State<NickNamePage> createState() => _NickNamePageState();
}

class _NickNamePageState extends State<NickNamePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nickNameEditingController = TextEditingController();
  String _nickName = '';

  bool _tryValidator() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
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
                  controller: nickNameEditingController,
                  validator: (value) {
                    if (value!.isEmpty) {
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
                      // note: 이 전에 남은 모든 히스토리 제거하는 방법
                      Navigator.of(context).popUntil(ModalRoute.withName('/'));
                      // 회원가입 완료 문구
                      ToastMsg.showToast(msg: '회원가입을 완료하셨습니다.');
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
