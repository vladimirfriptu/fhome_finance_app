import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  bool isActive = false;
  final String title;
  final IconData icon;
  final Function onSelect;

  CategoryCard({this.isActive, this.title, this.icon, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
            border: Border.all(
                color: isActive ? Colors.cyan : Colors.cyanAccent,
                style: BorderStyle.solid,
                width: 2),
            borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Icon(icon),
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
