part of 'save_bloc.dart';

@immutable
class SaveState {

  final List<FloorEntity> allItemFloor;
  final String message;

  const SaveState({this.allItemFloor = const [],
    this.message = "",});

  SaveState copywith({List<FloorEntity>? allItemFloor, String? message}){
    return SaveState(
      allItemFloor: allItemFloor ?? this.allItemFloor,
      message: message ?? this.message,
    );
  }


}

