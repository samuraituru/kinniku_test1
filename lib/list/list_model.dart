import 'package:flutter/material.dart';

class ListModel extends ChangeNotifier {
  final items = List<String>.generate(
    100,
    (i) => "Item $i",
  );

  notifyListeners();
}
