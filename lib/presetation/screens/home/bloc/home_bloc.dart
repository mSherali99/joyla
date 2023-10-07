import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joyla/data/model/joyla_model.dart';
import 'package:joyla/data/source/local/app_database.dart';
import 'package:joyla/data/source/local/dao.dart';

import '../../../../data/model/listI_model.dart';
import '../../../../data/source/api/joyla_api.dart';
import '../../../../data/source/local/floor_entity.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final JoylaApi _api;
  late Dao dao;
  late List<FloorEntity> listGetFloor;

  HomeBloc(this._api) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      switch (event) {
        case LoadDataEvent():
          await _onLoadData(event, emit);
          break;
        case OpenDtailScreenEvetn():
          await _openDetailScreen(event, emit);
          break;
        case OpenSearchScreenEvent():
          await _openSearchScreen(event, emit);
          break;
        case ClickHeartHomeScreen():
          await _clickHeart(event, emit);
          break;
        case SearchItemHome():
          await _searchItem(event, emit);
          break;
      }
    });
  }

  Future<void> _onLoadData(LoadDataEvent event, Emitter<HomeState> emit) async {
    emit(state.copywith(status: EnumState.loading));
    emit(
      HomeState(
          message: state.message,
          status: EnumState.loading,
          offset: state.offset,
          listData: state.listData),
    );
    try {
      final db =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      dao = db.dao;
      final listData = <JoylaModel>[];
      listData.addAll(state.listData);
      listData.addAll(await _api.getAllList());
      final list = <ListModel>[];
      await _addItemInList(listData, list);
      list.shuffle();
      emit(state.copywith(
        status: EnumState.success,
        offset: state.offset + 10,
        listData: listData,
        list: list,
      ));
    } catch (e) {
      emit(
        state.copywith(
            status: EnumState.fail,
            message: "$e",
            listData: state.listData,
            offset: state.offset,
            list: state.list),
      );
    }
  }

  Future<void> _addItemInList(
      List<JoylaModel> listData, List<ListModel> list) async {
    for (int i = 0; i < listData.length; ++i) {
      for (int j = 0; j < listData[i].items.length; ++j) {
        list.add(
          ListModel(
            id: listData[i].items[j].id,
            description: listData[i].items[j].description,
            image1: listData[i].items[j].image1,
            image2: listData[i].items[j].image2,
            image3: listData[i].items[j].image3,
            image4: listData[i].items[j].image4,
            image5: listData[i].items[j].image5,
            info: listData[i].items[j].info,
            name: listData[i].items[j].name,
            phone: listData[i].items[j].phone,
            price: listData[i].items[j].price,
            userName: listData[i].items[j].userName,
            time: listData[i].items[j].time,
            departamentName: listData[i].name,
            isSaved: await _isSaved(listData[i].items[j].id),
          ),
        );
      }
    }
  }

  Future<void> _openDetailScreen(
      OpenDtailScreenEvetn event, Emitter<HomeState> emit) async {}

  Future<void> _openSearchScreen(
      OpenSearchScreenEvent event, Emitter<HomeState> emit) async {}

  Future<void> _clickHeart(
      ClickHeartHomeScreen event, Emitter<HomeState> emit) async {
    if (event.listModel.isSaved) {
      addItem(event.listModel);
    } else {
      deleteItem(event.listModel);
    }
    final list = <ListModel>[];
    for (int i = 0; i < state.list.length; ++i) {
      if (state.list[i].id == event.id) {
        list.add(
          ListModel(
            id: event.id,
            description: state.list[i].description,
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
            departamentName: state.list[i].departamentName,
            isSaved: await _isSaved(event.id),
          ),
        );
      } else {
        list.add(
          ListModel(
            id: state.list[i].id,
            description: state.list[i].description,
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
            departamentName: state.list[i].departamentName,
            isSaved: await _isSaved(state.list[i].id),
          ),
        );
      }
    }
    emit(
      state.copywith(list: list),
    );
  }

  Future<void> deleteItem(ListModel listModel) async {
    await dao.deleteItem(FloorEntity(
      listModel.description,
      listModel.image1,
      listModel.image2,
      listModel.image3,
      listModel.image4,
      listModel.image5,
      listModel.info,
      listModel.name,
      listModel.phone,
      listModel.price,
      listModel.userName,
      listModel.time,
      listModel.id,
    ));
  }

  Future<void> addItem(ListModel listModel) async {
    await dao.addItem(FloorEntity(
      listModel.description,
      listModel.image1,
      listModel.image2,
      listModel.image3,
      listModel.image4,
      listModel.image5,
      listModel.info,
      listModel.name,
      listModel.phone,
      listModel.price,
      listModel.userName,
      listModel.time,
      listModel.id,
    ));
  }

  Future<bool> _isSaved(int index) async {
    try {
      listGetFloor = await dao.getAllItems();
    } catch (e) {
      debugPrint(
          "floordan datalarni olishda xatolik yuz berdi xatolik sababi ---------- $e");
    }
    for (int i = 0; i < listGetFloor.length; ++i) {
      if (listGetFloor[i].id == index) {
        return true;
      }
    }
    return false;
  }

  Future<void> _searchItem(
      SearchItemHome event, Emitter<HomeState> emit) async {
    final listData = <JoylaModel>[];
    listData.addAll(state.listData);
    listData.addAll(await _api.getAllList());
    final List<Item> list = [];
    for (int i = 0; i < listData.length; ++i) {
      list.addAll(listData[i].items);
    }
    final List<Item> searchList = list
        .where((element) =>
            element.name.toLowerCase().contains(event.searchText.toLowerCase()))
        .toList();
    final List<ListModel> stateList = [];
    for (int i = 0; i < searchList.length; ++i) {
      stateList.add(ListModel(
        id: searchList[i].id,
        description: searchList[i].description,
        image1: searchList[i].image1,
        image2: searchList[i].image2,
        image3: searchList[i].image3,
        image4: searchList[i].image4,
        image5: searchList[i].image5,
        info: searchList[i].info,
        name: searchList[i].name,
        phone: searchList[i].phone,
        price: searchList[i].price,
        userName: searchList[i].userName,
        time: searchList[i].time,
        departamentName: searchList[i].userName,
        isSaved: await _isSaved(searchList[i].id),
      ));
    }
    emit(state.copywith(list: stateList));
  }
}
