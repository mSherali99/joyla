part of 'category_bloc.dart';

@immutable
class CategoryState {
  final List<ListModel> listItem;
  final String message;
  final String categoryName;

  const CategoryState({
    this.listItem = const [],
    this.message = "",
    this.categoryName = "",
  });

  CategoryState copywith({
    List<ListModel>? listItem,
    String? message,
    String? categoryName,
  }) {
    return CategoryState(
      listItem: listItem ?? this.listItem,
      message: message ?? this.message,
      categoryName: categoryName ?? this.categoryName,
    );
  }
}
