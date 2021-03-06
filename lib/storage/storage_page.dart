import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

DateTime now = DateTime.now();
DateFormat outputFormat = DateFormat('yyyy-MM-dd');
String date = outputFormat.format(now);

class StoragePage extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  File? _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('保存'),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            //ここにカレンダーが入る
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: SizedBox(
                width: 240,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                        context: context,
                        // DatePicker表示時に出す日付
                        initialDate: DateTime.now(),
                        // 選択できる一番古い日付
                        firstDate: DateTime.utc(2000),
                        // 選択できる一番新しい日付
                        lastDate: DateTime.now());
                  },
                  child: Text(
                    '$date',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '体重(Kg)',
                  hintText: '体重(Kg)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '体脂肪率(％)',
                  hintText: '体脂肪率(％)',
                ),
              ),
            ),
            if (_file != null)
              Image.file(
                _file!,
                fit: BoxFit.cover,
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
                        final XFile? _image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        _file = File(_image!.path);
                      },
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('保存'),
            ),
          ],
        ),
      ),
    );
  }

}
