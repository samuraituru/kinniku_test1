import 'package:flutter/material.dart';
import 'package:kinnikunikki_test/pages/graph_page.dart';
import 'package:kinnikunikki_test/pages/list_page.dart';
import 'package:kinnikunikki_test/pages/my_page.dart';
import 'package:kinnikunikki_test/pages/storage_page.dart';
import 'package:kinnikunikki_test/pages/comparison_page.dart';

class BottomTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomTabPageState();
  }
}

  var bartitle = <String>['保存','比較','グラフ','一覧','マイページ'];


class _BottomTabPageState extends State<BottomTabPage> {
  int _currentIndex = 0;
  final _pageWidgets = [
    StoragePage(),
    ComparisonPage(),
    GraphPage(),
    ListPge(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: bartitle[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare),
            label: bartitle[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_sharp),
            label: bartitle[2],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: bartitle[3],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: bartitle[4],
          ),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.blueAccent,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _currentIndex = index );
}