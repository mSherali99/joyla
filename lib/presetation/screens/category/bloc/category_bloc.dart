import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:joyla/data/model/joyla_model.dart';
import 'package:joyla/data/model/listI_model.dart';
import 'package:joyla/data/source/local/app_database.dart';
import 'package:joyla/presetation/screens/category/category_screen.dart';
import 'package:joyla/presetation/screens/home/bloc/home_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/source/api/joyla_api.dart';
import '../../../../data/source/local/dao.dart';
import '../../../../data/source/local/floor_entity.dart';
import '../../../../utils/utils.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final EnumCategory _category;
  final JoylaApi _api;
  late final Dao dao;
  late List<FloorEntity> allItemsFloor;

  CategoryBloc(this._category, this._api) : super(const CategoryState()) {
    on<CategoryEvent>((event, emit) async {
      switch (event) {
        case LoadDataCategoryScreen():
          await _loadDataCategory(event, emit);
          break;
        case ClickCategoryItem():
          await _clickCategoryItem(event, emit);
          break;
        case ClickHeartCategoryScreen():
          await _clickHeartCategory(event, emit);
          break;
        case SearchItemCategory():
          await _searchItemCategory(event, emit);
          break;
      }
    });
  }

  Future<void> _loadDataCategory(LoadDataCategoryScreen event,
      Emitter<CategoryState> emit) async {
    try {
      final db = await $FloorAppDatabase.databaseBuilder('app_database.db')
          .build();
      dao = db.dao;
      final listData = <JoylaModel>[];
      listData.addAll(await _api.getAllList());
      switch (_category) {
        case EnumCategory.electronics:
          await _electronics(listData);
          break;
        case EnumCategory.transport:
          await _transport(listData);
          break;
        case EnumCategory.furniture:
          await _furniture(listData);
          break;
        case EnumCategory.realEstate:
          await _realEstate(listData);
          break;
        case EnumCategory.forChildren:
          await _forChildren(listData);
          break;
        case EnumCategory.fashionBeaty:
          await _fashionBeaty(listData);
          break;
        case EnumCategory.home:
          await _home(listData);
          break;
        case EnumCategory.hobby:
          await _hobby(listData);
          break;
      }
    } catch (e) {
      emit(state.copywith(message: "error   ------------------   $e"));
    }
  }

  Future<void> _clickCategoryItem(ClickCategoryItem event,
      Emitter<CategoryState> emit) async {}

  Future<void> _clickHeartCategory(ClickHeartCategoryScreen event,
      Emitter<CategoryState> emit) async {
    if (event.listModel.isSaved) {
      await _addItem(event.listModel);
    } else {
      await _deleteItem(event.listModel);
    }
    allItemsFloor = await dao.getAllItems();
    final list = <ListModel>[];

    for (int i = 0; i < allItemsFloor.length; ++i) {
      list.add(ListModel(
        id: allItemsFloor[i].id,
        description: allItemsFloor[i].description,
        image1: allItemsFloor[i].image1,
        image2: allItemsFloor[i].image2,
        image3: allItemsFloor[i].image3,
        image4: allItemsFloor[i].image4,
        image5: allItemsFloor[i].image5,
        info: allItemsFloor[i].info,
        name: allItemsFloor[i].name,
        phone: allItemsFloor[i].phone,
        price: allItemsFloor[i].price,
        userName: allItemsFloor[i].userName,
        time: allItemsFloor[i].time,
        departamentName: allItemsFloor[i].description,
        isSaved: await _isSaved(allItemsFloor[i].id),));
    }
  }

  Future<void> _addItem(ListModel listModel) async {
    await dao.addItem(
        FloorEntity(
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
          listModel.id,)
    );
  }

  Future<void> _deleteItem(ListModel listModel) async {
    await dao.deleteItem(
        FloorEntity(
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
          listModel.id,)
    );
  }

  Future<void> _electronics(List<JoylaModel> listData) async {
    final list = <ListModel>[];
    for (int i = 0; i < listData.length; ++i) {
      if (listData[i].name == "Elektronika") {
        await addListItem(list, listData, i);
        emit(state.copywith(listItem: list));
        return;
      }
    }
  }

  Future<void> _transport(List<JoylaModel> listData) async {
    final list = <ListModel>[];
    for (int i = 0; i < listData.length; ++i) {
      if (listData[i].name == "Transport") {
        await addListItem(list, listData, i);
        emit(state.copywith(listItem: list));
        return;
      }
    }
  }

  Future<void> _furniture(List<JoylaModel> listData) async {
    final list = <ListModel>[];
    for (int i = 0; i < listData.length; ++i) {
      if (listData[i].name == "Mebel") {
        await addListItem(list, listData, i);
        emit(state.copywith(listItem: list));
        return;
      }
    }
  }

  Future<void> _realEstate(List<JoylaModel> listData) async {
    final list = <ListModel>[];
    for (int i = 0; i < listData.length; ++i) {
      if (listData[i].name == "Ko'chmas mulk") {
        await addListItem(list, listData, i);
        emit(state.copywith(listItem: list));
        return;
      }
    }
  }

  Future<void> _forChildren(List<JoylaModel> listData) async {
    final list = <ListModel>[];
    for (int i = 0; i < listData.length; ++i) {
      if (listData[i].name == "Bolalar uchun") {
        await addListItem(list, listData, i);
        emit(state.copywith(listItem: list));
        return;
      }
    }
  }

  Future<void> _fashionBeaty(List<JoylaModel> listData) async {
    final list = <ListModel>[];
    for (int i = 0; i < listData.length; ++i) {
      if (listData[i].name == "Moda-Go'zallik") {
        await addListItem(list, listData, i);
        emit(state.copywith(listItem: list));
        return;
      }
    }
  }

  Future<void> _home(List<JoylaModel> listData) async {
    final list = <ListModel>[];
    for (int i = 0; i < listData.length; ++i) {
      if (listData[i].name == "Uy va bog'") {
        await addListItem(list, listData, i);
        emit(state.copywith(listItem: list));
        return;
      }
    }
  }

  Future<void> _hobby(List<JoylaModel> listData) async {
    final list = <ListModel>[];
    for (int i = 0; i < listData.length; ++i) {
      if (listData[i].name == "Fitnes Hobbi") {
        await addListItem(list, listData, i);
        emit(state.copywith(listItem: list));
        return;
      }
    }
  }

  Future<void> addListItem(List<ListModel> list, List<JoylaModel> listData,
      int index) async {
    for (int i = 0; i < listData[index].items.length; ++i) {
      list.add(ListModel(
        id: listData[index].items[i].id,
        description: listData[index].items[i].description,
        image1: listData[index].items[i].image1,
        image2: listData[index].items[i].image2,
        image3: listData[index].items[i].image3,
        image4: listData[index].items[i].image4,
        image5: listData[index].items[i].image5,
        info: listData[index].items[i].info,
        name: listData[index].items[i].name,
        phone: listData[index].items[i].phone,
        price: listData[index].items[i].price,
        userName: listData[index].items[i].userName,
        time: listData[index].items[i].time,
        departamentName: listData[index].items[i].description,
        isSaved: await _isSaved(listData[index].items[i].id),
      ));
    }
  }

  Future<bool> _isSaved(int index) async {
    allItemsFloor = await dao.getAllItems();
    for (int i = 0; i < allItemsFloor.length; ++i) {
      if (index == allItemsFloor[i].id) {
        return true;
      }
    }
    return false;
  }

  Future<void> _searchItemCategory(SearchItemCategory event, Emitter<CategoryState> emit) async {}


}
