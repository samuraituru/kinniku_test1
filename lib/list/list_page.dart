import 'package:flutter/material.dart';
import 'package:kinnikunikki_test/tabpage/root_page.dart';

class ListPge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            '一覧'
        ),
      ),
      body: Center(
        child: Text('3'),
      ),
    );
  }

}