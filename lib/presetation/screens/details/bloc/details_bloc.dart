import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:joyla/data/source/local/app_database.dart';
import 'package:meta/meta.dart';

import '../../../../data/model/listI_model.dart';
import '../../../../data/model/listI_model.dart';
import '../../../../data/model/listI_model.dart';
import '../../../../data/model/listI_model.dart';
import '../../../../data/model/listI_model.dart';
import '../../../../data/model/listI_model.dart';
import '../../../../data/model/listI_model.dart';
import '../../../../data/model/listI_model.dart';
import '../../../../data/model/listI_model.dart';
import '../../../../data/model/listI_model.dart';
import '../../../../data/source/local/dao.dart';
import '../../../../data/source/local/floor_entity.dart';

part 'details_event.dart';

part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  late Dao dao;
  late List<FloorEntity> itemList;


  DetailsBloc() : super(DetailsState()) {
    on<DetailsEvent>((event, emit) async {
      switch (event) {
        case InitialFloor():
          await _initialFloor();
          break;
        case ClickHeartInDetailesScreen():
          await _clickHeart(emit, event);
          break;
      }
    });
  }

  Future<void> _initialFloor() async {
    final db =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    dao = db.dao;
    itemList = await dao.getAllItems();
  }

  Future<void> _clickHeart(
      Emitter<DetailsState> emit, ClickHeartInDetailesScreen event) async {
    if (event.isSaved) {
      _deleteItemInFloor(event.listModel);
    } else {
      _addItemToFloor(event.listModel);
    }
  }

  Future<void> _deleteItemInFloor(ListModel item) async {
    await dao.deleteItem(
      FloorEntity(
        item.description,
        item.image1,
        item.image2,
        item.image3,
        item.image4,
        item.image5,
        item.info,
        item.name,
        item.phone,
        item.price,
        item.userName,
        item.time,
        item.id,
      ),
    );
  }

  Future<void> _addItemToFloor(ListModel item) async {
    await dao.addItem(FloorEntity(
      item.description,
      item.image1,
      item.image2,
      item.image3,
      item.image4,
      item.image5,
      item.info,
      item.name,
      item.phone,
      item.price,
      item.userName,
      item.time,
      item.id,
    ));
  }
}
