import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/CategoryModel.dart';

class AddCategoryAction {
  final CategoryModel payload;

  AddCategoryAction({ @required this.payload });
}

class SetCategoriesAction {
  final List<CategoryModel> payload;

  SetCategoriesAction({ @required this.payload });
}