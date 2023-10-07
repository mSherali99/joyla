import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joyla/utils/utils.dart';

Widget widgetForDepartmentsScreen(BuildContext context, String imageStr, String nameStr, String countStr) {
  return SizedBox(
    width: wd(context) * 0.48,
    height: wd(context) * 0.48,
    child: Stack(
      children: [
        SizedBox(
          width: wd(context) * 0.48,
          height: wd(context) * 0.48,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageStr,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: hg(context) * 0.09,
          left: wd(context) * 0.06,
          child: SizedBox(
            width: wd(context) * 0.4,
            child: Text(
              nameStr,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: wd(context) * 0.08,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        Positioned(
          top: hg(context) * 0.13,
          left: wd(context) * 0.01,
          child: SizedBox(
            width: wd(context) * 0.4,
            child: Text(
              countStr,
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: wd(context) * 0.05,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
