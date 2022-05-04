import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kinnikunikki_test/home/home_page.dart';

class MyPage extends StatelessWidget {

  Future getImage() async {
    File? _file;
    final ImagePicker _picker = ImagePicker();
    final XFile? _image = await _picker.pickImage(
        source: ImageSource.gallery);
    _file = File(_image!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('マイページ'),
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
            Stack(
              children: [
                Container(
                  width: 150,
                  height: 200,
                  alignment: Alignment.center,
                  child: Text('写真を選ぶ'),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 200,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        getImage();
                      },
                    ),
                  ),
                ),
              ],
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
                  MaterialPageRoute(builder: (context) => HomePage()),
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
