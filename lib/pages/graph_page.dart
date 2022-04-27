import 'package:flutter/material.dart';
import 'package:kinnikunikki_test/pages/BottomTabPage.dart';

class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              bartitle[2]
          ),
        ),
      ),
      body: Center(
        child: Text('2'),
      ),
    );
  }

}