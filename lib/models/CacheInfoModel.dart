import 'package:flutter/cupertino.dart';

import 'CategoryModel.dart';

class CacheInfoModel {
  final CategoryModel category;
  final int spent;
  final int left;
  final int leftToday;

  CacheInfoModel({@required this.category, this.spent, this.left, this.leftToday});

  factory CacheInfoModel.fromJson(Map<String, dynamic> json) {
    return CacheInfoModel(
        category: new CategoryModel(name: json['category_name'], priority: json['category_priority']),
        left: json['left'],
        leftToday: json['left_today'],
        spent: json['spent']);
  }
}
