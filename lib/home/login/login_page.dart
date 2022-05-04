import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kinnikunikki_test/home/home_page.dart';

class LoginPage extends StatelessWidget {
  String login_Email = ""; // 入力されたメールアドレス
  String login_Password = ""; // 入力されたパスワード
  String infoText = ""; // ログインに関する情報を表示

  Future login() async {

    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(
      email: login_Email,
      password: login_Password,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ログイン'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'メールアドレス',
                    labelText: 'メールアドレス',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onChanged: (String value) {
                  login_Email = value;
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'パスワード',
                    labelText: 'パスワード',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onChanged: (String value) {
                  login_Password = value;
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            TextButton(
              onPressed: () {},
              child: Text('パスワードを忘れた方はマッスルへ'),
            ),
            Container(
              width: 350,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    // メール/パスワードでユーザー登録
                    login();
                    // ユーザー登録に成功した場合
                    // チャット画面に遷移＋ログイン画面を破棄
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } catch (e) {
                    // ユーザー登録に失敗した場合
                    infoText = "登録に失敗しました：${e.toString()}";
                  }
                },
                child: Text('ログインする'),
              ),
            ),
          ],
        ),
      ),
    );
  }

}