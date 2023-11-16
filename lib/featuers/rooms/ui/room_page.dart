import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozzok/featuers/rooms/bloc/rooms_bloc.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  final RoomsBloc roomsBloc = RoomsBloc();

  @override
  void initState() {
    roomsBloc.add(RoomsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RoomsBloc, RoomsState>(
        bloc: roomsBloc,
        listenWhen: (previouse, current) => current is RoomsState,
        buildWhen: (previous, current) => current is! RoomsState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case RoomsFetchLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RoomsFetchSuccessfullState:
              final successState = state as RoomsFetchSuccessfullState;

              return Container(
                child: Text(successState.rooms.length.toString()),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
