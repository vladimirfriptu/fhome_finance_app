import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/CacheInfoModel.dart';
import 'package:flutter_app/models/CategoryModel.dart';

class AppState {
  final List<CacheInfoModel> cacheInfoItems;
  final List<CategoryModel> categories;

  AppState({@required this.cacheInfoItems, @required this.categories});

  AppState.initialState()
      : cacheInfoItems = List.unmodifiable(<CacheInfoModel>[]),
        categories = List.unmodifiable(<CategoryModel>[]);
}
