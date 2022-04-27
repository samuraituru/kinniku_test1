import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kinnikunikki_test/pages/BottomTabPage.dart';
import 'package:image_picker/image_picker.dart';

class StoragePage extends StatelessWidget {

  final ImagePicker _picker = ImagePicker();
  File? _file;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
                bartitle[0]
            ),
          ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
              //ここにカレンダーが入る
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
            if(_file != null) Image.file(_file!, fit: BoxFit.cover,),
            OutlinedButton(
                onPressed: () async {
                  final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
                  _file = File(_image!.path);
                  setState(() {});
                },
                child: const Text('画像を選択')
            )
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}