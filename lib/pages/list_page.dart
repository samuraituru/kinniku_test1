import 'package:flutter/material.dart';
import 'package:kinnikunikki_test/pages/BottomTabPage.dart';

class ListPge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              bartitle[3]
          ),
        ),
      ),
      body: Center(
        child: Text('3'),
      ),
    );
  }

}