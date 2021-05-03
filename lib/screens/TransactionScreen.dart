import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/CategoryModel.dart';
import 'package:flutter_app/store/AppStateModel.dart';
import 'package:flutter_redux/flutter_redux.dart';

class TransactionScreen extends StatefulWidget {
  String screenTitle = 'Создание транзакции';

  TransactionScreen({Key key}) : super(key: key);

  @override
  _TransactionScreen createState() => _TransactionScreen();
}

class _TransactionScreen extends State<TransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  int _activeCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.screenTitle}"),
      ),
      body: Form(
          key: _formKey,
          child: StoreConnector<AppState, List<CategoryModel>>(
              converter: (store) => store.state.categories,
              builder: (context, categories) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                      return RadioListTile(
                          title: Text(categories[index].name),
                          value: index,
                          groupValue: _activeCategoryIndex,
                          onChanged: (int value) {
                            setState(() {
                              _activeCategoryIndex = value;
                            });
                          });
                    }, childCount: categories.length))
                  ],
                );
              })),
    );
  }
}
