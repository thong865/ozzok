import 'dart:convert';
import 'dart:developer';
import 'package:ozzok/featuers/rooms/model/rooms_model.dart';
import 'package:dio/dio.dart';

class RoomRepo {
  static Future<List<RoomDataModel>> fetchRooms() async {
    final dio = Dio();
    List<RoomDataModel> rooms = [];

    try {
      var response =
          await dio.get('https://jsonplaceholder.typicode.com/todos/1');
      // List result = jsonDecode(response.data);
      // for (int i = 0; i < result.length; i++) {
      //   RoomDataModel room =
      //       RoomDataModel.fromJson(result[i] as Map<String, dynamic>);
      //   rooms.add(room);
      // }
      print(response);
      return rooms;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
