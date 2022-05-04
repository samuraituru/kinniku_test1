import 'package:flutter/material.dart';
import 'package:kinnikunikki_test/list/list_model.dart';
import 'package:provider/provider.dart';

class ListPge extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ListModel>(
          create: (_) => ListModel(),
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                  '一覧'
              ),
            ),
            body: Consumer<ListModel>(builder: (context, model, child) {
                return Container(
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: model.items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${model.items[index]}'),
                      );
                    },
                  ),
                );
              }
            ),
          )
      ),
    );
  }
}
