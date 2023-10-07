import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joyla/data/model/listI_model.dart';
import 'package:joyla/presetation/screens/details/details_screen.dart';

Widget widgetForGridViewInHomeScreen(ListModel items, String name, BuildContext context, Function() clickHeart) {
  return Container(
    height: 220,
    decoration: ShapeDecoration(
      color: Colors.black.withOpacity(0.1),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    child: Column(
      children: [
        Container(
          height: 150,
          decoration: ShapeDecoration(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                left: 0,
                top: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(items: items, nextPage: 1,),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: items.image1,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    clickHeart.call();
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: ShapeDecoration(
                      color: Colors.black.withOpacity(0.3),
                      shape: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        items.isSaved == true ? "assets/icons/heartred.png" : "assets/icons/heartwhite.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              items.name,
              maxLines: 1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                decoration: TextDecoration.none,
                color: Color(0xFF002D41),
                fontSize: 20,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w400,
                letterSpacing: -0.30,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
          child: Text(
            items.price,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              decoration: TextDecoration.none,
              color: Color(0xFF002D41),
              fontSize: 24,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.30,
            ),
          ),
        ),
      ],
    ),
  );
}
