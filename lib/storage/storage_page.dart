import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kinnikunikki_test/storage/storage_model.dart';
import 'package:provider/provider.dart';

class StoragePage extends StatelessWidget {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StorageModel>(
      create: (_) => StorageModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('保存'),
          ),
        ),
        body: Consumer<StorageModel>(builder: (context, model, child) {
          final File? file = model.imagefile;

          return Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SizedBox(
                    width: 240,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () => model.pickDate(context),
                      child: Text(
                        '${model.selectedDate}',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    onChanged: (text) {
                      model.weight = text;
                    },
                    decoration: InputDecoration(
                      labelText: '体重(Kg)',
                      hintText: '体重(Kg)',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    onChanged: (text) {
                      model.fat = text;
                    },
                    decoration: InputDecoration(
                      labelText: '体脂肪率(％)',
                      hintText: '体脂肪率(％)',
                    ),
                  ),
                ),
/*                if (file != null)
                  Image.file(
                    file,
                    fit: BoxFit.cover,
                  ),*/
                Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 200,
                      alignment: Alignment.center,
                      child: Text('写真を選ぶ'),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                    GestureDetector(
                      child: SizedBox(
                        width: 150,
                        height: 200,
                        child: model.imagefile != null
                            ? Image.file(model.imagefile!)
                            : Container(
                                color: Colors.white,
                              ),
                      ),
                      onTap: () async {
                        await model.pickImage();
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await model.addStorage();
                      Navigator.of(context).pop(true);
                    } catch (e) {
                      print(e);
                      final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(e.toString()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text('保存'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
