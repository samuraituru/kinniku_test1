import 'package:flutter/material.dart';
import 'package:kinnikunikki_test/tabpage/BottomTabPage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('理想のボディを目指そうぜ'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 150,
              height: 150,
            ),
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset('assets/muscle_icon.jpg'),
            ),
            Text(
              '筋肉日記',
              style: TextStyle(
                fontSize: 55,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Container(
              width: 200,
              child: ElevatedButton(
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
                  '新規登録',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Container(
              width: 200,
              child: ElevatedButton(
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
            ),
          ],
        ),
      ),
    );
  }
}
