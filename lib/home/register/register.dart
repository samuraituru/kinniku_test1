import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kinnikunikki_test/home/login/login_page.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('新規登録'),
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
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            Container(
              width: 350,
              child: ElevatedButton(
                child: Text('登録する'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
