import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ConstTheme.light);
  upDateTheme() {
    emit(
      (state.brightness == Brightness.dark)
          ? ConstTheme.light
          : ConstTheme.dark,
    );
  }
}
