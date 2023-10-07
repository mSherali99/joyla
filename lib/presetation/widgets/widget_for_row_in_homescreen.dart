import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget widgetForRowInHomeScreen(String rowName, bool isClick) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Container(
      height: 48,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: isClick == true ? Colors.blue.withOpacity(0.8) : Colors.blue.withOpacity(0.2),
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Text(
          rowName,
          style: const TextStyle(
            decoration: TextDecoration.none,
            fontSize: 16,
            color: Colors.black,
            fontFamily: 'SF Pro Text',
            fontWeight: FontWeight.w400,
            letterSpacing: -0.30,
          ),
        ),
      ),
    ),
  );
}
