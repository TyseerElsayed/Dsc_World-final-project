import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dsc_world/ui/global/Theme/app_Theme.dart';
// import 'package:dsc_world/ui/global/Theme/bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial());
  ThemeState get initialState =>
      ThemeState(themeData: appThemeData[AppTheme.light]);

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChanged) {
      yield ThemeState(themeData: appThemeData[event.theme]);
    }
  }
}
