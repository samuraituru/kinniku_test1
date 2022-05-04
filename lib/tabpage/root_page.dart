import 'package:flutter/material.dart';
import 'package:kinnikunikki_test/comparison/comparison_page.dart';
import 'package:kinnikunikki_test/graph/graph_page.dart';
import 'package:kinnikunikki_test/list/list_page.dart';
import 'package:kinnikunikki_test/mypage/my_page.dart';
import 'package:kinnikunikki_test/storage/storage_page.dart';
import 'package:kinnikunikki_test/tabpage/root_model.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bartitle = <String>['保存1', '比較1', 'グラフ', '一覧', 'マイページ'];
    final _pageList = [
      StoragePage(),
      ComparisonPage(),
      GraphPage(),
      ListPge(),
      MyPage(),
    ];

    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;


    return MaterialApp(
      home: ChangeNotifierProvider<RootModel>(
        create: (_) => RootModel(),
        child: Consumer<RootModel>(builder: (context, model, child) {
          final tabItems = [
            const BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: '保存',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.compare),
              label: '比較',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph_sharp),
              label: 'グラフ',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: '一覧',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'マイページ',
            ),
          ];
          return Scaffold(
            body: _pageList[model.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: model.currentIndex,
              onTap: (index) {
                model.currentIndex = index;
              },
              items: tabItems,
              type: BottomNavigationBarType.fixed,
            ),
          );
        }),
      ),
    );
  }
}
