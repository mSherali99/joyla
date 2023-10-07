import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joyla/presetation/screens/category/category_screen.dart';
import 'package:joyla/presetation/widgets/widget_for_departmentsscreen.dart';
import 'package:joyla/utils/utils.dart';

class DepartmentsScreen extends StatefulWidget {
  const DepartmentsScreen({super.key});

  @override
  State<DepartmentsScreen> createState() => _DepartmentsScreenState();
}

class _DepartmentsScreenState extends State<DepartmentsScreen> {
  final imageList = [
    "assets/departaments/elektronika.jpg",
    "assets/departaments/texnika.jpg",
    "assets/departaments/home.jpg",
    "assets/departaments/kids.jpg",
    "assets/departaments/garder.png",
    "assets/departaments/furniture.jpg",
    "assets/departaments/clothes.jpg",
    "assets/departaments/hobby.jpg",
  ];

  final nameList = [
    "Elektronika",
    "Transport",
    "Moda-Go'zallik",
    "Ko'chmas mulk",
    "Bolalar uchun",
    "Mebel",
    "Uy va bog'",
    "Fitnes & Hobbi",
  ];

  final countList = [
    "1197 ta E'lonlar",
    "473 ta E'lonlar",
    "1007 ta E'lonlar",
    "234 ta E'lonlar",
    "298 ta E'lonlar",
    "317 ta E'lonlar",
    "444 ta E'lonlar",
    "93 ta E'lonlar",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF004C6F),
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            const Spacer(),
            const Text(
              "Bo'limlar",
              style: TextStyle(
                color: Color(0xFF004C6F),
                fontSize: 32,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w600,
                height: 0.05,
                letterSpacing: -0.20,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: wd(context) * 0.15,
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            crossAxisCount: 2,
          ),
          itemBuilder: (_, i) {
            return GestureDetector(
              onTap: (){
                /// electronics, transport, furniture, realEstate, forChildren, fashionBeaty, home, hobby
                if (i == 0) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CategoryScreen(category: EnumCategory.electronics, pageNumber: 1)));
                } else if (i == 1) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CategoryScreen(category: EnumCategory.transport, pageNumber: 2)));
                } else if (i == 2) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CategoryScreen(category: EnumCategory.furniture, pageNumber: 3)));
                } else if (i == 3) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CategoryScreen(category: EnumCategory.realEstate, pageNumber: 4)));
                } else if (i == 4) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CategoryScreen(category: EnumCategory.forChildren, pageNumber: 5)));
                } else if (i == 5) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CategoryScreen(category: EnumCategory.fashionBeaty, pageNumber: 6)));
                } else if (i == 6) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CategoryScreen(category: EnumCategory.home, pageNumber: 7)));
                } else {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CategoryScreen(category: EnumCategory.hobby, pageNumber: 8)));
                }
              },
              child: widgetForDepartmentsScreen(
                context,
                imageList[i],
                nameList[i],
                countList[i],
              ),
            );
          },
        ),
      ),
    );
  }
}
