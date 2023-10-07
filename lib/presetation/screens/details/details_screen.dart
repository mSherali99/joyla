import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:joyla/data/model/listI_model.dart';
import 'package:joyla/presetation/screens/category/category_screen.dart';
import 'package:joyla/presetation/screens/main/main_screen.dart';
import 'package:joyla/presetation/screens/offer/offer_screen.dart';
import '../../../utils/utils.dart';
import '../../widgets/widget_for_detailesscreen.dart';
import 'bloc/details_bloc.dart';

class DetailsScreen extends StatefulWidget {
  final ListModel items;
  final int nextPage;

  const DetailsScreen({super.key, required this.items, required this.nextPage});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final bloc = DetailsBloc();
  final controller = PageController();
  final scrollController = ScrollController();
  var isSaved = false;
  var isEnter = 0;

  var index = 0.0;
  int indexValue = 0;

  @override
  void initState() {
    controller.addListener(() {
      index = controller.page!;
      setState(() {});
    });
    super.initState();
    bloc.add(InitialFloor());
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void clickNextImage(int i, int index) async {
    for (int j = 0; j < i - index; ++j) {
      await controller.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
    setState(() {});
  }

  void clickBackImage(int i, int index) async {
    for (int j = 0; j < index - i; ++j) {
      await controller.previousPage(
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var listImages = [
      widget.items.image1,
      widget.items.image2,
      widget.items.image3,
      widget.items.image4,
      widget.items.image5
    ];
    if (isEnter == 0) {
      isSaved = widget.items.isSaved;
      isEnter++;
    }
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocBuilder<DetailsBloc, DetailsState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    bottom: hg(context) * 0.1,
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.yellow,
                            width: hg(context) * 0.5,
                            height: hg(context) * 0.5,
                            child: Stack(
                              children: [
                                PageView.builder(
                                  itemCount: listImages.length,
                                  scrollDirection: Axis.horizontal,
                                  controller: controller,
                                  itemBuilder: (_, i) {
                                    return CachedNetworkImage(
                                      imageUrl: listImages[i],
                                      fit: BoxFit.cover,
                                      height: hg(context) * 0.5,
                                      width: hg(context) * 0.5,
                                    );
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (widget.nextPage == 1) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const MainScreen()));
                                    }
                                    if (widget.nextPage == 2) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const MainScreen()));
                                    }
                                    if (widget.nextPage == 3) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const CategoryScreen(category: EnumCategory.electronics, pageNumber: 1)));
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        left:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: ShapeDecoration(
                                        color: Colors.black.withOpacity(0.1),
                                        shape: const OvalBorder(),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.arrow_back,
                                          size: 28,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top:
                                      MediaQuery.of(context).size.height * 0.06,
                                  right:
                                      MediaQuery.of(context).size.height * 0.02,
                                  child: GestureDetector(
                                    onTap: () {
                                      bloc.add(
                                        ClickHeartInDetailesScreen(
                                          listModel: widget.items,
                                          isSaved: isSaved,
                                        ),
                                      );
                                      if (isSaved) {
                                        isSaved = false;
                                      } else {
                                        isSaved = true;
                                      }
                                    },
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: ShapeDecoration(
                                        color: Colors.black.withOpacity(0.1),
                                        shape: const OvalBorder(),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          isSaved == true
                                              ? "assets/icons/heartred.png"
                                              : "assets/icons/heartwhite.png",
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Container(
                                    height: 40,
                                    decoration: const ShapeDecoration(
                                      color: Colors.white,
                                      shape: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05),
                            child: SizedBox(
                              height: 80,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  controller: scrollController,
                                  shrinkWrap: true,
                                  itemBuilder: (_, i) {
                                    return widgetForDetailesScreen(
                                      listImages[i],
                                      () {
                                        indexValue = index.round();
                                        if (index.round() < i) {
                                          clickNextImage(i, indexValue);
                                        } else {
                                          clickBackImage(i, indexValue);
                                        }
                                      },
                                    );
                                  }),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: wd(context) * 0.05,
                                top: wd(context) * 0.05,
                                right: wd(context) * 0.2),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                widget.items.info,
                                style: const TextStyle(
                                  color: Color(0xFF002D41),
                                  fontSize: 22,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w500,
                                  height: 1.29,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: wd(context) * 0.04,
                                left: wd(context) * 0.05,
                                right: wd(context) * 0.05),
                            child: Row(
                              children: [
                                Text(
                                  widget.items.price,
                                  style: const TextStyle(
                                    color: Color(0xFF002D41),
                                    fontSize: 26,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    height: 1.27,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: wd(context) * 0.05),
                            child: Row(
                              children: [
                                Text(
                                  widget.items.time,
                                  style: const TextStyle(
                                    color: Color(0xFF002D41),
                                    fontSize: 16,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w500,
                                    height: 1.33,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: wd(context) * 0.03,
                                left: wd(context) * 0.05,
                                bottom: wd(context) * 0.05),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/location.svg",
                                  width: 16,
                                  height: 16,
                                ),
                                const Text(
                                  "1.8 km away",
                                  style: TextStyle(
                                    color: Color(0xFF002D41),
                                    fontSize: 15,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w400,
                                    height: 1,
                                    letterSpacing: -0.15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: wd(context) * 0.22,
                            decoration: BoxDecoration(
                              border: Border.symmetric(
                                horizontal: BorderSide(
                                    color: Colors.black.withOpacity(0.3),
                                    width: 1),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: wd(context) * 0.05,
                                ),
                                const Text(
                                  "Condition:",
                                  style: TextStyle(
                                    color: Color(0xFF4D829B),
                                    fontSize: 18,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w500,
                                    height: 1.69,
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  "New",
                                  style: TextStyle(
                                    color: Color(0xFF002D41),
                                    fontSize: 18,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w500,
                                    height: 1.47,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: wd(context) * 0.4,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: wd(context) * 0.05,
                                top: wd(context) * 0.05),
                            width: wd(context),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Tavsif",
                              style: TextStyle(
                                color: Color(0xFF4D829B),
                                fontSize: 13,
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w500,
                                height: 1.69,
                              ),
                            ),
                          ),
                          Container(
                            width: wd(context),
                            margin: EdgeInsets.only(
                                top: wd(context) * 0.05,
                                left: wd(context) * 0.05,
                                right: wd(context) * 0.08),
                            child: Text(
                              widget.items.description,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w400,
                                height: 1.54,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: wd(context) * 0.05),
                            height: wd(context) * 0.22,
                            decoration: BoxDecoration(
                              border: Border.symmetric(
                                horizontal: BorderSide(
                                    color: Colors.black.withOpacity(0.3),
                                    width: 1),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: wd(context) * 0.05,
                                ),
                                const Text(
                                  "Bo'lim:",
                                  style: TextStyle(
                                    color: Color(0xFF4D829B),
                                    fontSize: 18,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w500,
                                    height: 1.69,
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  "Servislar",
                                  style: TextStyle(
                                    color: Color(0xFF002D41),
                                    fontSize: 18,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w500,
                                    height: 1.47,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: wd(context) * 0.4,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: wd(context) * 0.3,
                            decoration: BoxDecoration(
                              border: Border.symmetric(
                                horizontal: BorderSide(
                                    color: Colors.black.withOpacity(0.3),
                                    width: 1),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Spacer(),
                                const Text(
                                  "Name:",
                                  style: TextStyle(
                                    color: Color(0xFF4D829B),
                                    fontSize: 18,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w500,
                                    height: 1.69,
                                  ),
                                ),
                                SizedBox(
                                  width: wd(context),
                                ),
                                Text(
                                  widget.items.userName,
                                  style: const TextStyle(
                                    color: Color(0xFF002D41),
                                    fontSize: 18,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w500,
                                    height: 1.47,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.08),
                            height: MediaQuery.of(context).size.width * 0.12,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFE5F6FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Qo'ng'iroq qilish",
                                style: TextStyle(
                                  color: Color(0xFF078FCD),
                                  fontSize: 17,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w500,
                                  height: 1,
                                  letterSpacing: -0.17,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OfferScreen(
                                    imageStr: listImages[0],
                                    nameStr: widget.items.info,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.08),
                              height: MediaQuery.of(context).size.width * 0.12,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF078FCD),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Taklif berish",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                    letterSpacing: -0.17,
                                  ),
                                ),
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
          );
        },
      ),
    );
  }
}
