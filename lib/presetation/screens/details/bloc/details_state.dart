part of 'details_bloc.dart';

@immutable
class DetailsState {

  final List<ListModel> item;

  const DetailsState({
    this.item = const [],
  });

  DetailsState copywith({List<ListModel>? item}) {
    return DetailsState(
      item: item ?? this.item
    );
  }

}
