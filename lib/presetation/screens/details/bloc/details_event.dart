part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent {}

class InitialFloor extends DetailsEvent {}

class ClickHeartInDetailesScreen extends DetailsEvent {
  final ListModel listModel;
  final bool isSaved;
  ClickHeartInDetailesScreen({required this.listModel, required this.isSaved});
}
