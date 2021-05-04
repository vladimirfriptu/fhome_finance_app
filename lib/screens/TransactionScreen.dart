import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/CategoryModel.dart';
import 'package:flutter_app/store/AppStateModel.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_app/widgets/CategoryCard.dart';

class TransactionScreen extends StatefulWidget {
  String screenTitle = 'Создание транзакции';

  TransactionScreen({Key key}) : super(key: key);

  @override
  _TransactionScreen createState() => _TransactionScreen();
}

class _TransactionScreen extends State<TransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  int _activeCategoryId;

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
                int _centerIndex = (categories.length / 2).round();
                List<CategoryModel> left = categories.sublist(0, _centerIndex);
                List<CategoryModel> right =
                    categories.sublist(_centerIndex, categories.length);

                final int _childCount = max(left.length, right.length);

                return CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                      CategoryModel leftItem =
                          index >= left.length ? null : left[index];
                      CategoryModel rightItem =
                          index >= right.length ? null : right[index];

                      final double cardWidth =
                          MediaQuery.of(context).size.width / 2 - 10;

                      return Row(
                        children: [
                          leftItem != null
                              ? Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: CategoryCard(
                                    title: leftItem.name,
                                    isActive: _activeCategoryId == leftItem.id,
                                    icon: Icons.add_call,
                                    onSelect: () => setState(
                                        () => _activeCategoryId = leftItem.id),
                                  ),
                                  width: cardWidth,
                                )
                              : Container(),
                          rightItem != null
                              ? Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: CategoryCard(
                                    title: rightItem.name,
                                    isActive: _activeCategoryId == rightItem.id,
                                    icon: Icons.add_call,
                                    onSelect: () => setState(
                                        () => _activeCategoryId = rightItem.id),
                                  ),
                                  width: cardWidth,
                                )
                              : Container(),
                        ],
                      );
                    }, childCount: _childCount))
                  ],
                );
              })),
    );
  }
}
