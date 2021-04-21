import 'package:flutter/material.dart';
Widget followButton(){
  return Padding(
    padding: const EdgeInsets.only(left: 14),
    child: Container(
      height: 55,
      width: 170,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xff5374FF),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: Text(
          'Follow',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    ),
  );
}