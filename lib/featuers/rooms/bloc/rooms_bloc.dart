import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ozzok/featuers/rooms/model/rooms_model.dart';
import 'package:ozzok/featuers/rooms/reposity/room_repository.dart';

part 'rooms_event.dart';
part 'rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  RoomsBloc() : super(RoomsInitial()) {
    on<RoomsInitialFetchEvent>(roomsInitialFetchEvent);
  }
  FutureOr<void> roomsInitialFetchEvent(
      RoomsInitialFetchEvent event, Emitter<RoomsState> emit) async {
    List<RoomDataModel> rooms = await RoomRepo.fetchRooms();
    print('-> ROOMBLOC');
    print(rooms);
    emit(RoomsFetchSuccessfullState(rooms: rooms));
  }
}
