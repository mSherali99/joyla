import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final controller = PageController();
  var index = 0.0;
  var listTitle = ["Tayyormisiz?", "Tell us where you want to sell and buy"];
  var listText = ["ltimos, Joyla sizga eng yaxshi hizmat ko'rsatishi uchun Geolokatsiyaga ruxsat bering!", "Sorry, we’re having some technical issues (as you can see) try to refresh the page, sometimes works  ;)"];
  var listButton = ["Ruxsat berish", "Allow using Location"];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      index = controller.page!;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Image.asset(
                "assets/images/intro4.png",
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
                    padding: EdgeInsets.only(top: 56, left: 16),
                    child: Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: Colors.black,
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
                const Text(
                  "Tayyormisiz?",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Color(0xFF004C6F),
                    fontSize: 32,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, right: 72),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "ltimos, Joyla sizga eng yaxshi hizmat ko'rsatishi uchun ",
                          style: TextStyle(
                            color: Color(0xFF004C6F),
                            fontSize: 15,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: "Geolokatsiyaga",
                          style: TextStyle(
                            color: Color(0xFF004C6F),
                            fontSize: 15,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: " ruxsat bering!",
                          style: TextStyle(
                            color: Color(0xFF004C6F),
                            fontSize: 15,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF078FCD),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                    ),
                    child: const Text(
                      "Ruxsat berish",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w600,
                        height: 1.29,
                      ),
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
