import 'package:flutter/material.dart';
import 'package:joyla/presetation/screens/main/main_screen.dart';
import 'package:joyla/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../di/di.dart';
import '../home/home_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final controller = PageController();
  final controllerListView = ScrollController();
  var listTitle = [
    "Yaqiningizdan sotib oling va soting",
    "Qulay takliflarga ega boling",
    "Qulay takliflarga ega boling"
  ];
  var listText = [
    " siz izlagan e'lonlarning eng yaqinlarini taqdim etadi. Uchrashuv joyini va vaqtini belgilash endi yanada osonlashdi.",
    " sizning hotirjamligingizni taminlaydi. Shunchaki raqamingizni yashiring va sizga faqat ilova orqali takliflar berishadi.",
    " sizga har doim narxlarni kelishib olishingizga imkon beradi."
  ];
  var index = 0.0;

  @override
  void initState() {
    controller.addListener(() {
      index = controller.page!;
      setState(() {});
    });
    super.initState();
    initalSharedPref();
  }

  Future<void> initalSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("hasPage", true);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: Colors.white,
              width: wd(context),
              height: hg(context) * 0.6,
              child: PageView.builder(
                itemCount: 3,
                controller: controller,
                itemBuilder: (_, i) {
                  return Image.asset(
                    "assets/images/intro${i + 1}.png",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            index.round() == 0
                ? const Text("")
                : GestureDetector(
                    onTap: () {
                      index--;
                      controller.previousPage(
                        duration: const Duration(milliseconds: 500),
                          curve: Curves.linear,
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 56, left: 16),
                      child: Icon(
                        Icons.arrow_back,
                        size: 32,
                        color: Colors.black,
                      ),
                    ),
                  ),
          ],
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  listTitle[index.round()],
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    color: Color(0xFF004C6F),
                    fontSize: 32,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Joyla",
                          style: TextStyle(
                            color: Color(0xFF004C6F),
                            fontSize: 20,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: listText[index.round()],
                          style: const TextStyle(
                            color: Color(0xFF004C6F),
                            fontSize: 18,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 75,
                        ),
                        ListView.separated(
                          itemCount: 3,
                          controller: controllerListView,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, __) => const SizedBox(
                            width: 12,
                          ),
                          itemBuilder: (_, i) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 19),
                              child: Container(
                                width: i == index.round() ? 30 : 10,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: i == index.round()
                                      ? const Color(0xFF004C6F)
                                      : const Color(0x33004D70),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      side: BorderSide.none),
                                ),
                              ),
                            );
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (index == 2) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                            } else {
                              index++;
                              controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.center,
                            shape: const CircleBorder(),
                            backgroundColor: index.round() == 2
                                ? Colors.blue
                                : Colors.blue[100],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/images/next.png",
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
