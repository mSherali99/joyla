import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OfferScreen extends StatefulWidget {
  final String imageStr;
  final String nameStr;
  const OfferScreen({super.key, required this.imageStr, required this.nameStr});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  wD(BuildContext context) => MediaQuery.of(context).size.width;

  hG(BuildContext context) => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: hG(context) * 0.1,
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 28,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            SizedBox(
              width: wD(context) * 0.5,
              child: Text(
                widget.nameStr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w500,
                  height: 1.06,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: wD(context) * 0.1),
              width: hG(context) * 0.07,
              height: hG(context) * 0.07,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: widget.imageStr,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: wD(context),
        height: hG(context),
        color: Colors.blue.withOpacity(0.1),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: hG(context) * 0.01),
              width: wD(context) * 0.9,
              height: wD(context) * 0.6,
              decoration: ShapeDecoration(
                color: Colors.yellow.withOpacity(0.1),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svg/offer_icon.svg",
                          width: 28,
                          height: 28,
                        ),
                        SizedBox(
                          width: wD(context) * 0.015,
                        ),
                        const Text(
                          "Taklif",
                          style: TextStyle(
                            color: Color(0xFF002D41),
                            fontSize: 24,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w600,
                            height: 0.90,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: wD(context) * 0.32,
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          width: 0.5,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Spacer(),
                        const Text(
                          "Siz kiritgan taklif:",
                          style: TextStyle(
                            color: Color(0xFF078FCD),
                            fontSize: 15,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w500,
                            height: 1.20,
                          ),
                        ),
                        SizedBox(
                          width: wD(context) * 0.9,
                          height: wD(context) * 0.04,
                        ),
                        const Text(
                          "0 so'm",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            height: 0.56,
                            letterSpacing: -0.50,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: wD(context) * 0.05, vertical: wD(context) * 0.02),
                    decoration: ShapeDecoration(
                      color: Color(0xFF078FCD),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Taklifni kiriting",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w600,
                            height: 1.38,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              color: Colors.yellow.withOpacity(0.14),
              height: hG(context) * 0.1,
              width: wD(context),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: wD(context) * 0.05),
                    child: SvgPicture.asset("assets/svg/offer_call.svg"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: wD(context) * 0.05),
                    child: SvgPicture.asset("assets/svg/offer_location.svg"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: wD(context) * 0.05),
                    width: wD(context) * 0.6,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 0.50, color: Color(0xFFEBEBEB)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    child: Padding(
                      padding: EdgeInsets.only(left: wD(context) * 0.03),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Xabar..."
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
