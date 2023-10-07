part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadDataEvent extends HomeEvent {
}

class ClickHeartHomeScreen extends HomeEvent {
  final ListModel listModel;
  final int index;
  final int id;
  ClickHeartHomeScreen({required this.listModel, required this.index, required this.id});
}

class OpenSearchScreenEvent extends HomeEvent{}

class SearchItemHome extends HomeEvent {
  final String searchText;
  SearchItemHome({required this.searchText});
}

class OpenDtailScreenEvetn extends HomeEvent {
  final JoylaModel data;
  OpenDtailScreenEvetn({required this.data});
}

