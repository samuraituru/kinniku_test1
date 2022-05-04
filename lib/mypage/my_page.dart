import 'package:flutter/material.dart';
import 'package:kinnikunikki_test/mypage/login/login_page.dart';
import 'package:kinnikunikki_test/tabpage/BottomTabPage.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(bartitle[4]),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('目標体重(Kg)'),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: SizedBox(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: '体重(Kg)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('目標体脂肪率(％)'),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: SizedBox(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: '体脂肪率(％)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('理想のボディ'),
            ),
            Container(
              width: 150,
              height: 200,
              child: Material(
                color: Colors.red,
                child: InkWell(
                  onTap: () async {
                  },
                ),
              ),
            ),
            Container(
              width: 350,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('登録'),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                  width: 1, //太さ
                ),
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                'ログイン',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
