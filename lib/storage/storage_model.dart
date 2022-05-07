import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class StorageModel extends ChangeNotifier {
  String? weight;
  String? fat;

  String? imageURL;
  String? selectedDate;
  File? imagefile;

  Future addStorage() async {
    if (weight == null || weight == "") {
      throw '体重が入力されていません';
    }
    if (fat == null || fat!.isEmpty) {
      throw '体脂肪率が入力されていません';
    }
    if (selectedDate == null || selectedDate == "") {
      throw '日付が入力されていません';
    }
    final String _picture1 =
        '1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
    final docdata =
        FirebaseFirestore.instance.collection('bodybody').doc(_picture1);

    //storageにアップロード
    if (imagefile != null) {
      FirebaseStorage.instance.ref("images/${_picture1}").putFile(imagefile!);
      Reference ref = FirebaseStorage.instance.ref().child("images").child(_picture1);
      imageURL = await ref.getDownloadURL();
      print('oooooooooooooooooooooooo'+imageURL.toString());
    }
    if (imageURL == null || imageURL!.isEmpty) {
      throw '画像が選択されていません';
    }

    // firestoreに追加
    await FirebaseFirestore.instance.collection('bodybody').doc().update({
      'weight': weight,
      'fat': fat,
      'imageURL': imageURL,
      'selectedDate': selectedDate,
    });
    notifyListeners();
  }

  Future pickDate(BuildContext context) async {
    //DatePickerを表示し、選択されたら変数に格納する
    final newDate = await showDatePicker(
        context: context,
        //初期値を設定
        initialDate: DateTime.now(),
        //選択できる日付の上限
        firstDate: DateTime(DateTime.now().year - 2),
        lastDate: DateTime.now());
    //nullチェック
    if (newDate != null) {
      //選択された日付を変数に格納
      this.selectedDate = DateFormat("yyyy/MM/dd").format(newDate).toString();
      // firestoreに追加
    } else {
      //nullならば何もしない
      return;
    }
    notifyListeners();
  }

  Future pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);

    if (_image != null) {
      imagefile = File(_image.path);
    }
    notifyListeners();
  }
}
