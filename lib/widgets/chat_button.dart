import 'package:flutter/material.dart';
Widget chatButton(){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Container(
          height: 55,
          width: 170,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Chat',
              style: TextStyle(color: Colors.grey, fontSize: 22),
            ),
          ),
        ),
      ),
    ],
  );
}