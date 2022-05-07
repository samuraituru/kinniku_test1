import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kinnikunikki_test/domain/bodydata.dart';

class ListModel extends ChangeNotifier {
  List<BodyData>? bodydata;

  Future getBodyData() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('bodycut').get();

    final List<BodyData> bodydata =
        snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String weight = data['weight'];
      final String fat = data['fat'];
      final String imageURL = data['imageURL'];
      final String selectedDate = data['selectedDate'];
      return BodyData(weight, fat, selectedDate, imageURL);
    }).toList();

    this.bodydata = bodydata;
    notifyListeners();
  }
}
