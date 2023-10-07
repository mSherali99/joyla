import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joyla/data/model/joyla_model.dart';
import 'package:joyla/data/source/local/floor_entity.dart';

import '../../utils/utils.dart';

Widget widgetForSavedScreen(BuildContext context, FloorEntity itemsFloor, Function() clickedHeart) {
  return Container(
    color: Colors.white,
    width: wd(context),
    height: hg(context) * 0.17,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      itemsFloor.image1,
                  width: hg(context) * 0.15,
                  height: hg(context) * 0.15,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: hg(context) * 0.008,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/locationwhite.svg",
                        width: 18,
                        height: 18,
                      ),
                      const Text(
                        "1.8 km away",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                          letterSpacing: -0.11,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: wd(context) - hg(context) * 0.15 - 64,
                        child: Text(
                          itemsFloor.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF002D41),
                            fontSize: 18,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          clickedHeart.call();
                        },
                        child: Image.asset(
                          "assets/icons/heartred.png",
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    itemsFloor.price,
                    style: const TextStyle(
                      color: Color(0xFF002D41),
                      fontSize: 24,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    itemsFloor.time,
                    style: const TextStyle(
                      color: Color(0xFFC4C4C4),
                      fontSize: 16,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
