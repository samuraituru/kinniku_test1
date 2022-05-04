import 'package:flutter/material.dart';
import 'package:kinnikunikki_test/tabpage/root_page.dart';

class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'グラフ'
        ),
      ),
      body: Center(
        child: Text('2'),
      ),
    );
  }

}