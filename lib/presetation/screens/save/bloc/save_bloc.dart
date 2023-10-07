import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:joyla/data/model/listI_model.dart';
import 'package:joyla/data/source/local/app_database.dart';
import 'package:meta/meta.dart';

import '../../../../data/source/local/dao.dart';
import '../../../../data/source/local/floor_entity.dart';

part 'save_event.dart';

part 'save_state.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  late final Dao dao;
  late List<FloorEntity> listItems;

  SaveBloc() : super(const SaveState()) {
    on<SaveEvent>((event, emit) async {
      switch (event) {
        case LoadDataSavedScreen():
          await _loadDtata(event, emit);
          break;
        case PullDownSavedScreen():
          await _pullDown(event, emit);
          break;
        case ChangeDataSavedScreen():
          await _changeData(event, emit);
          break;
        case ClickHeartSavedScreen():
          await _clickHeratSavedScreen(event, emit);
          break;
      }
    });
  }

  Future<void> _loadDtata(LoadDataSavedScreen event,
      Emitter<SaveState> emit) async {
    try {
      final db =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      dao = db.dao;
      listItems = await dao.getAllItems();
      emit(state.copywith(allItemFloor: listItems));
    } catch (e) {
      debugPrint(" -...- ");
    }
  }

  Future<void> _pullDown(PullDownSavedScreen event,
      Emitter<SaveState> emit) async {
    listItems = await dao.getAllItems();
    emit(state.copywith(
      allItemFloor: listItems,
    ));
  }

  Future<void> _changeData(ChangeDataSavedScreen event,
      Emitter<SaveState> emit) async {
    listItems = await dao.getAllItems();
    emit(state.copywith(allItemFloor: listItems));
  }

  Future<void> _clickHeratSavedScreen(ClickHeartSavedScreen event,
      Emitter<SaveState> emit) async {
    await dao.deleteItem(
        FloorEntity(
          event.listModel.description,
          event.listModel.image1,
          event.listModel.image2,
          event.listModel.image3,
          event.listModel.image4,
          event.listModel.image5,
          event.listModel.info,
          event.listModel.name,
          event.listModel.phone,
          event.listModel.price,
          event.listModel.userName,
          event.listModel.time,
          event.listModel.id,)
    );
    listItems = await dao.getAllItems();
    emit(state.copywith(allItemFloor: listItems));
  }

}

