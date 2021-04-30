import 'package:flutter_app/models/CategoryModel.dart';
import 'package:redux/redux.dart';

import 'category_actions.dart';

List<CategoryModel> addCategory(List<CategoryModel> state, action) => []
  ..addAll(state)
  ..add(action.category);

final Reducer<List<CategoryModel>> categoryReducer = combineReducers<List<CategoryModel>>([
  new TypedReducer<List<CategoryModel>, AddCategoryAction>(addCategory),
]);
