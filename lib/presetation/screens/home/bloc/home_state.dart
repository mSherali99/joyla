part of 'home_bloc.dart';

@immutable
class HomeState {
  final EnumState status;
  final List<JoylaModel> listData;
  final String message;
  final List<ListModel> list;
  final int offset;

  const HomeState({
    this.status = EnumState.inital,
    this.listData = const [],
    this.message = "",
    this.list = const [],
    this.offset = 0,
  });

  HomeState copywith(
  {EnumState? status, List<JoylaModel>? listData, String? message, List<ListModel>? list, int? offset}
      ) {
    return HomeState(
      status: status ?? this.status,
      listData: listData ?? this.listData,
      message: message ?? this.message,
      list: list ?? this.list,
      offset: offset ?? this.offset
    );
  }

}
enum EnumState{inital, fail, success, loading}
