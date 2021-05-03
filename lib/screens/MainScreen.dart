import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/models/CategoryModel.dart';
import 'package:flutter_app/store/AppStateModel.dart';
import 'package:flutter_app/store/category/category_actions.dart';
import 'package:flutter_app/store/category/category_thunk.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MainScreen extends StatelessWidget {
  final String _title = "Dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: StoreConnector<AppState, List<CategoryModel>>(
          onInit: (store) {
            store.dispatch(CategoryThunks.fetchAllCategories());
          },
          converter: (store) => store.state.categories,
          builder: (context, categories) => Container(
            padding: EdgeInsets.all(20.0),
            child: categories.isEmpty
                ? Text("Categories did not uploaded")
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: categories
                        .map((e) => Text(
                              "${e.name}",
                            ))
                        .toList(),
                  ),
          ),
        ),
        floatingActionButton: StoreConnector<AppState, dynamic>(
          converter: (store) => (CategoryModel category) =>
              store.dispatch(AddCategoryAction(payload: category)),
          builder: (context, setCategory) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/transaction'),
          ),
        ));
  }
}
