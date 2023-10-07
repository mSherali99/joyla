part of 'save_bloc.dart';

@immutable
abstract class SaveEvent {}

class LoadDataSavedScreen extends SaveEvent {}

class PullDownSavedScreen extends SaveEvent {}

class ChangeDataSavedScreen extends SaveEvent {}

class ClickHeartSavedScreen extends SaveEvent {
  final ListModel listModel;
  ClickHeartSavedScreen({required this.listModel});
}
