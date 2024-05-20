import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery/src/constant/screens.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const _Initial()) {
    on<HomeEvent>((event, emit) {
      if (event is _Started) {
        emit(_Success(ScreenNavigation.screensData));
      } else if (event is _Search) {
        emit(const _Loading());
        List<Screens> searchData = ScreenNavigation.screensData
            .where((screen) => screen.fileName
                .replaceAll(" ", "")
                .toLowerCase()
                .contains(event.text.toLowerCase()))
            .toList();
        log("search bloc data$searchData");
        emit(_Success(searchData.toList()));
      }
    });
  }
}

HomeBloc homeBloc = HomeBloc();
