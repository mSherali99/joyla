import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joyla/data/model/listI_model.dart';
import 'package:joyla/data/source/local/app_database.dart';
import 'package:joyla/data/source/local/dao.dart';
import 'package:joyla/data/source/local/floor_entity.dart';
import 'package:joyla/presetation/screens/details/details_screen.dart';
import 'package:joyla/presetation/screens/home/home_screen.dart';
import 'package:joyla/utils/utils.dart';

import '../../widgets/widget_for_savedscreen.dart';
import 'bloc/save_bloc.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final bloc = SaveBloc();
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc;
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveBloc, SaveState>(
      bloc: bloc..add(LoadDataSavedScreen()),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 120,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blue,
            title: Container(
              margin: const EdgeInsets.only(left: 16),
              child: const Text(
                "Saved",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 0.02,
                  letterSpacing: 0.70,
                ),
              ),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: _refreshData,
            child: Builder(builder: (context) {
              if (state.allItemFloor.isEmpty) {
                return Container(
                  margin: EdgeInsets.only(top: hg(context) * 0.15),
                  width: wd(context),
                  height: hg(context) * 0.74,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/poisk.svg",
                        width: 128,
                        height: 128,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: Text(
                          "No result found",
                          style: TextStyle(
                            color: Color(0xFF004C6F),
                            fontSize: 32,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w900,
                            height: 0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: SizedBox(
                          width: wd(context) * 0.7,
                          child: const Text(
                            "it seems there is something wrong with your conncection. Please check your internet connection and try again",
                            style: TextStyle(
                              color: Color(0xFF004C6F),
                              fontSize: 20,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Container(
                color: Colors.blue.withOpacity(0.1),
                width: wd(context),
                height: hg(context) * 0.74,
                child: ListView.builder(
                    itemCount: state.allItemFloor.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    controller: controller,
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                  items: ListModel(
                                    id: state.allItemFloor[i].id,
                                    description:
                                        state.allItemFloor[i].description,
                                    image1: state.allItemFloor[i].image1,
                                    image2: state.allItemFloor[i].image2,
                                    image3: state.allItemFloor[i].image3,
                                    image4: state.allItemFloor[i].image4,
                                    image5: state.allItemFloor[i].image5,
                                    info: state.allItemFloor[i].info,
                                    name: state.allItemFloor[i].name,
                                    phone: state.allItemFloor[i].phone,
                                    price: state.allItemFloor[i].price,
                                    userName: state.allItemFloor[i].userName,
                                    time: state.allItemFloor[i].time,
                                    departamentName:
                                        state.allItemFloor[i].userName,
                                    isSaved: true,
                                  ),
                                  nextPage: 2),
                            ),
                          );
                        },
                        child: widgetForSavedScreen(
                          context,
                          state.allItemFloor[i],
                          () {
                            bloc.add(ClickHeartSavedScreen(
                                listModel: ListModel(
                              id: state.allItemFloor[i].id,
                              description: state.allItemFloor[i].description,
                              image1: state.allItemFloor[i].image1,
                              image2: state.allItemFloor[i].image2,
                              image3: state.allItemFloor[i].image3,
                              image4: state.allItemFloor[i].image4,
                              image5: state.allItemFloor[i].image5,
                              info: state.allItemFloor[i].info,
                              name: state.allItemFloor[i].name,
                              phone: state.allItemFloor[i].phone,
                              price: state.allItemFloor[i].price,
                              userName: state.allItemFloor[i].userName,
                              time: state.allItemFloor[i].time,
                              departamentName:
                                  state.allItemFloor[i].description,
                              isSaved: false,
                            )));
                          },
                        ),
                      );
                    }),
              );
            }),
          ),
        );
      },
    );
  }

  Future<void> _refreshData() async {
    bloc.add(PullDownSavedScreen());
    await Future.delayed(const Duration(milliseconds: 1500));
  }
}
