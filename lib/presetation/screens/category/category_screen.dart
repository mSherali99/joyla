import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joyla/data/source/api/joyla_api.dart';
import 'package:joyla/presetation/screens/category/bloc/category_bloc.dart';
import 'package:joyla/presetation/screens/details/details_screen.dart';
import 'package:joyla/presetation/screens/main/main_screen.dart';
import 'package:joyla/utils/utils.dart';

import '../../../data/model/listI_model.dart';
import '../../widgets/widget_for_gridview_in_homescreen.dart';
import '../../widgets/widget_for_row_in_homescreen.dart';

class CategoryScreen extends StatefulWidget {
  final EnumCategory category;
  final int pageNumber;

  const CategoryScreen(
      {super.key, required this.category, required this.pageNumber});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool f = true;
  var pageNum = 0;
  final textController = TextEditingController();
  var rowList = [
    "Barchasi",
    "Elektronika",
    "Transport",
    "Mebel",
    "Ko'chmas mulk",
    "Bolalar uchun",
    "Moda-Go'zallik",
    "Uy va bog'",
    "Fitnes Hobbi",
    "Servislar",
    "Hayvonlar"
  ];

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = CategoryBloc(widget.category, JoylaApi());
    bloc.add(LoadDataCategoryScreen(enumCategory: widget.category));
    if (f) {
      pageNum = widget.pageNumber;
    }
    return BlocBuilder<CategoryBloc, CategoryState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: hg(context) * 0.1,
            backgroundColor: Colors.blue,
            leading: Padding(
              padding: EdgeInsets.only(left: wd(context) * 0.04),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: hg(context) * 0.03,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            title: Container(
              width: wd(context) * 0.8,
              height: hg(context) * 0.05,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.8),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: const TextStyle(fontSize: 20),
                  icon: Padding(
                    padding: EdgeInsets.only(left: wd(context) * 0.03),
                    child: Icon(
                      Icons.search,
                      size: wd(context) * 0.06,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Container(
            color: Colors.blue.withOpacity(0.1),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (_, i) => Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              bloc.add(LoadDataCategoryScreen(enumCategory: EnumCategory.electronics));
                              pageNum = 1;
                            },
                            child: widgetForRowInHomeScreen(
                              rowList[1],
                              pageNum == 1,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              pageNum = 2;
                              setState(() {});
                            },
                            child: widgetForRowInHomeScreen(
                              rowList[2],
                              pageNum == 2,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              pageNum = 3;
                              setState(() {});
                            },
                            child: widgetForRowInHomeScreen(
                              rowList[3],
                              pageNum == 3,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              pageNum = 4;
                              setState(() {});
                            },
                            child: widgetForRowInHomeScreen(
                              rowList[4],
                              pageNum == 4,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              pageNum = 5;
                              setState(() {});
                            },
                            child: widgetForRowInHomeScreen(
                              rowList[5],
                              pageNum == 5,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              pageNum = 6;
                              setState(() {});
                            },
                            child: widgetForRowInHomeScreen(
                              rowList[6],
                              pageNum == 6,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              pageNum = 7;
                              setState(() {});
                            },
                            child: widgetForRowInHomeScreen(
                              rowList[7],
                              pageNum == 7,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              pageNum = 8;
                              setState(() {});
                            },
                            child: widgetForRowInHomeScreen(
                              rowList[8],
                              pageNum == 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (state.listItem.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            mainAxisExtent: 224,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: state.listItem.length,
                          shrinkWrap: true,
                          itemBuilder: (_, i) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailsScreen(
                                      items: state.listItem[i], nextPage: 3);
                                }));
                              },
                              child: widgetForGridViewInHomeScreen(
                                state.listItem[i],
                                state.categoryName,
                                context,
                                () {
                                  bloc.add(
                                    ClickHeartCategoryScreen(
                                      listModel: ListModel(
                                        id: state.listItem[i].id,
                                        description: state.listItem[i].description,
                                        image1: state.listItem[i].image1,
                                        image2: state.listItem[i].image2,
                                        image3: state.listItem[i].image3,
                                        image4: state.listItem[i].image4,
                                        image5: state.listItem[i].image5,
                                        info: state.listItem[i].info,
                                        name: state.listItem[i].name,
                                        phone: state.listItem[i].phone,
                                        price: state.listItem[i].price,
                                        userName: state.listItem[i].userName,
                                        time: state.listItem[i].time,
                                        departamentName:
                                            state.listItem[i].departamentName,
                                        isSaved: state.listItem[i].isSaved == true
                                            ? false
                                            : true,
                                      ),
                                      index: i,
                                      id: state.listItem[i].id,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
