import 'package:flutter/cupertino.dart';

import 'CategoryModel.dart';

class CacheInfoModel {
  final CategoryModel category;
  final int spent;
  final int left;
  final int leftToday;

  CacheInfoModel({@required this.category, this.spent, this.left, this.leftToday});
}
