import 'package:flutter/material.dart';
import 'package:kinnikunikki_test/domain/bodydata.dart';
import 'package:kinnikunikki_test/list/list_model.dart';
import 'package:provider/provider.dart';

class ListPge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListModel>(
      create: (_) => ListModel()..getBodyData(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('一覧'),
        ),
        body: Center(
          child: Consumer<ListModel>(builder: (context, model, child) {
            final List<BodyData>? bodydata = model.bodydata;

            if (bodydata == null) {
              return CircularProgressIndicator();
            }
            final List<Widget> widgets = bodydata
                .map(
                  (bodydata) => ListTile(
                    title: Text(bodydata.weight),
                    trailing: Text(bodydata.fat),
                    subtitle: Text(bodydata.selectedDate),
                    leading: bodydata.imageURL != null
                        ? Image.network(bodydata.imageURL!)
                        : null,
                  ),
                )
                .toList();

            return ListView(
              children: widgets,
            );
          }),
        ),
      ),
    );
  }
}
