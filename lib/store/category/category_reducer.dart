import 'package:flutter_app/models/CategoryModel.dart';
import 'package:redux/redux.dart';

import 'category_actions.dart';

List<CategoryModel> addCategory(List<CategoryModel> state, action) => []
  ..addAll(state)
  ..add(action.payload);

List<CategoryModel> setCategories(List<CategoryModel> state, action) => []..addAll(action.payload);

final Reducer<List<CategoryModel>> categoryReducer = combineReducers<List<CategoryModel>>([
  new TypedReducer<List<CategoryModel>, AddCategoryAction>(addCategory),
  new TypedReducer<List<CategoryModel>, SetCategoriesAction>(setCategories),
]);