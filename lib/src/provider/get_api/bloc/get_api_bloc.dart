import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_gallery/src/provider/api.dart';

part 'get_api_event.dart';
part 'get_api_state.dart';
part 'get_api_bloc.freezed.dart';

class GetApiBloc extends Bloc<GetApiEvent, GetApiState> {
  GetApiBloc() : super(const _Initial()) {
    on<GetApiEvent>((event, emit) async {
      try {
        if (event is _Started) {
          emit(const _Loading());
          final response = await apiProvider.getData();
          log("Status Code${response.statusCode}");
          if (response.statusCode == 200) {
            List<dynamic> data = json.decode(response.body);
            log("response :- $data");

            emit(_Success(data));
          }
        }
      } catch (e) {
        rethrow;
      }
    });
  }
}

GetApiBloc getApiBloc = GetApiBloc();
