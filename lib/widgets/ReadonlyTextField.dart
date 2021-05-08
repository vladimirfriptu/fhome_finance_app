import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadonlyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function onTap;
  final IconData icon;
  final double space;

  ReadonlyTextField({this.controller, this.label, this.onTap, this.icon, this.space});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: space ?? 0),
      child: GestureDetector(
        onTap: onTap,
        child: TextField(
          readOnly: true,
          controller: controller,
          decoration: InputDecoration(
              enabled: false,
              labelText: label,
              border: OutlineInputBorder(),
              prefixIcon: Icon(icon)),
        ),
      ),
    );
  }
}
