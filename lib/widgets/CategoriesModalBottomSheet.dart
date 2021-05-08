import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/CategoryModel.dart';

class CategoriesModalBottomSheet {
  static void showSheetModal(
      {BuildContext context,
      List<CategoryModel> categories,
      Function(CategoryModel) onSelectElement}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => ListView(
                children: <Widget>[
              Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: ListTile(
                  title: Text(
                    "Категория",
                  ),
                ),
              )
            ]..addAll(categories.map((e) => ListTile(
                      leading: Icon(Icons.share),
                      title: Text(e.name),
                      onTap: () {
                        onSelectElement(e);
                      },
                    )))));
  }

  static void closeModal(BuildContext context) {
    Navigator.pop(context);
  }
}
