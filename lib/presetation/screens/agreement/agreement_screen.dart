import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:joyla/utils/utils.dart';

class AgreementScreen extends StatefulWidget {
  const AgreementScreen({super.key});

  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  var index = 0.0;
  final pageController = PageController();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: hg(context) * 0.1,
        title: Text(
          "Takliflarim",
          style: TextStyle(
            color: Colors.white,
            fontSize: wd(context) * 0.09,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            letterSpacing: 0.70,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: wd(context),
            height: hg(context) * 0.07,
            child: Row(
              children: [
                SizedBox(
                  width: wd(context) / 3,
                  child: Center(
                    child: Text(
                      "Sotib Olish",
                      style: TextStyle(
                        color: const Color(0xFF4D829B),
                        fontSize: wd(context) * 0.045,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: wd(context) / 3,
                  child: Center(
                    child: Text(
                      "Sotish",
                      style: TextStyle(
                        color: const Color(0xFF4D829B),
                        fontSize: wd(context) * 0.045,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: wd(context) / 3,
                  child: Center(
                    child: Text(
                      "Kelishuv",
                      style: TextStyle(
                        color: const Color(0xFF4D829B),
                        fontSize: wd(context) * 0.045,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// sotuv bo'limlari
          SizedBox(
            height: hg(context) * 0.004,
            child: ListView.separated(
              itemCount: 3,
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 0,
                );
              },
              itemBuilder: (_, i) {
                return Container(
                  width: wd(context) / 3,
                  height: hg(context) * 0.004,
                  decoration: ShapeDecoration(
                    color: i == index.round()
                        ? const Color(0xFF004C6F)
                        : Colors.white,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: wd(context),
            height: 0.5,
            color: Colors.black.withOpacity(0.5),
          ),

          /// qora chiziq
          SizedBox(
            height: hg(context) * 0.7,
            width: wd(context),
            child: PageView.builder(
              itemCount: 3,
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                return Container(
                  width: wd(context),
                  height: hg(context) * 0.6,
                  child: Column(
                    children: [
                      const Spacer(),
                      SvgPicture.asset(
                        "assets/svg/emptyboxsvg.svg",
                        width: wd(context) * 0.25,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: hg(context) * 0.03),
                        child: Text(
                          'No Offers here',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF004C6F),
                            fontSize: wd(context) * 0.07,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: hg(context) * 0.015),
                        child: SizedBox(
                          width: wd(context) * 0.7,
                          child: Text(
                            'You can save items by clicking the heart button on the items shown in Home.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF004C6F),
                              fontSize: wd(context) * 0.04,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: hg(context) * 0.1,
                      ),
                      const Spacer(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
