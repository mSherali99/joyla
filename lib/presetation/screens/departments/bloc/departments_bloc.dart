import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'departments_event.dart';
part 'departments_state.dart';

class DepartmentsBloc extends Bloc<DepartmentsEvent, DepartmentsState> {
  DepartmentsBloc() : super(DepartmentsInitial()) {
    on<DepartmentsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
