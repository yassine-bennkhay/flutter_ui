import 'package:flutter/material.dart';
Widget image() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          image: ExactAssetImage('images/me.png'),
        ),
      ),
    ),
  );
}
