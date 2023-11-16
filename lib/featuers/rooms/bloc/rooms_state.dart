part of 'rooms_bloc.dart';

@immutable
abstract class RoomsState {}

class RoomsInitial extends RoomsState {}

class RoomsFetchLoadingState extends RoomsState {}

class RoomsFetchErrorState extends RoomsState {}

class RoomsFetchSuccessfullState extends RoomsState {
  final List<RoomDataModel> rooms;
  RoomsFetchSuccessfullState({
    required this.rooms,
  });
}
