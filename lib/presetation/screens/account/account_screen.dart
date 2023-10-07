import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joyla/utils/utils.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: wd(context),
            height: hg(context) * 0.25,
            color: Colors.blue,
            child: Center(
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    width: wd(context) * 0.3,
                    height: wd(context) * 0.3,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white.withOpacity(0.8), width: 3),
                        color: Colors.blueGrey,
                        shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        "S",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: wd(context) * 0.15,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Sherali",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: wd(context) * 0.1,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.30,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ), /// appbar
          Container(
            width: wd(context),
            height: hg(context) * 0.013,
            color: Colors.blue.withOpacity(0.2),
          ), /// top space
          Container(
            margin: const EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            width: wd(context),
            height: hg(context) * 0.06,
            child: Text(
              "ID: 998904334403",
              style: TextStyle(
                color: const Color(0xFF002D41),
                fontSize: hg(context) * 0.022,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w400,
              ),
            ),
          ), /// id
          Container(
            width: wd(context),
            height: 0.5,
            color: Colors.black.withOpacity(0.7),
          ), /// qora chiziq
          Container(
            margin: const EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            width: wd(context),
            height: hg(context) * 0.08,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/wallet.png",
                      width: wd(context) * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "Hamyon",
                        style: TextStyle(
                          color: const Color(0xFF002D41),
                          fontSize: hg(context) * 0.022,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    children: [
                      const Spacer(),
                      Icon(Icons.navigate_next_outlined, size: wd(context) * 0.06, color: const Color(0xFF004C6F),),
                    ],
                  ),
                ),
                Text(
                  "Balans: 0 so'm",
                  style: TextStyle(
                    color: Color(0xFF004C6F),
                    fontSize: wd(context) * 0.035,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ), /// wallet
          Container(
            alignment: Alignment.centerLeft,
            width: wd(context),
            height: hg(context) * 0.07,
            color: Colors.blue.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Mening faoliyatim",
                style: TextStyle(
                  color: const Color(0xFF002D41),
                  fontSize: hg(context) * 0.022,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ), /// mening faoliyatim
          Container(
            alignment: Alignment.centerLeft,
            width: wd(context),
            height: hg(context) * 0.06,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "E'lonlarim",
                    style: TextStyle(
                      color: const Color(0xFF002D41),
                      fontSize: hg(context) * 0.022,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.navigate_next_outlined, size: wd(context) * 0.06, color: const Color(0xFF004C6F),)
                ],
              ),
            ),
          ), /// elonlarim
          Container(
            width: wd(context),
            height: 0.5,
            color: Colors.black.withOpacity(0.7),
          ), /// qora chiziq
          Container(
            alignment: Alignment.centerLeft,
            width: wd(context),
            height: hg(context) * 0.06,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Chatlar arxivi",
                    style: TextStyle(
                      color: const Color(0xFF002D41),
                      fontSize: hg(context) * 0.022,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.navigate_next_outlined, size: wd(context) * 0.06, color: const Color(0xFF004C6F),)
                ],
              ),
            ),
          ), /// chatlar arxivi
          Container(
            alignment: Alignment.centerLeft,
            width: wd(context),
            height: hg(context) * 0.07,
            color: Colors.blue.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Sozlamalar",
                style: TextStyle(
                  color: const Color(0xFF002D41),
                  fontSize: hg(context) * 0.022,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ), /// sozlamalar
          Container(
            alignment: Alignment.centerLeft,
            width: wd(context),
            height: hg(context) * 0.06,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Profilni sozlash",
                    style: TextStyle(
                      color: const Color(0xFF002D41),
                      fontSize: hg(context) * 0.022,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.navigate_next_outlined, size: wd(context) * 0.06, color: const Color(0xFF004C6F),)
                ],
              ),
            ),
          ), /// profilni sozlash
          Container(
            width: wd(context),
            height: 0.5,
            color: Colors.black.withOpacity(0.7),
          ), /// qora chiziq
          Container(
            alignment: Alignment.centerLeft,
            width: wd(context),
            height: hg(context) * 0.06,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Bildirishnomalar",
                    style: TextStyle(
                      color: const Color(0xFF002D41),
                      fontSize: hg(context) * 0.022,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.navigate_next_outlined, size: wd(context) * 0.06, color: const Color(0xFF004C6F),)
                ],
              ),
            ),
          ), /// bildirishnomalar
          Container(
            width: wd(context),
            height: 0.5,
            color: Colors.black.withOpacity(0.7),
          ), /// qora chiziq
          Container(
            alignment: Alignment.centerLeft,
            width: wd(context),
            height: hg(context) * 0.06,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Til",
                    style: TextStyle(
                      color: const Color(0xFF002D41),
                      fontSize: hg(context) * 0.022,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.navigate_next_outlined, size: wd(context) * 0.06, color: const Color(0xFF004C6F),)
                ],
              ),
            ),
          ), /// til
          Container(
            width: wd(context),
            height: 0.5,
            color: Colors.black.withOpacity(0.7),
          ), /// qora chiziq
          Container(
            alignment: Alignment.centerLeft,
            width: wd(context),
            height: hg(context) * 0.06,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Yordam",
                    style: TextStyle(
                      color: const Color(0xFF002D41),
                      fontSize: hg(context) * 0.022,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.navigate_next_outlined, size: wd(context) * 0.06, color: const Color(0xFF004C6F),)
                ],
              ),
            ),
          ), /// yordam
          Container(
            width: wd(context),
            height: 0.5,
            color: Colors.black.withOpacity(0.7),
          ), /// qora chiziq
          Container(
            alignment: Alignment.centerLeft,
            width: wd(context),
            height: hg(context) * 0.07,
            color: Colors.blue.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Haqida",
                style: TextStyle(
                  color: const Color(0xFF002D41),
                  fontSize: hg(context) * 0.022,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ), /// haqida
          Container(
            alignment: Alignment.centerLeft,
            width: wd(context),
            height: hg(context) * 0.06,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Xizmat ko'rsatish shartlari",
                    style: TextStyle(
                      color: const Color(0xFF002D41),
                      fontSize: hg(context) * 0.022,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.navigate_next_outlined, size: wd(context) * 0.06, color: const Color(0xFF004C6F),)
                ],
              ),
            ),
          ), /// xizmat ko'rsatish shartlari
          Container(
            width: wd(context),
            height: 0.5,
            color: Colors.black.withOpacity(0.7),
          ), /// qora chiziq
          Container(
            alignment: Alignment.centerLeft,
            width: wd(context),
            height: hg(context) * 0.06,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Maxfiylik siyosati",
                    style: TextStyle(
                      color: const Color(0xFF002D41),
                      fontSize: hg(context) * 0.022,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.navigate_next_outlined, size: wd(context) * 0.06, color: const Color(0xFF004C6F),)
                ],
              ),
            ),
          ), /// maxfiylik siyosati
          Container(
            width: wd(context),
            height: 0.5,
            color: Colors.black.withOpacity(0.7),
          ), /// qora chiziq
          Container(
            alignment: Alignment.centerLeft,
            width: wd(context),
            height: hg(context) * 0.06,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Ilova haqida",
                    style: TextStyle(
                      color: const Color(0xFF002D41),
                      fontSize: hg(context) * 0.022,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.navigate_next_outlined, size: wd(context) * 0.06, color: const Color(0xFF004C6F),)
                ],
              ),
            ),
          ), /// ilova haqida
          Container(
            width: wd(context),
            height: 0.5,
            color: Colors.black.withOpacity(0.7),
          ), /// qora chiziq
          Container(
            alignment: Alignment.centerLeft,
            width: wd(context),
            height: hg(context) * 0.07,
            color: Colors.blue.withOpacity(0.2),
          ), /// clolorfull space
          Container(
            alignment: Alignment.center,
            width: wd(context),
            height: hg(context) * 0.06,
            child: Text(
              "Chiqish",
              style: TextStyle(
                color: const Color(0xFF002D41),
                fontSize: hg(context) * 0.022,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w400,
              ),
            ),
          ), /// chiqish
          Container(
            alignment: Alignment.centerLeft,
            width: wd(context),
            height: hg(context) * 0.09,
            color: Colors.blue.withOpacity(0.2),
          ), /// clolorfull space
        ],
      ),
    ));
  }
}
