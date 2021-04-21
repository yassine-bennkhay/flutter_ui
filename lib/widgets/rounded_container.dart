import 'package:flutter/material.dart';
Widget roundedContainer(BuildContext context) {
  return Container(
    height: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(35),
        bottomRight: Radius.circular(35),
      ),
      color: Color(0xff8290AA),
    ),

  );
}