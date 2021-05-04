import 'package:flutter/cupertino.dart';

class CategoryModel {
  final String name;
  final int priority;
  final int id;

  CategoryModel({@required this.id, @required this.name, this.priority});
}
