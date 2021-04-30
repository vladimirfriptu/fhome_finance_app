import 'package:flutter_app/store/AppStateModel.dart';
import 'package:flutter_app/store/cacheInfo/cache_info_reducer.dart';
import 'package:flutter_app/store/category/category_reducer.dart';

AppState appStateReducer(AppState state, action) => AppState(
    cacheInfoItems: cacheInfoReducer(state.cacheInfoItems, action),
    categories: categoryReducer(state.categories, action));
