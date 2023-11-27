import 'package:flutter/material.dart';

Widget reusableTextField(
    String text, IconData iconShape, Color colorTextAndIcon) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xffd3d3d3),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(
            iconShape,
            color: colorTextAndIcon,
            size: 35,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(color: colorTextAndIcon, fontSize: 25),
          ),
        ],
      ),
    ),
  );
}
