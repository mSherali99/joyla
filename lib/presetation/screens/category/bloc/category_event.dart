part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class LoadDataCategoryScreen extends CategoryEvent {
  final EnumCategory enumCategory;
  LoadDataCategoryScreen({required this.enumCategory});
}

class ClickCategoryItem extends CategoryEvent {}

class SearchItemCategory extends CategoryEvent {
  final String seachText;
  SearchItemCategory({required this.seachText});
}

class ClickHeartCategoryScreen extends CategoryEvent {
  final ListModel listModel;
  final int index;
  final int id;
  ClickHeartCategoryScreen({required this.listModel, required this.index, required this.id});
}
