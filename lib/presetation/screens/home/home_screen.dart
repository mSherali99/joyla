import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joyla/data/model/listI_model.dart';
import 'package:joyla/data/source/local/app_database.dart';
import 'package:joyla/data/source/local/dao.dart';
import 'package:joyla/presetation/screens/category/category_screen.dart';
import 'package:joyla/presetation/screens/category/category_screen.dart';
import 'package:joyla/presetation/screens/category/category_screen.dart';
import 'package:joyla/presetation/screens/category/category_screen.dart';
import 'package:joyla/presetation/screens/category/category_screen.dart';
import 'package:joyla/presetation/screens/category/category_screen.dart';
import 'package:joyla/presetation/screens/category/category_screen.dart';
import 'package:joyla/presetation/screens/category/category_screen.dart';
import 'package:joyla/presetation/screens/departments/departments_screen.dart';
import 'package:joyla/presetation/screens/save/bloc/save_bloc.dart';
import 'package:joyla/presetation/screens/save/saved_screen.dart';
import 'package:joyla/utils/utils.dart';
import '../../../data/source/api/joyla_api.dart';
import '../../widgets/widget_for_gridview_in_homescreen.dart';
import '../../widgets/widget_for_row_in_homescreen.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final bloc = HomeBloc(JoylaApi());
  final blocSavedScreen = SaveBloc();
  final textController = TextEditingController();

  var index = 0.0;
  var listRow = [
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
    bloc.add(LoadDataEvent());
    textController.addListener(() {
      bloc.add(SearchItemHome(searchText: textController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: bloc),
        // BlocProvider.value(value: blocSavedScreen),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                child: AppBar(
                  toolbarHeight: 120,
                  backgroundColor: Colors.blue,
                  automaticallyImplyLeading: false,
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/home_icon.png',
                            width: 28,
                            height: 28,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "JOYLA",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: TextField(
                              controller: textController,
                              textAlignVertical: TextAlignVertical.center,
                              maxLines: 1,
                              decoration: InputDecoration(
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center,
                                icon: const Icon(
                                  Icons.search,
                                  size: 32,
                                ),
                                iconColor: const Color(0xFFADADAD),
                                hintText: "Search for anything",
                                hintStyle: const TextStyle(
                                  color: Color(0xFFADADAD),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: hg(context) * 0.74,
                child: Builder(
                  builder: (context) {
                    if (state.status == EnumState.loading &&
                        state.list.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 16, bottom: 16),
                          child: SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: ListView.builder(
                              // controller: scrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: 1,
                              itemBuilder: (_, i) => Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 2, right: 12),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const DepartmentsScreen()));
                                      },
                                      child: Container(
                                        width: 48,
                                        height: 48,
                                        alignment: Alignment.center,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFE4F2F8),
                                          shape: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: SvgPicture.asset(
                                          "assets/svg/apps.svg",
                                          width: 34,
                                          height: 34,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CategoryScreen(
                                            category: EnumCategory.electronics,
                                                pageNumber: 1,
                                          ),
                                        ),
                                      );
                                    },
                                    child: widgetForRowInHomeScreen(
                                        listRow[1], false),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CategoryScreen(
                                            category: EnumCategory.transport,
                                                pageNumber: 2,
                                          ),
                                        ),
                                      );
                                    },
                                    child: widgetForRowInHomeScreen(
                                        listRow[2], false),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CategoryScreen(
                                            category: EnumCategory.furniture,
                                                pageNumber: 3,
                                          ),
                                        ),
                                      );
                                    },
                                    child: widgetForRowInHomeScreen(
                                        listRow[3], false),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CategoryScreen(
                                            category: EnumCategory.electronics,
                                                pageNumber: 4,
                                          ),
                                        ),
                                      );
                                    },
                                    child: widgetForRowInHomeScreen(
                                        listRow[4], false),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CategoryScreen(
                                            category: EnumCategory.transport,
                                                pageNumber: 5,
                                          ),
                                        ),
                                      );
                                    },
                                    child: widgetForRowInHomeScreen(
                                        listRow[5], false),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CategoryScreen(
                                            category: EnumCategory.furniture,
                                                pageNumber: 6,
                                          ),
                                        ),
                                      );
                                    },
                                    child: widgetForRowInHomeScreen(
                                        listRow[6], false),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CategoryScreen(
                                            category: EnumCategory.electronics,
                                                pageNumber: 7,
                                          ),
                                        ),
                                      );
                                    },
                                    child: widgetForRowInHomeScreen(
                                        listRow[7], false),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CategoryScreen(
                                            category: EnumCategory.transport,
                                                pageNumber: 8,
                                          ),
                                        ),
                                      );
                                    },
                                    child: widgetForRowInHomeScreen(
                                        listRow[8], false),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
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
                              itemCount: state.list.length,
                              // controller: scrollController,
                              shrinkWrap: true,
                              itemBuilder: (_, i) {
                                return widgetForGridViewInHomeScreen(
                                  state.list[i],
                                  state.listData[1].name,
                                  context,
                                  () {
                                    bloc.add(
                                      ClickHeartHomeScreen(
                                        listModel: ListModel(
                                          id: state.list[i].id,
                                          description:
                                              state.list[i].description,
                                          image1: state.list[i].image1,
                                          image2: state.list[i].image2,
                                          image3: state.list[i].image3,
                                          image4: state.list[i].image4,
                                          image5: state.list[i].image5,
                                          info: state.list[i].info,
                                          name: state.list[i].name,
                                          phone: state.list[i].phone,
                                          price: state.list[i].price,
                                          userName: state.list[i].userName,
                                          time: state.list[i].time,
                                          departamentName:
                                              state.list[i].departamentName,
                                          isSaved: state.list[i].isSaved == true
                                              ? false
                                              : true,
                                        ),
                                        index: i,
                                        id: state.list[i].id,
                                      ),
                                    );
                                    blocSavedScreen
                                        .add(ChangeDataSavedScreen());
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
